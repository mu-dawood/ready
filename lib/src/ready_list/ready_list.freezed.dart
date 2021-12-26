// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of ready_list;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReadylistResponseTearOff {
  const _$ReadylistResponseTearOff();

  _Success<T> success<T>({required Iterable<T> items, required int total}) {
    return _Success<T>(
      items: items,
      total: total,
    );
  }

  _Cancel<T> cancel<T>() {
    return _Cancel<T>();
  }

  _Error<T> error<T>(String message) {
    return _Error<T>(
      message,
    );
  }
}

/// @nodoc
const $ReadylistResponse = _$ReadylistResponseTearOff();

/// @nodoc
mixin _$ReadylistResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<T> items, int total) success,
    required TResult Function() cancel,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Iterable<T> items, int total)? success,
    TResult Function()? cancel,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<T> items, int total)? success,
    TResult Function()? cancel,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Cancel<T> value) cancel,
    required TResult Function(_Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Success<T> value)? success,
    TResult Function(_Cancel<T> value)? cancel,
    TResult Function(_Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<T> value)? success,
    TResult Function(_Cancel<T> value)? cancel,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadylistResponseCopyWith<T, $Res> {
  factory $ReadylistResponseCopyWith(ReadylistResponse<T> value, $Res Function(ReadylistResponse<T>) then) =
      _$ReadylistResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ReadylistResponseCopyWithImpl<T, $Res> implements $ReadylistResponseCopyWith<T, $Res> {
  _$ReadylistResponseCopyWithImpl(this._value, this._then);

  final ReadylistResponse<T> _value;
  // ignore: unused_field
  final $Res Function(ReadylistResponse<T>) _then;
}

/// @nodoc
abstract class _$SuccessCopyWith<T, $Res> {
  factory _$SuccessCopyWith(_Success<T> value, $Res Function(_Success<T>) then) = __$SuccessCopyWithImpl<T, $Res>;
  $Res call({Iterable<T> items, int total});
}

/// @nodoc
class __$SuccessCopyWithImpl<T, $Res> extends _$ReadylistResponseCopyWithImpl<T, $Res>
    implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(_Success<T> _value, $Res Function(_Success<T>) _then)
      : super(_value, (v) => _then(v as _Success<T>));

  @override
  _Success<T> get _value => super._value as _Success<T>;

  @override
  $Res call({
    Object? items = freezed,
    Object? total = freezed,
  }) {
    return _then(_Success<T>(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Iterable<T>,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Success<T> with DiagnosticableTreeMixin implements _Success<T> {
  _$_Success({required this.items, required this.total});

  @override
  final Iterable<T> items;
  @override
  final int total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReadylistResponse<$T>.success(items: $items, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReadylistResponse<$T>.success'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.total, total));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items), const DeepCollectionEquality().hash(total));

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<T, _Success<T>> get copyWith => __$SuccessCopyWithImpl<T, _Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<T> items, int total) success,
    required TResult Function() cancel,
    required TResult Function(String message) error,
  }) {
    return success(items, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Iterable<T> items, int total)? success,
    TResult Function()? cancel,
    TResult Function(String message)? error,
  }) {
    return success?.call(items, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<T> items, int total)? success,
    TResult Function()? cancel,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(items, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Cancel<T> value) cancel,
    required TResult Function(_Error<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Success<T> value)? success,
    TResult Function(_Cancel<T> value)? cancel,
    TResult Function(_Error<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<T> value)? success,
    TResult Function(_Cancel<T> value)? cancel,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success<T> implements ReadylistResponse<T> {
  factory _Success({required Iterable<T> items, required int total}) = _$_Success<T>;

  Iterable<T> get items;
  int get total;
  @JsonKey(ignore: true)
  _$SuccessCopyWith<T, _Success<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CancelCopyWith<T, $Res> {
  factory _$CancelCopyWith(_Cancel<T> value, $Res Function(_Cancel<T>) then) = __$CancelCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$CancelCopyWithImpl<T, $Res> extends _$ReadylistResponseCopyWithImpl<T, $Res>
    implements _$CancelCopyWith<T, $Res> {
  __$CancelCopyWithImpl(_Cancel<T> _value, $Res Function(_Cancel<T>) _then)
      : super(_value, (v) => _then(v as _Cancel<T>));

  @override
  _Cancel<T> get _value => super._value as _Cancel<T>;
}

/// @nodoc

class _$_Cancel<T> with DiagnosticableTreeMixin implements _Cancel<T> {
  _$_Cancel();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReadylistResponse<$T>.cancel()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ReadylistResponse<$T>.cancel'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Cancel<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<T> items, int total) success,
    required TResult Function() cancel,
    required TResult Function(String message) error,
  }) {
    return cancel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Iterable<T> items, int total)? success,
    TResult Function()? cancel,
    TResult Function(String message)? error,
  }) {
    return cancel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<T> items, int total)? success,
    TResult Function()? cancel,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Cancel<T> value) cancel,
    required TResult Function(_Error<T> value) error,
  }) {
    return cancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Success<T> value)? success,
    TResult Function(_Cancel<T> value)? cancel,
    TResult Function(_Error<T> value)? error,
  }) {
    return cancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<T> value)? success,
    TResult Function(_Cancel<T> value)? cancel,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(this);
    }
    return orElse();
  }
}

