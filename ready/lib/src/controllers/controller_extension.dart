part of controllers;

extension ReadyListControllerExt<T, Args> on BaseReadyListController<T, Args> {
  void requestNext([int? pageSize]) {
    state.mapOrNull(
      initializing: (state) => emit(ReadyListState.requestFirstLoading(
          args: state.args, pageSize: pageSize)),
      error: (state) => emit(ReadyListState.requestFirstLoading(
        pageSize: pageSize ?? state.currentData?.pageSize,
        currentData: state.currentData,
        args: state.args,
      )),
      isLoaded: (state) => emit(ReadyListState.requestNext(
          pageSize: pageSize ?? state.pageSize,
          args: state.args,
          currentData: CurrentData(
            items: state.items,
            totalCount: state.totalCount,
            pageSize: state.pageSize,
          ))),
    );
  }

  void requestRefresh([int? pageSize]) {
    state.mapOrNull(
      initializing: (state) => emit(ReadyListState.requestFirstLoading(
          args: state.args, pageSize: pageSize)),
      error: (state) => emit(ReadyListState.requestFirstLoading(
        pageSize: pageSize ?? state.currentData?.pageSize,
        currentData: state.currentData,
        args: state.args,
      )),
      isLoaded: (state) => emit(ReadyListState.requestRefresh(
          pageSize: pageSize ?? state.pageSize,
          args: state.args,
          currentData: CurrentData(
            items: state.items,
            totalCount: state.totalCount,
            pageSize: state.pageSize,
          ))),
    );
  }

  void requestFirstLoading([int? pageSize]) {
    state.mapOrNull(
      initializing: (state) => emit(ReadyListState.requestFirstLoading(
          args: state.args, pageSize: pageSize)),
      error: (state) => emit(ReadyListState.requestFirstLoading(
        pageSize: pageSize ?? state.currentData?.pageSize,
        currentData: state.currentData,
        args: state.args,
      )),
      isLoaded: (state) => emit(ReadyListState.requestFirstLoading(
          pageSize: pageSize ?? state.pageSize,
          args: state.args,
          currentData: CurrentData(
            items: state.items,
            totalCount: state.totalCount,
            pageSize: state.pageSize,
          ))),
    );
  }

  /// Adds [value] to the end of this list,
  /// extending the length by one.
  ///
  /// The list must be growable.
  void add(T value,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.add(value, totalCountResolver));
  }

  /// Appends all objects of [iterable] to the end of this list.
  ///
  /// Extends the length of the list by the number of objects in [iterable].
  /// The list must be growable.
  void addAll(Iterable<T> iterable,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.addAll(iterable, totalCountResolver));
  }

  /// Inserts [element] at position [index] in this list.
  ///
  /// This increases the length of the list by one and shifts all objects
  /// at or after the index towards the end of the list.
  ///
  /// The list must be growable.
  /// The [index] value must be non-negative and no greater than [length].
  void insert(int index, T element,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.insert(index, element, totalCountResolver));
  }

  /// Inserts all objects of [iterable] at position [index] in this list.
  ///
  /// This increases the length of the list by the length of [iterable] and
  /// shifts all later objects towards the end of the list.
  ///
  /// The list must be growable.
  /// The [index] value must be non-negative and no greater than [length].
  void insertAll(int index, Iterable<T> iterable,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.insertAll(index, iterable, totalCountResolver));
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
  void remove(T value,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.remove(value, totalCountResolver));
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
  void removeRange(int start, int end,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.removeRange(start, end, totalCountResolver));
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
  void removeWhere(bool Function(T) test,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.removeWhere(test, totalCountResolver));
  }

  /// Removes and returns the last object in this list.
  ///
  /// The list must be growable and non-empty.
  void removeLast([TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.removeLast(totalCountResolver));
  }

  /// Removes the object at position [index] from this list.
  ///
  /// This method reduces the length of `this` by one and moves all later objects
  /// down by one position.
  ///
  /// The list must be growable.
  void removeAt(int index,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.removeAt(index, totalCountResolver));
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
  void where(bool Function(T) test,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.where(test, totalCountResolver));
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
  void skip(int count,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.skip(count, totalCountResolver));
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
  void skipWhile(bool Function(T) test,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.skipWhile(test, totalCountResolver));
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
  void take(int count,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.take(count, totalCountResolver));
  }

  /// Returns a lazy iterable of the leading elements satisfying [test].
  ///
  /// The filtering happens lazily. Every new iterator of the returned
  /// iterable starts iterating over the elements of `this`.
  ///
  /// The elements can be computed by stepping through [iterator] until an
  /// element is found where `test(element)` is false. At that point,
  /// the returned iterable stops (its `moveNext()` returns false).
  void takeWhile(bool Function(T) test,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.takeWhile(test, totalCountResolver));
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
  void expand(Iterable<T> Function(T) toElements,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.expand(toElements, totalCountResolver));
  }

  /// Returns the lazy concatenation of this iterable and [other].
  ///
  /// The returned iterable will provide the same elements as this iterable,
  /// and, after that, the elements of [other], in the same order as in the
  /// original iterables.
  void followedBy(Iterable<T> other,
      [TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.followedBy(other, totalCountResolver));
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
  void map(T Function(T) toElement) {
    emit(state.mapItems(toElement));
  }

  /// replace items where test return `true`
  void replaceWhere({required bool Function(T) where, required T item}) {
    emit(state.replaceWhere(where: where, item: item));
  }

  /// Removes all objects from this list; the length of the list becomes zero.
  void clear([TotalCountResolver totalCountResolver = _defaultResolver]) {
    emit(state.clear(totalCountResolver));
  }
}
