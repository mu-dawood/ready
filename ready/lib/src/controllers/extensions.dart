part of controllers;

typedef TotalCountResolver = int Function(
    int currentTotalCount, int difference);
int _defaultResolver(int current, int difference) => current + difference;

extension ReadyListStateExt<T, S extends ICopyWith<T, S>>
    on ReadyListController<T, S> {
  int diff(int original, int current) {
    return current - original;
  }

  /// Adds [value] to the end of this list,
  /// extending the length by one.
  ///
  /// The list must be growable.
  S add(T value, [TotalCountResolver totalCountResolver = _defaultResolver]) {
    return state.copyWith(
      items: [...state.items, value],
      totalCount: totalCountResolver(state.totalCount, 1),
    );
  }

  /// Appends all objects of [iterable] to the end of this list.
  ///
  /// Extends the length of the list by the number of objects in [iterable].
  /// The list must be growable.
  S addAll(Iterable<T> iterable,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    return state.copyWith(
      items: [...state.items, ...iterable],
      totalCount: totalCountResolver(state.totalCount, iterable.length),
    );
  }

  /// Inserts [element] at position [index] in this list.
  ///
  /// This increases the length of the list by one and shifts all objects
  /// at or after the index towards the end of the list.
  ///
  /// The list must be growable.
  /// The [index] value must be non-negative and no greater than [length].
  S insert(int index, T element,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    var current = state.items;
    List<T> data = current is List<T> ? current : current.toList();
    data.insert(index, element);
    return state.copyWith(
      items: data,
      totalCount: totalCountResolver(state.totalCount, 1),
    );
  }

  /// Inserts all objects of [iterable] at position [index] in this list.
  ///
  /// This increases the length of the list by the length of [iterable] and
  /// shifts all later objects towards the end of the list.
  ///
  /// The list must be growable.
  /// The [index] value must be non-negative and no greater than [length].
  S insertAll(int index, Iterable<T> iterable,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    var current = state.items;
    List<T> data = current is List<T> ? current : current.toList();
    data.insertAll(index, iterable);
    return state.copyWith(
      items: data,
      totalCount: totalCountResolver(state.totalCount, iterable.length),
    );
  }

  /// Removes the first occurrence of [value] from this list.
  ///
  /// Returns true if [value] was in the list, false otherwise.
  /// The list must be growable.
  ///
  /// ```dart
  /// final parts = <String>['head', 'shoulders', 'knees', 'toes'];
  /// final retVal = parts.remove('head'); // true
  /// print(parts); // [shoulders, knees, toes]
  S remove(T value,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    var current = state.items;
    List<T> data = current is List<T> ? current : current.toList();
    var oldLength = data.length;
    data.remove(value);
    var newLength = data.length;
    return state.copyWith(
      items: data,
      totalCount:
          totalCountResolver(state.totalCount, diff(oldLength, newLength)),
    );
  }

  /// Removes a range of elements from the list.
  ///
  /// Removes the elements with positions greater than or equal to [start]
  /// and less than [end], from the list.
  /// This reduces the list's length by `end - start`.
  ///
  /// The provided range, given by [start] and [end], must be valid.
  /// A range from [start] to [end] is valid if 0 ≤ `start` ≤ `end` ≤ [length].
  /// An empty range (with `end == start`) is valid.
  ///
  /// The list must be growable.
  S removeRange(int start, int end,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    var current = state.items;
    List<T> data = current is List<T> ? current : current.toList();
    var oldLength = data.length;
    data.removeRange(start, end);
    var newLength = data.length;
    return state.copyWith(
      items: data,
      totalCount:
          totalCountResolver(state.totalCount, diff(oldLength, newLength)),
    );
  }

  /// Removes a range of elements from the list.
  ///
  /// Removes the elements with positions greater than or equal to [start]
  /// and less than [end], from the list.
  /// This reduces the list's length by `end - start`.
  ///
  /// The provided range, given by [start] and [end], must be valid.
  /// A range from [start] to [end] is valid if 0 ≤ `start` ≤ `end` ≤ [length].
  /// An empty range (with `end == start`) is valid.
  ///
  /// The list must be growable.
  S removeWhere(bool Function(T) test,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    var current = state.items;
    List<T> data = current is List<T> ? current : current.toList();
    var oldLength = data.length;
    data.removeWhere(test);
    var newLength = data.length;
    return state.copyWith(
      items: data,
      totalCount:
          totalCountResolver(state.totalCount, diff(oldLength, newLength)),
    );
  }

  /// Removes and returns the last object in this list.
  ///
  /// The list must be growable and non-empty.
  S removeLast([TotalCountResolver totalCountResolver = _defaultResolver]) {
    var current = state.items;
    List<T> data = current is List<T> ? current : current.toList();
    var oldLength = data.length;
    data.removeLast();
    var newLength = data.length;
    return state.copyWith(
      items: data,
      totalCount:
          totalCountResolver(state.totalCount, diff(oldLength, newLength)),
    );
  }

  /// Removes the object at position [index] from this list.
  ///
  /// This method reduces the length of `this` by one and moves all later objects
  /// down by one position.
  ///
  /// The list must be growable.
  S removeAt(int index,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    if (index >= state.items.length) return state;
    var current = state.items;
    List<T> data = current is List<T> ? current : current.toList();
    var oldLength = data.length;
    data.removeAt(index);
    var newLength = data.length;
    return state.copyWith(
      items: data,
      totalCount:
          totalCountResolver(state.totalCount, diff(oldLength, newLength)),
    );
  }

  /// Returns a new lazy [Iterable] with all elements that satisfy the
  /// predicate [test].
  ///
  /// The matching elements have the same order in the returned iterable
  /// as they have in [iterator].
  ///
  /// This method returns a view of the mapped elements.
  /// As long as the returned [Iterable] is not iterated over,
  /// the supplied function [test] will not be invoked.
  /// Iterating will not cache results, and thus iterating multiple times over
  /// the returned [Iterable] may invoke the supplied
  /// function [test] multiple times on the same element.
  S where(bool Function(T) test,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    var current = state.items;
    List<T> data = current is List<T> ? current : current.toList();
    var oldLength = data.length;
    var newData = data.where(test);
    var newLength = newData.length;
    return state.copyWith(
      items: newData,
      totalCount:
          totalCountResolver(state.totalCount, diff(oldLength, newLength)),
    );
  }

  /// Returns an [Iterable] that provides all but the first [count] elements.
  ///
  /// When the returned iterable is iterated, it starts iterating over `this`,
  /// first skipping past the initial [count] elements.
  /// If `this` has fewer than `count` elements, then the resulting Iterable is
  /// empty.
  /// After that, the remaining elements are iterated in the same order as
  /// in this iterable.
  ///
  /// Some iterables may be able to find later elements without first iterating
  /// through earlier elements, for example when iterating a [List].
  /// Such iterables are allowed to ignore the initial skipped elements.
  S skip(int count,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    var oldLength = state.items.length;
    var newData = state.items.skip(count);
    return state.copyWith(
      items: newData,
      totalCount:
          totalCountResolver(state.totalCount, diff(oldLength, newData.length)),
    );
  }

  /// Returns an `Iterable` that skips leading elements while [test] is satisfied.
  ///
  /// The filtering happens lazily. Every new [Iterator] of the returned
  /// iterable iterates over all elements of `this`.
  ///
  /// The returned iterable provides elements by iterating this iterable,
  /// but skipping over all initial elements where `test(element)` returns
  /// true. If all elements satisfy `test` the resulting iterable is empty,
  /// otherwise it iterates the remaining elements in their original order,
  /// starting with the first element for which `test(element)` returns `false`.
  S skipWhile(bool Function(T) test,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    var oldLength = state.items.length;
    var newData = state.items.skipWhile(test);
    return state.copyWith(
      items: newData,
      totalCount:
          totalCountResolver(state.totalCount, diff(oldLength, newData.length)),
    );
  }

  /// Returns a lazy iterable of the [count] first elements of this iterable.
  ///
  /// The returned `Iterable` may contain fewer than `count` elements, if `this`
  /// contains fewer than `count` elements.
  ///
  /// The elements can be computed by stepping through [iterator] until [count]
  /// elements have been seen.
  ///
  /// The `count` must not be negative.
  S take(int count,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    var oldLength = state.items.length;
    var newData = state.items.take(count);
    return state.copyWith(
      items: newData,
      totalCount:
          totalCountResolver(state.totalCount, diff(oldLength, newData.length)),
    );
  }

  /// Returns a lazy iterable of the leading elements satisfying [test].
  ///
  /// The filtering happens lazily. Every new iterator of the returned
  /// iterable starts iterating over the elements of `this`.
  ///
  /// The elements can be computed by stepping through [iterator] until an
  /// element is found where `test(element)` is false. At that point,
  /// the returned iterable stops (its `moveNext()` returns false).
  S takeWhile(bool Function(T) test,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    var oldLength = state.items.length;
    var newData = state.items.takeWhile(test);
    return state.copyWith(
      items: newData,
      totalCount:
          totalCountResolver(state.totalCount, diff(oldLength, newData.length)),
    );
  }

  /// Expands each element of this [Iterable] into zero or more elements.
  ///
  /// The resulting Iterable runs through the elements returned
  /// by [toElements] for each element of this, in iteration order.
  ///
  /// The returned [Iterable] is lazy, and calls [toElements] for each element
  /// of this iterable every time the returned iterable is iterated.
  ///
  /// Equivalent to:
  /// ```
  /// Iterable<T> expand<T>(Iterable<T> toElements(E e)) sync* {
  ///   for (var value in this) {
  ///     yield* toElements(value);
  ///   }
  /// }
  S expand(Iterable<T> Function(T) toElements,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    var oldLength = state.items.length;
    var newData = state.items.expand(toElements);
    return state.copyWith(
      items: newData,
      totalCount:
          totalCountResolver(state.totalCount, diff(oldLength, newData.length)),
    );
  }

  /// Returns the lazy concatenation of this iterable and [other].
  ///
  /// The returned iterable will provide the same elements as this iterable,
  /// and, after that, the elements of [other], in the same order as in the
  /// original iterables.
  S followedBy(Iterable<T> other,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    var oldLength = state.items.length;
    var newData = state.items.followedBy(other);
    return state.copyWith(
      items: newData,
      totalCount:
          totalCountResolver(state.totalCount, diff(oldLength, newData.length)),
    );
  }

  /// The current elements of this iterable modified by [toElement].
  ///
  /// Returns a new lazy [Iterable] with elements that are created by
  /// calling `toElement` on each element of this `Iterable` in
  /// iteration order.
  ///
  /// The returned iterable is lazy, so it won't iterate the elements of
  /// this iterable until it is itself iterated, and then it will apply
  /// [toElement] to create one element at a time.
  /// The converted elements are not cached.
  /// Iterating multiple times over the returned [Iterable]
  /// will invoke the supplied [toElement] function once per element
  /// for on each iteration.
  ///
  /// Methods on the returned iterable are allowed to omit calling `toElement`
  /// on any element where the result isn't needed.
  /// For example, [elementAt] may call `toElement` only once.
  ///
  /// Equivalent to:
  /// ```
  /// Iterable<T> map<T>(T toElement(E e)) sync* {
  ///   for (var value in this) {
  ///     yield toElement(value);
  ///   }
  /// }
  S map(T Function(T) toElement) {
    return state.copyWith(items: state.items.map(toElement));
  }

  /// replace items where test return `true`
  S replaceWhere({required bool Function(T) where, required T item}) {
    return state.copyWith(
        items: state.items.map((old) => where(old) ? item : old));
  }

  /// Whether this collection has no elements.
  ///
  /// May be computed by checking if `iterator.moveNext()` returns `false`.
  bool get isEmpty => state.items.isEmpty;

  /// Whether this collection has at least one element.
  ///
  /// May be computed by checking if `iterator.moveNext()` returns `true`.
  bool get isNotEmpty => state.items.isNotEmpty;

  /// Returns the first element.
  ///
  /// Throws a [StateError] if `this` is empty.
  /// Otherwise returns the first element in the iteration order,
  /// equivalent to `this.elementAt(0)`.
  T get first => state.items.first;

  /// Returns the last element.
  ///
  /// Throws a [StateError] if `this` is empty.
  /// Otherwise may iterate through the elements and returns the last one
  /// seen.
  /// Some iterables may have more efficient ways to find the last element
  /// (for example a list can directly access the last element,
  /// without iterating through the previous ones).
  T get last => state.items.last;

  /// Returns the number of elements in [this].
  ///
  /// Counting all elements may involve iterating through all elements and can
  /// therefore be slow.
  /// Some iterables have a more efficient way to find the number of elements.
  int get length => state.items.length;

  /// Checks that this iterable has only one element, and returns that element.
  ///
  /// Throws a [StateError] if `this` is empty or has more than one element.
  T get single => state.items.single;

  /// Invokes [action] on each element of this iterable in iteration order.
  void forEach(void Function(T) action) {
    state.items.forEach(action);
  }

  /// Invokes [action] on each element of this iterable in iteration order.
  void forEachIndex(void Function(int i, T item) action) {
    for (var i = 0; i < state.items.length; i++) {
      action(i, state.items.elementAt(i));
    }
  }

  /// Checks whether any element of this iterable satisfies [test].
  ///
  /// Checks every element in iteration order, and returns `true` if
  /// any of them make [test] return `true`, otherwise returns false.
  bool any(bool Function(T) test) {
    return state.items.any(test);
  }

  /// Checks whether every element of this iterable satisfies [test].
  ///
  /// Checks every element in iteration order, and returns `false` if
  /// any of them make [test] return `false`, otherwise returns `true`.
  bool every(bool Function(T) test) {
    return state.items.every(test);
  }

  /// Returns the first element that satisfies the given predicate [test].
  ///
  /// Iterates through elements and returns the first to satisfy [test].
  T firstWhere(bool Function(T) test, {T Function()? orElse}) {
    return state.items.firstWhere(test, orElse: orElse);
  }

  /// Returns the single element that satisfies [test].
  ///
  /// Checks elements to see if `test(element)` returns true.
  /// If exactly one element satisfies [test], that element is returned.
  /// If more than one matching element is found, throws [StateError].
  /// If no matching element is found, returns the result of [orElse].
  /// If [orElse] is omitted, it defaults to throwing a [StateError].
  T singleWhere(bool Function(T) test, {T Function()? orElse}) {
    return state.items.singleWhere(test, orElse: orElse);
  }

  /// Returns the last element that satisfies the given predicate [test].
  ///
  /// An iterable that can access its elements directly may check its
  /// elements in any order (for example a list starts by checking the
  /// last element and then moves towards the start of the list).
  /// The default implementation iterates elements in iteration order,
  /// checks `test(element)` for each,
  /// and finally returns that last one that matched.
  T lastWhere(bool Function(T) test, {T Function()? orElse}) {
    return state.items.lastWhere(test, orElse: orElse);
  }

  /// Whether the collection contains an element equal to [element].
  ///
  /// This operation will check each element in order for being equal to
  /// [element], unless it has a more efficient way to find an element
  /// equal to [element].
  ///
  /// The equality used to determine whether [element] is equal to an element of
  /// the iterable defaults to the [Object.==] of the element.
  ///
  /// Some types of iterable may have a different equality used for its elements.
  /// For example, a [Set] may have a custom equality
  /// (see [Set.identity]) that its `contains` uses.
  /// Likewise the `Iterable` returned by a [Map.keys] call
  /// should use the same equality that the `Map` uses for keys.
  bool contains(T object) {
    return state.items.contains(object);
  }

  /// Returns the [index]th element.
  ///
  /// The [index] must be non-negative and less than [length].
  /// Index zero represents the first element (so `iterable.elementAt(0)` is
  /// equivalent to `iterable.first`).
  ///
  /// May iterate through the elements in iteration order, ignoring the
  /// first [index] elements and then returning the next.
  /// Some iterables may have a more efficient way to find the element.
  T elementAt(int index) {
    return state.items.elementAt(index);
  }

  /// Reduces a collection to a single value by iteratively combining each
  /// element of the collection with an existing value
  ///
  /// Uses [initialValue] as the initial value,
  /// then iterates through the elements and updates the value with
  /// each element using the [combine] function, as if by:
  /// ```
  /// var value = initialValue;
  /// for (E element in this) {
  ///   value = combine(value, element);
  /// }
  /// return value;
  R fold<R>(R initialValue, R Function(R, T) combine) {
    return state.items.fold(initialValue, combine);
  }

  /// Reduces a collection to a single value by iteratively combining elements
  /// of the collection using the provided function.
  ///
  /// The iterable must have at least one element.
  /// If it has only one element, that element is returned.
  ///
  /// Otherwise this method starts with the first element from the iterator,
  /// and then combines it with the remaining elements in iteration order,
  /// as if by:
  /// ```
  /// E value = iterable.first;
  /// iterable.skip(1).forEach((element) {
  ///   value = combine(value, element);
  /// });
  /// return value;
  T reduce(T Function(T, T) combine) {
    return state.items.reduce(combine);
  }

  /// Creates a [Set] containing the same elements as this iterable.
  ///
  /// The set may contain fewer elements than the iterable,
  /// if the iterable contains an element more than once,
  /// or it contains one or more elements that are equal.
  /// The order of the elements in the set is not guaranteed to be the same
  /// as for the iterable.
  Set<T> toSet() {
    return state.items.toSet();
  }

  /// Removes all objects from this list; the length of the list becomes zero.
  S clear([TotalCountResolver totalCountResolver = _defaultResolver]) {
    return state.copyWith(
      items: [],
      totalCount:
          totalCountResolver(state.totalCount, diff(state.items.length, 0)),
    );
  }
}