abstract class _Cancel<T> implements ReadylistResponse<T> {
  factory _Cancel() = _$_Cancel<T>;
}

/// @nodoc
abstract class _$ErrorCopyWith<T, $Res> {
  factory _$ErrorCopyWith(_Error<T> value, $Res Function(_Error<T>) then) = __$ErrorCopyWithImpl<T, $Res>;
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<T, $Res> extends _$ReadylistResponseCopyWithImpl<T, $Res>
    implements _$ErrorCopyWith<T, $Res> {
  __$ErrorCopyWithImpl(_Error<T> _value, $Res Function(_Error<T>) _then) : super(_value, (v) => _then(v as _Error<T>));

  @override
  _Error<T> get _value => super._value as _Error<T>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Error<T>(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error<T> with DiagnosticableTreeMixin implements _Error<T> {
  _$_Error(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReadylistResponse<$T>.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReadylistResponse<$T>.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error<T> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<T, _Error<T>> get copyWith => __$ErrorCopyWithImpl<T, _Error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Iterable<T> items, int total) success,
    required TResult Function() cancel,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Iterable<T> items, int total)? success,
    TResult Function()? cancel,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<T> items, int total)? success,
    TResult Function()? cancel,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Cancel<T> value) cancel,
    required TResult Function(_Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Success<T> value)? success,
    TResult Function(_Cancel<T> value)? cancel,
    TResult Function(_Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<T> value)? success,
    TResult Function(_Cancel<T> value)? cancel,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<T> implements ReadylistResponse<T> {
  factory _Error(String message) = _$_Error<T>;

  String get message;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<T, _Error<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$ReadyListStateTearOff {
  const _$ReadyListStateTearOff();

  _ReadyListNeedIntialLoading<T> needIntialLoading<T>() {
    return _ReadyListNeedIntialLoading<T>();
  }

  _ReadyListIntialLoading<T> intialLoading<T>([ICancelToken? cancelToken]) {
    return _ReadyListIntialLoading<T>(
      cancelToken,
    );
  }

  _ReadyListItems<T> items<T>({required Iterable<T> items, required int total, bool intial = true}) {
    return _ReadyListItems<T>(
      items: items,
      total: total,
      intial: intial,
    );
  }

  _ReadyListEmpty<T> empty<T>() {
    return _ReadyListEmpty<T>();
  }

  _ReadyListError<T> error<T>(String message) {
    return _ReadyListError<T>(
      message,
    );
  }

  _ReadyListRefreshing<T> refreshing<T>({required Iterable<T> items, required int total, ICancelToken? cancelToken}) {
    return _ReadyListRefreshing<T>(
      items: items,
      total: total,
      cancelToken: cancelToken,
    );
  }

  _ReadyListLoadingNext<T> loadingNext<T>({required Iterable<T> items, required int total, ICancelToken? cancelToken}) {
    return _ReadyListLoadingNext<T>(
      items: items,
      total: total,
      cancelToken: cancelToken,
    );
  }
}

/// @nodoc
const $ReadyListState = _$ReadyListStateTearOff();

/// @nodoc
mixin _$ReadyListState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needIntialLoading,
    required TResult Function(ICancelToken? cancelToken) intialLoading,
    required TResult Function(Iterable<T> items, int total, bool intial) items,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) refreshing,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) loadingNext,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReadyListNeedIntialLoading<T> value) needIntialLoading,
    required TResult Function(_ReadyListIntialLoading<T> value) intialLoading,
    required TResult Function(_ReadyListItems<T> value) items,
    required TResult Function(_ReadyListEmpty<T> value) empty,
    required TResult Function(_ReadyListError<T> value) error,
    required TResult Function(_ReadyListRefreshing<T> value) refreshing,
    required TResult Function(_ReadyListLoadingNext<T> value) loadingNext,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadyListStateCopyWith<T, $Res> {
  factory $ReadyListStateCopyWith(ReadyListState<T> value, $Res Function(ReadyListState<T>) then) =
      _$ReadyListStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ReadyListStateCopyWithImpl<T, $Res> implements $ReadyListStateCopyWith<T, $Res> {
  _$ReadyListStateCopyWithImpl(this._value, this._then);

  final ReadyListState<T> _value;
  // ignore: unused_field
  final $Res Function(ReadyListState<T>) _then;
}

/// @nodoc
abstract class _$ReadyListNeedIntialLoadingCopyWith<T, $Res> {
  factory _$ReadyListNeedIntialLoadingCopyWith(
          _ReadyListNeedIntialLoading<T> value, $Res Function(_ReadyListNeedIntialLoading<T>) then) =
      __$ReadyListNeedIntialLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$ReadyListNeedIntialLoadingCopyWithImpl<T, $Res> extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$ReadyListNeedIntialLoadingCopyWith<T, $Res> {
  __$ReadyListNeedIntialLoadingCopyWithImpl(
      _ReadyListNeedIntialLoading<T> _value, $Res Function(_ReadyListNeedIntialLoading<T>) _then)
      : super(_value, (v) => _then(v as _ReadyListNeedIntialLoading<T>));

  @override
  _ReadyListNeedIntialLoading<T> get _value => super._value as _ReadyListNeedIntialLoading<T>;
}

/// @nodoc

class _$_ReadyListNeedIntialLoading<T> with DiagnosticableTreeMixin implements _ReadyListNeedIntialLoading<T> {
  _$_ReadyListNeedIntialLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReadyListState<$T>.needIntialLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ReadyListState<$T>.needIntialLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _ReadyListNeedIntialLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needIntialLoading,
    required TResult Function(ICancelToken? cancelToken) intialLoading,
    required TResult Function(Iterable<T> items, int total, bool intial) items,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) refreshing,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) loadingNext,
  }) {
    return needIntialLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
  }) {
    return needIntialLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
    required TResult orElse(),
  }) {
    if (needIntialLoading != null) {
      return needIntialLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReadyListNeedIntialLoading<T> value) needIntialLoading,
    required TResult Function(_ReadyListIntialLoading<T> value) intialLoading,
    required TResult Function(_ReadyListItems<T> value) items,
    required TResult Function(_ReadyListEmpty<T> value) empty,
    required TResult Function(_ReadyListError<T> value) error,
    required TResult Function(_ReadyListRefreshing<T> value) refreshing,
    required TResult Function(_ReadyListLoadingNext<T> value) loadingNext,
  }) {
    return needIntialLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
  }) {
    return needIntialLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
    required TResult orElse(),
  }) {
    if (needIntialLoading != null) {
      return needIntialLoading(this);
    }
    return orElse();
  }
}

abstract class _ReadyListNeedIntialLoading<T> implements ReadyListState<T> {
  factory _ReadyListNeedIntialLoading() = _$_ReadyListNeedIntialLoading<T>;
}

/// @nodoc
abstract class _$ReadyListIntialLoadingCopyWith<T, $Res> {
  factory _$ReadyListIntialLoadingCopyWith(
          _ReadyListIntialLoading<T> value, $Res Function(_ReadyListIntialLoading<T>) then) =
      __$ReadyListIntialLoadingCopyWithImpl<T, $Res>;
  $Res call({ICancelToken? cancelToken});
}

/// @nodoc
class __$ReadyListIntialLoadingCopyWithImpl<T, $Res> extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$ReadyListIntialLoadingCopyWith<T, $Res> {
  __$ReadyListIntialLoadingCopyWithImpl(
      _ReadyListIntialLoading<T> _value, $Res Function(_ReadyListIntialLoading<T>) _then)
      : super(_value, (v) => _then(v as _ReadyListIntialLoading<T>));

  @override
  _ReadyListIntialLoading<T> get _value => super._value as _ReadyListIntialLoading<T>;

  @override
  $Res call({
    Object? cancelToken = freezed,
  }) {
    return _then(_ReadyListIntialLoading<T>(
      cancelToken == freezed
          ? _value.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as ICancelToken?,
    ));
  }
}

/// @nodoc

class _$_ReadyListIntialLoading<T> with DiagnosticableTreeMixin implements _ReadyListIntialLoading<T> {
  _$_ReadyListIntialLoading([this.cancelToken]);

  @override
  final ICancelToken? cancelToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReadyListState<$T>.intialLoading(cancelToken: $cancelToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReadyListState<$T>.intialLoading'))
      ..add(DiagnosticsProperty('cancelToken', cancelToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReadyListIntialLoading<T> &&
            const DeepCollectionEquality().equals(other.cancelToken, cancelToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(cancelToken));

  @JsonKey(ignore: true)
  @override
  _$ReadyListIntialLoadingCopyWith<T, _ReadyListIntialLoading<T>> get copyWith =>
      __$ReadyListIntialLoadingCopyWithImpl<T, _ReadyListIntialLoading<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needIntialLoading,
    required TResult Function(ICancelToken? cancelToken) intialLoading,
    required TResult Function(Iterable<T> items, int total, bool intial) items,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) refreshing,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) loadingNext,
  }) {
    return intialLoading(cancelToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
  }) {
    return intialLoading?.call(cancelToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
    required TResult orElse(),
  }) {
    if (intialLoading != null) {
      return intialLoading(cancelToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReadyListNeedIntialLoading<T> value) needIntialLoading,
    required TResult Function(_ReadyListIntialLoading<T> value) intialLoading,
    required TResult Function(_ReadyListItems<T> value) items,
    required TResult Function(_ReadyListEmpty<T> value) empty,
    required TResult Function(_ReadyListError<T> value) error,
    required TResult Function(_ReadyListRefreshing<T> value) refreshing,
    required TResult Function(_ReadyListLoadingNext<T> value) loadingNext,
  }) {
    return intialLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
  }) {
    return intialLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
    required TResult orElse(),
  }) {
    if (intialLoading != null) {
      return intialLoading(this);
    }
    return orElse();
  }
}

abstract class _ReadyListIntialLoading<T> implements ReadyListState<T> {
  factory _ReadyListIntialLoading([ICancelToken? cancelToken]) = _$_ReadyListIntialLoading<T>;

  ICancelToken? get cancelToken;
  @JsonKey(ignore: true)
  _$ReadyListIntialLoadingCopyWith<T, _ReadyListIntialLoading<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ReadyListItemsCopyWith<T, $Res> {
  factory _$ReadyListItemsCopyWith(_ReadyListItems<T> value, $Res Function(_ReadyListItems<T>) then) =
      __$ReadyListItemsCopyWithImpl<T, $Res>;
  $Res call({Iterable<T> items, int total, bool intial});
}

/// @nodoc
class __$ReadyListItemsCopyWithImpl<T, $Res> extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$ReadyListItemsCopyWith<T, $Res> {
  __$ReadyListItemsCopyWithImpl(_ReadyListItems<T> _value, $Res Function(_ReadyListItems<T>) _then)
      : super(_value, (v) => _then(v as _ReadyListItems<T>));

  @override
  _ReadyListItems<T> get _value => super._value as _ReadyListItems<T>;

  @override
  $Res call({
    Object? items = freezed,
    Object? total = freezed,
    Object? intial = freezed,
  }) {
    return _then(_ReadyListItems<T>(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Iterable<T>,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      intial: intial == freezed
          ? _value.intial
          : intial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ReadyListItems<T> with DiagnosticableTreeMixin implements _ReadyListItems<T> {
  const _$_ReadyListItems({required this.items, required this.total, this.intial = true});

  @override
  final Iterable<T> items;
  @override
  final int total;
  @JsonKey()
  @override
  final bool intial;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReadyListState<$T>.items(items: $items, total: $total, intial: $intial)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReadyListState<$T>.items'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('intial', intial));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReadyListItems<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.intial, intial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(total), const DeepCollectionEquality().hash(intial));

  @JsonKey(ignore: true)
  @override
  _$ReadyListItemsCopyWith<T, _ReadyListItems<T>> get copyWith =>
      __$ReadyListItemsCopyWithImpl<T, _ReadyListItems<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needIntialLoading,
    required TResult Function(ICancelToken? cancelToken) intialLoading,
    required TResult Function(Iterable<T> items, int total, bool intial) items,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) refreshing,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) loadingNext,
  }) {
    return items(this.items, total, intial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
  }) {
    return items?.call(this.items, total, intial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
    required TResult orElse(),
  }) {
    if (items != null) {
      return items(this.items, total, intial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReadyListNeedIntialLoading<T> value) needIntialLoading,
    required TResult Function(_ReadyListIntialLoading<T> value) intialLoading,
    required TResult Function(_ReadyListItems<T> value) items,
    required TResult Function(_ReadyListEmpty<T> value) empty,
    required TResult Function(_ReadyListError<T> value) error,
    required TResult Function(_ReadyListRefreshing<T> value) refreshing,
    required TResult Function(_ReadyListLoadingNext<T> value) loadingNext,
  }) {
    return items(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
  }) {
    return items?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
    required TResult orElse(),
  }) {
    if (items != null) {
      return items(this);
    }
    return orElse();
  }
}

abstract class _ReadyListItems<T> implements ReadyListState<T> {
  const factory _ReadyListItems({required Iterable<T> items, required int total, bool intial}) = _$_ReadyListItems<T>;

  Iterable<T> get items;
  int get total;
  bool get intial;
  @JsonKey(ignore: true)
  _$ReadyListItemsCopyWith<T, _ReadyListItems<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ReadyListEmptyCopyWith<T, $Res> {
  factory _$ReadyListEmptyCopyWith(_ReadyListEmpty<T> value, $Res Function(_ReadyListEmpty<T>) then) =
      __$ReadyListEmptyCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$ReadyListEmptyCopyWithImpl<T, $Res> extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$ReadyListEmptyCopyWith<T, $Res> {
  __$ReadyListEmptyCopyWithImpl(_ReadyListEmpty<T> _value, $Res Function(_ReadyListEmpty<T>) _then)
      : super(_value, (v) => _then(v as _ReadyListEmpty<T>));

  @override
  _ReadyListEmpty<T> get _value => super._value as _ReadyListEmpty<T>;
}

/// @nodoc

class _$_ReadyListEmpty<T> with DiagnosticableTreeMixin implements _ReadyListEmpty<T> {
  _$_ReadyListEmpty();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReadyListState<$T>.empty()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ReadyListState<$T>.empty'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _ReadyListEmpty<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needIntialLoading,
    required TResult Function(ICancelToken? cancelToken) intialLoading,
    required TResult Function(Iterable<T> items, int total, bool intial) items,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) refreshing,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) loadingNext,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReadyListNeedIntialLoading<T> value) needIntialLoading,
    required TResult Function(_ReadyListIntialLoading<T> value) intialLoading,
    required TResult Function(_ReadyListItems<T> value) items,
    required TResult Function(_ReadyListEmpty<T> value) empty,
    required TResult Function(_ReadyListError<T> value) error,
    required TResult Function(_ReadyListRefreshing<T> value) refreshing,
    required TResult Function(_ReadyListLoadingNext<T> value) loadingNext,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _ReadyListEmpty<T> implements ReadyListState<T> {
  factory _ReadyListEmpty() = _$_ReadyListEmpty<T>;
}

/// @nodoc
abstract class _$ReadyListErrorCopyWith<T, $Res> {
  factory _$ReadyListErrorCopyWith(_ReadyListError<T> value, $Res Function(_ReadyListError<T>) then) =
      __$ReadyListErrorCopyWithImpl<T, $Res>;
  $Res call({String message});
}

/// @nodoc
class __$ReadyListErrorCopyWithImpl<T, $Res> extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$ReadyListErrorCopyWith<T, $Res> {
  __$ReadyListErrorCopyWithImpl(_ReadyListError<T> _value, $Res Function(_ReadyListError<T>) _then)
      : super(_value, (v) => _then(v as _ReadyListError<T>));

  @override
  _ReadyListError<T> get _value => super._value as _ReadyListError<T>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_ReadyListError<T>(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReadyListError<T> with DiagnosticableTreeMixin implements _ReadyListError<T> {
  const _$_ReadyListError(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReadyListState<$T>.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReadyListState<$T>.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReadyListError<T> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$ReadyListErrorCopyWith<T, _ReadyListError<T>> get copyWith =>
      __$ReadyListErrorCopyWithImpl<T, _ReadyListError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needIntialLoading,
    required TResult Function(ICancelToken? cancelToken) intialLoading,
    required TResult Function(Iterable<T> items, int total, bool intial) items,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) refreshing,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) loadingNext,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReadyListNeedIntialLoading<T> value) needIntialLoading,
    required TResult Function(_ReadyListIntialLoading<T> value) intialLoading,
    required TResult Function(_ReadyListItems<T> value) items,
    required TResult Function(_ReadyListEmpty<T> value) empty,
    required TResult Function(_ReadyListError<T> value) error,
    required TResult Function(_ReadyListRefreshing<T> value) refreshing,
    required TResult Function(_ReadyListLoadingNext<T> value) loadingNext,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ReadyListError<T> implements ReadyListState<T> {
  const factory _ReadyListError(String message) = _$_ReadyListError<T>;

  String get message;
  @JsonKey(ignore: true)
  _$ReadyListErrorCopyWith<T, _ReadyListError<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ReadyListRefreshingCopyWith<T, $Res> {
  factory _$ReadyListRefreshingCopyWith(_ReadyListRefreshing<T> value, $Res Function(_ReadyListRefreshing<T>) then) =
      __$ReadyListRefreshingCopyWithImpl<T, $Res>;
  $Res call({Iterable<T> items, int total, ICancelToken? cancelToken});
}

/// @nodoc
class __$ReadyListRefreshingCopyWithImpl<T, $Res> extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$ReadyListRefreshingCopyWith<T, $Res> {
  __$ReadyListRefreshingCopyWithImpl(_ReadyListRefreshing<T> _value, $Res Function(_ReadyListRefreshing<T>) _then)
      : super(_value, (v) => _then(v as _ReadyListRefreshing<T>));

  @override
  _ReadyListRefreshing<T> get _value => super._value as _ReadyListRefreshing<T>;

  @override
  $Res call({
    Object? items = freezed,
    Object? total = freezed,
    Object? cancelToken = freezed,
  }) {
    return _then(_ReadyListRefreshing<T>(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Iterable<T>,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      cancelToken: cancelToken == freezed
          ? _value.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as ICancelToken?,
    ));
  }
}

/// @nodoc

class _$_ReadyListRefreshing<T> with DiagnosticableTreeMixin implements _ReadyListRefreshing<T> {
  _$_ReadyListRefreshing({required this.items, required this.total, this.cancelToken});

  @override
  final Iterable<T> items;
  @override
  final int total;
  @override
  final ICancelToken? cancelToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReadyListState<$T>.refreshing(items: $items, total: $total, cancelToken: $cancelToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReadyListState<$T>.refreshing'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('cancelToken', cancelToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReadyListRefreshing<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.cancelToken, cancelToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(total), const DeepCollectionEquality().hash(cancelToken));

  @JsonKey(ignore: true)
  @override
  _$ReadyListRefreshingCopyWith<T, _ReadyListRefreshing<T>> get copyWith =>
      __$ReadyListRefreshingCopyWithImpl<T, _ReadyListRefreshing<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needIntialLoading,
    required TResult Function(ICancelToken? cancelToken) intialLoading,
    required TResult Function(Iterable<T> items, int total, bool intial) items,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) refreshing,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) loadingNext,
  }) {
    return refreshing(this.items, total, cancelToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
  }) {
    return refreshing?.call(this.items, total, cancelToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this.items, total, cancelToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReadyListNeedIntialLoading<T> value) needIntialLoading,
    required TResult Function(_ReadyListIntialLoading<T> value) intialLoading,
    required TResult Function(_ReadyListItems<T> value) items,
    required TResult Function(_ReadyListEmpty<T> value) empty,
    required TResult Function(_ReadyListError<T> value) error,
    required TResult Function(_ReadyListRefreshing<T> value) refreshing,
    required TResult Function(_ReadyListLoadingNext<T> value) loadingNext,
  }) {
    return refreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
  }) {
    return refreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
    required TResult orElse(),
  }) {
    if (refreshing != null) {
      return refreshing(this);
    }
    return orElse();
  }
}

abstract class _ReadyListRefreshing<T> implements ReadyListState<T> {
  factory _ReadyListRefreshing({required Iterable<T> items, required int total, ICancelToken? cancelToken}) =
      _$_ReadyListRefreshing<T>;

  Iterable<T> get items;
  int get total;
  ICancelToken? get cancelToken;
  @JsonKey(ignore: true)
  _$ReadyListRefreshingCopyWith<T, _ReadyListRefreshing<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ReadyListLoadingNextCopyWith<T, $Res> {
  factory _$ReadyListLoadingNextCopyWith(_ReadyListLoadingNext<T> value, $Res Function(_ReadyListLoadingNext<T>) then) =
      __$ReadyListLoadingNextCopyWithImpl<T, $Res>;
  $Res call({Iterable<T> items, int total, ICancelToken? cancelToken});
}

/// @nodoc
class __$ReadyListLoadingNextCopyWithImpl<T, $Res> extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$ReadyListLoadingNextCopyWith<T, $Res> {
  __$ReadyListLoadingNextCopyWithImpl(_ReadyListLoadingNext<T> _value, $Res Function(_ReadyListLoadingNext<T>) _then)
      : super(_value, (v) => _then(v as _ReadyListLoadingNext<T>));

  @override
  _ReadyListLoadingNext<T> get _value => super._value as _ReadyListLoadingNext<T>;

  @override
  $Res call({
    Object? items = freezed,
    Object? total = freezed,
    Object? cancelToken = freezed,
  }) {
    return _then(_ReadyListLoadingNext<T>(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Iterable<T>,
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      cancelToken: cancelToken == freezed
          ? _value.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as ICancelToken?,
    ));
  }
}

/// @nodoc

class _$_ReadyListLoadingNext<T> with DiagnosticableTreeMixin implements _ReadyListLoadingNext<T> {
  _$_ReadyListLoadingNext({required this.items, required this.total, this.cancelToken});

  @override
  final Iterable<T> items;
  @override
  final int total;
  @override
  final ICancelToken? cancelToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReadyListState<$T>.loadingNext(items: $items, total: $total, cancelToken: $cancelToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReadyListState<$T>.loadingNext'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('cancelToken', cancelToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReadyListLoadingNext<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.cancelToken, cancelToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(total), const DeepCollectionEquality().hash(cancelToken));

  @JsonKey(ignore: true)
  @override
  _$ReadyListLoadingNextCopyWith<T, _ReadyListLoadingNext<T>> get copyWith =>
      __$ReadyListLoadingNextCopyWithImpl<T, _ReadyListLoadingNext<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() needIntialLoading,
    required TResult Function(ICancelToken? cancelToken) intialLoading,
    required TResult Function(Iterable<T> items, int total, bool intial) items,
    required TResult Function() empty,
    required TResult Function(String message) error,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) refreshing,
    required TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken) loadingNext,
  }) {
    return loadingNext(this.items, total, cancelToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
  }) {
    return loadingNext?.call(this.items, total, cancelToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? needIntialLoading,
    TResult Function(ICancelToken? cancelToken)? intialLoading,
    TResult Function(Iterable<T> items, int total, bool intial)? items,
    TResult Function()? empty,
    TResult Function(String message)? error,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? refreshing,
    TResult Function(Iterable<T> items, int total, ICancelToken? cancelToken)? loadingNext,
    required TResult orElse(),
  }) {
    if (loadingNext != null) {
      return loadingNext(this.items, total, cancelToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReadyListNeedIntialLoading<T> value) needIntialLoading,
    required TResult Function(_ReadyListIntialLoading<T> value) intialLoading,
    required TResult Function(_ReadyListItems<T> value) items,
    required TResult Function(_ReadyListEmpty<T> value) empty,
    required TResult Function(_ReadyListError<T> value) error,
    required TResult Function(_ReadyListRefreshing<T> value) refreshing,
    required TResult Function(_ReadyListLoadingNext<T> value) loadingNext,
  }) {
    return loadingNext(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
  }) {
    return loadingNext?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReadyListNeedIntialLoading<T> value)? needIntialLoading,
    TResult Function(_ReadyListIntialLoading<T> value)? intialLoading,
    TResult Function(_ReadyListItems<T> value)? items,
    TResult Function(_ReadyListEmpty<T> value)? empty,
    TResult Function(_ReadyListError<T> value)? error,
    TResult Function(_ReadyListRefreshing<T> value)? refreshing,
    TResult Function(_ReadyListLoadingNext<T> value)? loadingNext,
    required TResult orElse(),
  }) {
    if (loadingNext != null) {
      return loadingNext(this);
    }
    return orElse();
  }
}

abstract class _ReadyListLoadingNext<T> implements ReadyListState<T> {
  factory _ReadyListLoadingNext({required Iterable<T> items, required int total, ICancelToken? cancelToken}) =
      _$_ReadyListLoadingNext<T>;

  Iterable<T> get items;
  int get total;
  ICancelToken? get cancelToken;
  @JsonKey(ignore: true)
  _$ReadyListLoadingNextCopyWith<T, _ReadyListLoadingNext<T>> get copyWith => throw _privateConstructorUsedError;
}
