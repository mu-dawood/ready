// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of controllers;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RemoteResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorDisplayCallBack display) error,
    required TResult Function(Iterable<T> items, int totalCount) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorDisplayCallBack display)? error,
    TResult? Function(Iterable<T> items, int totalCount)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorDisplayCallBack display)? error,
    TResult Function(Iterable<T> items, int totalCount)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorResult<T> value) error,
    required TResult Function(SuccessResult<T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorResult<T> value)? error,
    TResult? Function(SuccessResult<T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorResult<T> value)? error,
    TResult Function(SuccessResult<T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteResultCopyWith<T, $Res> {
  factory $RemoteResultCopyWith(
          RemoteResult<T> value, $Res Function(RemoteResult<T>) then) =
      _$RemoteResultCopyWithImpl<T, $Res, RemoteResult<T>>;
}

/// @nodoc
class _$RemoteResultCopyWithImpl<T, $Res, $Val extends RemoteResult<T>>
    implements $RemoteResultCopyWith<T, $Res> {
  _$RemoteResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ErrorResultCopyWith<T, $Res> {
  factory _$$ErrorResultCopyWith(
          _$ErrorResult<T> value, $Res Function(_$ErrorResult<T>) then) =
      __$$ErrorResultCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ErrorDisplayCallBack display});
}

/// @nodoc
class __$$ErrorResultCopyWithImpl<T, $Res>
    extends _$RemoteResultCopyWithImpl<T, $Res, _$ErrorResult<T>>
    implements _$$ErrorResultCopyWith<T, $Res> {
  __$$ErrorResultCopyWithImpl(
      _$ErrorResult<T> _value, $Res Function(_$ErrorResult<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? display = null,
  }) {
    return _then(_$ErrorResult<T>(
      null == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as ErrorDisplayCallBack,
    ));
  }
}

/// @nodoc

class _$ErrorResult<T> implements ErrorResult<T> {
  const _$ErrorResult(this.display);

  @override
  final ErrorDisplayCallBack display;

  @override
  String toString() {
    return 'RemoteResult<$T>.error(display: $display)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorResult<T> &&
            (identical(other.display, display) || other.display == display));
  }

  @override
  int get hashCode => Object.hash(runtimeType, display);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorResultCopyWith<T, _$ErrorResult<T>> get copyWith =>
      __$$ErrorResultCopyWithImpl<T, _$ErrorResult<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorDisplayCallBack display) error,
    required TResult Function(Iterable<T> items, int totalCount) success,
  }) {
    return error(display);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorDisplayCallBack display)? error,
    TResult? Function(Iterable<T> items, int totalCount)? success,
  }) {
    return error?.call(display);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorDisplayCallBack display)? error,
    TResult Function(Iterable<T> items, int totalCount)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(display);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorResult<T> value) error,
    required TResult Function(SuccessResult<T> value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorResult<T> value)? error,
    TResult? Function(SuccessResult<T> value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorResult<T> value)? error,
    TResult Function(SuccessResult<T> value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorResult<T> implements RemoteResult<T> {
  const factory ErrorResult(final ErrorDisplayCallBack display) =
      _$ErrorResult<T>;

  ErrorDisplayCallBack get display;
  @JsonKey(ignore: true)
  _$$ErrorResultCopyWith<T, _$ErrorResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessResultCopyWith<T, $Res> {
  factory _$$SuccessResultCopyWith(
          _$SuccessResult<T> value, $Res Function(_$SuccessResult<T>) then) =
      __$$SuccessResultCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Iterable<T> items, int totalCount});
}

/// @nodoc
class __$$SuccessResultCopyWithImpl<T, $Res>
    extends _$RemoteResultCopyWithImpl<T, $Res, _$SuccessResult<T>>
    implements _$$SuccessResultCopyWith<T, $Res> {
  __$$SuccessResultCopyWithImpl(
      _$SuccessResult<T> _value, $Res Function(_$SuccessResult<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = null,
  }) {
    return _then(_$SuccessResult<T>(
      null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Iterable<T>,
      null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SuccessResult<T> implements SuccessResult<T> {
  const _$SuccessResult(this.items, this.totalCount);

  @override
  final Iterable<T> items;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'RemoteResult<$T>.success(items: $items, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessResult<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(items), totalCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessResultCopyWith<T, _$SuccessResult<T>> get copyWith =>
      __$$SuccessResultCopyWithImpl<T, _$SuccessResult<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ErrorDisplayCallBack display) error,
    required TResult Function(Iterable<T> items, int totalCount) success,
  }) {
    return success(items, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ErrorDisplayCallBack display)? error,
    TResult? Function(Iterable<T> items, int totalCount)? success,
  }) {
    return success?.call(items, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ErrorDisplayCallBack display)? error,
    TResult Function(Iterable<T> items, int totalCount)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(items, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ErrorResult<T> value) error,
    required TResult Function(SuccessResult<T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ErrorResult<T> value)? error,
    TResult? Function(SuccessResult<T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ErrorResult<T> value)? error,
    TResult Function(SuccessResult<T> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SuccessResult<T> implements RemoteResult<T> {
  const factory SuccessResult(final Iterable<T> items, final int totalCount) =
      _$SuccessResult<T>;

  Iterable<T> get items;
  int get totalCount;
  @JsonKey(ignore: true)
  _$$SuccessResultCopyWith<T, _$SuccessResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrentData<T> {
  Iterable<T> get items => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  dynamic get args => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentDataCopyWith<T, CurrentData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentDataCopyWith<T, $Res> {
  factory $CurrentDataCopyWith(
          CurrentData<T> value, $Res Function(CurrentData<T>) then) =
      _$CurrentDataCopyWithImpl<T, $Res, CurrentData<T>>;
  @useResult
  $Res call({Iterable<T> items, int totalCount, int? pageSize, dynamic args});
}

/// @nodoc
class _$CurrentDataCopyWithImpl<T, $Res, $Val extends CurrentData<T>>
    implements $CurrentDataCopyWith<T, $Res> {
  _$CurrentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = null,
    Object? pageSize = freezed,
    Object? args = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Iterable<T>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrentDataCopyWith<T, $Res>
    implements $CurrentDataCopyWith<T, $Res> {
  factory _$$_CurrentDataCopyWith(
          _$_CurrentData<T> value, $Res Function(_$_CurrentData<T>) then) =
      __$$_CurrentDataCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({Iterable<T> items, int totalCount, int? pageSize, dynamic args});
}

/// @nodoc
class __$$_CurrentDataCopyWithImpl<T, $Res>
    extends _$CurrentDataCopyWithImpl<T, $Res, _$_CurrentData<T>>
    implements _$$_CurrentDataCopyWith<T, $Res> {
  __$$_CurrentDataCopyWithImpl(
      _$_CurrentData<T> _value, $Res Function(_$_CurrentData<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = null,
    Object? pageSize = freezed,
    Object? args = freezed,
  }) {
    return _then(_$_CurrentData<T>(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Iterable<T>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_CurrentData<T> implements _CurrentData<T> {
  const _$_CurrentData(
      {required this.items,
      required this.totalCount,
      this.pageSize,
      this.args});

  @override
  final Iterable<T> items;
  @override
  final int totalCount;
  @override
  final int? pageSize;
  @override
  final dynamic args;

  @override
  String toString() {
    return 'CurrentData<$T>(items: $items, totalCount: $totalCount, pageSize: $pageSize, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrentData<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality().equals(other.args, args));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      totalCount,
      pageSize,
      const DeepCollectionEquality().hash(args));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrentDataCopyWith<T, _$_CurrentData<T>> get copyWith =>
      __$$_CurrentDataCopyWithImpl<T, _$_CurrentData<T>>(this, _$identity);
}

abstract class _CurrentData<T> implements CurrentData<T> {
  const factory _CurrentData(
      {required final Iterable<T> items,
      required final int totalCount,
      final int? pageSize,
      final dynamic args}) = _$_CurrentData<T>;

  @override
  Iterable<T> get items;
  @override
  int get totalCount;
  @override
  int? get pageSize;
  @override
  dynamic get args;
  @override
  @JsonKey(ignore: true)
  _$$_CurrentDataCopyWith<T, _$_CurrentData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReadyListState<T> {
  dynamic get args => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, dynamic args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)
        isLoadingFirst,
    required TResult Function(ErrorDisplayCallBack display,
            CurrentData<T>? currentData, dynamic args)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)
        isLoaded,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isRefreshing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult? Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(Refreshing<T> value) isRefreshing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T> value)? isLoadingFirst,
    TResult? Function(ErrorState<T> value)? error,
    TResult? Function(Loaded<T> value)? isLoaded,
    TResult? Function(RequestNext<T> value)? requestNext,
    TResult? Function(LoadingNext<T> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T> value)? requestRefresh,
    TResult? Function(Refreshing<T> value)? isRefreshing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(Refreshing<T> value)? isRefreshing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadyListStateCopyWith<T, ReadyListState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadyListStateCopyWith<T, $Res> {
  factory $ReadyListStateCopyWith(
          ReadyListState<T> value, $Res Function(ReadyListState<T>) then) =
      _$ReadyListStateCopyWithImpl<T, $Res, ReadyListState<T>>;
  @useResult
  $Res call({dynamic args});
}

/// @nodoc
class _$ReadyListStateCopyWithImpl<T, $Res, $Val extends ReadyListState<T>>
    implements $ReadyListStateCopyWith<T, $Res> {
  _$ReadyListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? args = freezed,
  }) {
    return _then(_value.copyWith(
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitializingCopyWith<T, $Res>
    implements $ReadyListStateCopyWith<T, $Res> {
  factory _$$InitializingCopyWith(
          _$Initializing<T> value, $Res Function(_$Initializing<T>) then) =
      __$$InitializingCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({bool requestFirstLoading, dynamic args});
}

/// @nodoc
class __$$InitializingCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res, _$Initializing<T>>
    implements _$$InitializingCopyWith<T, $Res> {
  __$$InitializingCopyWithImpl(
      _$Initializing<T> _value, $Res Function(_$Initializing<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestFirstLoading = null,
    Object? args = freezed,
  }) {
    return _then(_$Initializing<T>(
      requestFirstLoading: null == requestFirstLoading
          ? _value.requestFirstLoading
          : requestFirstLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$Initializing<T> implements Initializing<T> {
  const _$Initializing({this.requestFirstLoading = true, this.args});

  @override
  @JsonKey()
  final bool requestFirstLoading;
  @override
  final dynamic args;

  @override
  String toString() {
    return 'ReadyListState<$T>.initializing(requestFirstLoading: $requestFirstLoading, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initializing<T> &&
            (identical(other.requestFirstLoading, requestFirstLoading) ||
                other.requestFirstLoading == requestFirstLoading) &&
            const DeepCollectionEquality().equals(other.args, args));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestFirstLoading,
      const DeepCollectionEquality().hash(args));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializingCopyWith<T, _$Initializing<T>> get copyWith =>
      __$$InitializingCopyWithImpl<T, _$Initializing<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, dynamic args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)
        isLoadingFirst,
    required TResult Function(ErrorDisplayCallBack display,
            CurrentData<T>? currentData, dynamic args)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)
        isLoaded,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isRefreshing,
  }) {
    return initializing(this.requestFirstLoading, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult? Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
  }) {
    return initializing?.call(this.requestFirstLoading, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this.requestFirstLoading, args);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(Refreshing<T> value) isRefreshing,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T> value)? isLoadingFirst,
    TResult? Function(ErrorState<T> value)? error,
    TResult? Function(Loaded<T> value)? isLoaded,
    TResult? Function(RequestNext<T> value)? requestNext,
    TResult? Function(LoadingNext<T> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T> value)? requestRefresh,
    TResult? Function(Refreshing<T> value)? isRefreshing,
  }) {
    return initializing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(Refreshing<T> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class Initializing<T> implements ReadyListState<T> {
  const factory Initializing(
      {final bool requestFirstLoading, final dynamic args}) = _$Initializing<T>;

  bool get requestFirstLoading;
  @override
  dynamic get args;
  @override
  @JsonKey(ignore: true)
  _$$InitializingCopyWith<T, _$Initializing<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestFirstLoadingCopyWith<T, $Res>
    implements $ReadyListStateCopyWith<T, $Res> {
  factory _$$RequestFirstLoadingCopyWith(_$RequestFirstLoading<T> value,
          $Res Function(_$RequestFirstLoading<T>) then) =
      __$$RequestFirstLoadingCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int? pageSize, CurrentData<T>? currentData, dynamic args});

  $CurrentDataCopyWith<T, $Res>? get currentData;
}

/// @nodoc
class __$$RequestFirstLoadingCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res, _$RequestFirstLoading<T>>
    implements _$$RequestFirstLoadingCopyWith<T, $Res> {
  __$$RequestFirstLoadingCopyWithImpl(_$RequestFirstLoading<T> _value,
      $Res Function(_$RequestFirstLoading<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = freezed,
    Object? currentData = freezed,
    Object? args = freezed,
  }) {
    return _then(_$RequestFirstLoading<T>(
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      currentData: freezed == currentData
          ? _value.currentData
          : currentData // ignore: cast_nullable_to_non_nullable
              as CurrentData<T>?,
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentDataCopyWith<T, $Res>? get currentData {
    if (_value.currentData == null) {
      return null;
    }

    return $CurrentDataCopyWith<T, $Res>(_value.currentData!, (value) {
      return _then(_value.copyWith(currentData: value));
    });
  }
}

/// @nodoc

class _$RequestFirstLoading<T> implements RequestFirstLoading<T> {
  const _$RequestFirstLoading({this.pageSize, this.currentData, this.args});

  @override
  final int? pageSize;
  @override
  final CurrentData<T>? currentData;
  @override
  final dynamic args;

  @override
  String toString() {
    return 'ReadyListState<$T>.requestFirstLoading(pageSize: $pageSize, currentData: $currentData, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestFirstLoading<T> &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.currentData, currentData) ||
                other.currentData == currentData) &&
            const DeepCollectionEquality().equals(other.args, args));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageSize, currentData,
      const DeepCollectionEquality().hash(args));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestFirstLoadingCopyWith<T, _$RequestFirstLoading<T>> get copyWith =>
      __$$RequestFirstLoadingCopyWithImpl<T, _$RequestFirstLoading<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, dynamic args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)
        isLoadingFirst,
    required TResult Function(ErrorDisplayCallBack display,
            CurrentData<T>? currentData, dynamic args)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)
        isLoaded,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isRefreshing,
  }) {
    return requestFirstLoading(pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult? Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
  }) {
    return requestFirstLoading?.call(pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
    required TResult orElse(),
  }) {
    if (requestFirstLoading != null) {
      return requestFirstLoading(pageSize, currentData, args);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(Refreshing<T> value) isRefreshing,
  }) {
    return requestFirstLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T> value)? isLoadingFirst,
    TResult? Function(ErrorState<T> value)? error,
    TResult? Function(Loaded<T> value)? isLoaded,
    TResult? Function(RequestNext<T> value)? requestNext,
    TResult? Function(LoadingNext<T> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T> value)? requestRefresh,
    TResult? Function(Refreshing<T> value)? isRefreshing,
  }) {
    return requestFirstLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(Refreshing<T> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (requestFirstLoading != null) {
      return requestFirstLoading(this);
    }
    return orElse();
  }
}

abstract class RequestFirstLoading<T> implements ReadyListState<T> {
  const factory RequestFirstLoading(
      {final int? pageSize,
      final CurrentData<T>? currentData,
      final dynamic args}) = _$RequestFirstLoading<T>;

  int? get pageSize;
  CurrentData<T>? get currentData;
  @override
  dynamic get args;
  @override
  @JsonKey(ignore: true)
  _$$RequestFirstLoadingCopyWith<T, _$RequestFirstLoading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirstLoadingCopyWith<T, $Res>
    implements $ReadyListStateCopyWith<T, $Res> {
  factory _$$FirstLoadingCopyWith(
          _$FirstLoading<T> value, $Res Function(_$FirstLoading<T>) then) =
      __$$FirstLoadingCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {ICancelToken? cancelToken,
      int? pageSize,
      CurrentData<T>? currentData,
      dynamic args});

  $CurrentDataCopyWith<T, $Res>? get currentData;
}

/// @nodoc
class __$$FirstLoadingCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res, _$FirstLoading<T>>
    implements _$$FirstLoadingCopyWith<T, $Res> {
  __$$FirstLoadingCopyWithImpl(
      _$FirstLoading<T> _value, $Res Function(_$FirstLoading<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancelToken = freezed,
    Object? pageSize = freezed,
    Object? currentData = freezed,
    Object? args = freezed,
  }) {
    return _then(_$FirstLoading<T>(
      cancelToken: freezed == cancelToken
          ? _value.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as ICancelToken?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      currentData: freezed == currentData
          ? _value.currentData
          : currentData // ignore: cast_nullable_to_non_nullable
              as CurrentData<T>?,
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentDataCopyWith<T, $Res>? get currentData {
    if (_value.currentData == null) {
      return null;
    }

    return $CurrentDataCopyWith<T, $Res>(_value.currentData!, (value) {
      return _then(_value.copyWith(currentData: value));
    });
  }
}

/// @nodoc

class _$FirstLoading<T> implements FirstLoading<T> {
  const _$FirstLoading(
      {this.cancelToken, this.pageSize, this.currentData, this.args});

  @override
  final ICancelToken? cancelToken;
  @override
  final int? pageSize;
  @override
  final CurrentData<T>? currentData;
  @override
  final dynamic args;

  @override
  String toString() {
    return 'ReadyListState<$T>.isLoadingFirst(cancelToken: $cancelToken, pageSize: $pageSize, currentData: $currentData, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstLoading<T> &&
            (identical(other.cancelToken, cancelToken) ||
                other.cancelToken == cancelToken) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.currentData, currentData) ||
                other.currentData == currentData) &&
            const DeepCollectionEquality().equals(other.args, args));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cancelToken, pageSize,
      currentData, const DeepCollectionEquality().hash(args));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirstLoadingCopyWith<T, _$FirstLoading<T>> get copyWith =>
      __$$FirstLoadingCopyWithImpl<T, _$FirstLoading<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, dynamic args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)
        isLoadingFirst,
    required TResult Function(ErrorDisplayCallBack display,
            CurrentData<T>? currentData, dynamic args)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)
        isLoaded,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isRefreshing,
  }) {
    return isLoadingFirst(cancelToken, pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult? Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
  }) {
    return isLoadingFirst?.call(cancelToken, pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
    required TResult orElse(),
  }) {
    if (isLoadingFirst != null) {
      return isLoadingFirst(cancelToken, pageSize, currentData, args);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(Refreshing<T> value) isRefreshing,
  }) {
    return isLoadingFirst(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T> value)? isLoadingFirst,
    TResult? Function(ErrorState<T> value)? error,
    TResult? Function(Loaded<T> value)? isLoaded,
    TResult? Function(RequestNext<T> value)? requestNext,
    TResult? Function(LoadingNext<T> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T> value)? requestRefresh,
    TResult? Function(Refreshing<T> value)? isRefreshing,
  }) {
    return isLoadingFirst?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(Refreshing<T> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (isLoadingFirst != null) {
      return isLoadingFirst(this);
    }
    return orElse();
  }
}

abstract class FirstLoading<T> implements ReadyListState<T> {
  const factory FirstLoading(
      {final ICancelToken? cancelToken,
      final int? pageSize,
      final CurrentData<T>? currentData,
      final dynamic args}) = _$FirstLoading<T>;

  ICancelToken? get cancelToken;
  int? get pageSize;
  CurrentData<T>? get currentData;
  @override
  dynamic get args;
  @override
  @JsonKey(ignore: true)
  _$$FirstLoadingCopyWith<T, _$FirstLoading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStateCopyWith<T, $Res>
    implements $ReadyListStateCopyWith<T, $Res> {
  factory _$$ErrorStateCopyWith(
          _$ErrorState<T> value, $Res Function(_$ErrorState<T>) then) =
      __$$ErrorStateCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {ErrorDisplayCallBack display,
      CurrentData<T>? currentData,
      dynamic args});

  $CurrentDataCopyWith<T, $Res>? get currentData;
}

/// @nodoc
class __$$ErrorStateCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res, _$ErrorState<T>>
    implements _$$ErrorStateCopyWith<T, $Res> {
  __$$ErrorStateCopyWithImpl(
      _$ErrorState<T> _value, $Res Function(_$ErrorState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? display = null,
    Object? currentData = freezed,
    Object? args = freezed,
  }) {
    return _then(_$ErrorState<T>(
      null == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as ErrorDisplayCallBack,
      freezed == currentData
          ? _value.currentData
          : currentData // ignore: cast_nullable_to_non_nullable
              as CurrentData<T>?,
      freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentDataCopyWith<T, $Res>? get currentData {
    if (_value.currentData == null) {
      return null;
    }

    return $CurrentDataCopyWith<T, $Res>(_value.currentData!, (value) {
      return _then(_value.copyWith(currentData: value));
    });
  }
}

/// @nodoc

class _$ErrorState<T> implements ErrorState<T> {
  const _$ErrorState(this.display, this.currentData, this.args);

  @override
  final ErrorDisplayCallBack display;
  @override
  final CurrentData<T>? currentData;
  @override
  final dynamic args;

  @override
  String toString() {
    return 'ReadyListState<$T>.error(display: $display, currentData: $currentData, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorState<T> &&
            (identical(other.display, display) || other.display == display) &&
            (identical(other.currentData, currentData) ||
                other.currentData == currentData) &&
            const DeepCollectionEquality().equals(other.args, args));
  }

  @override
  int get hashCode => Object.hash(runtimeType, display, currentData,
      const DeepCollectionEquality().hash(args));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateCopyWith<T, _$ErrorState<T>> get copyWith =>
      __$$ErrorStateCopyWithImpl<T, _$ErrorState<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, dynamic args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)
        isLoadingFirst,
    required TResult Function(ErrorDisplayCallBack display,
            CurrentData<T>? currentData, dynamic args)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)
        isLoaded,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isRefreshing,
  }) {
    return error(display, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult? Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
  }) {
    return error?.call(display, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(display, currentData, args);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(Refreshing<T> value) isRefreshing,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T> value)? isLoadingFirst,
    TResult? Function(ErrorState<T> value)? error,
    TResult? Function(Loaded<T> value)? isLoaded,
    TResult? Function(RequestNext<T> value)? requestNext,
    TResult? Function(LoadingNext<T> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T> value)? requestRefresh,
    TResult? Function(Refreshing<T> value)? isRefreshing,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(Refreshing<T> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState<T> implements ReadyListState<T> {
  const factory ErrorState(final ErrorDisplayCallBack display,
      final CurrentData<T>? currentData, final dynamic args) = _$ErrorState<T>;

  ErrorDisplayCallBack get display;
  CurrentData<T>? get currentData;
  @override
  dynamic get args;
  @override
  @JsonKey(ignore: true)
  _$$ErrorStateCopyWith<T, _$ErrorState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedCopyWith<T, $Res>
    implements $ReadyListStateCopyWith<T, $Res> {
  factory _$$LoadedCopyWith(
          _$Loaded<T> value, $Res Function(_$Loaded<T>) then) =
      __$$LoadedCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({Iterable<T> items, int totalCount, int? pageSize, dynamic args});
}

/// @nodoc
class __$$LoadedCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res, _$Loaded<T>>
    implements _$$LoadedCopyWith<T, $Res> {
  __$$LoadedCopyWithImpl(_$Loaded<T> _value, $Res Function(_$Loaded<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = null,
    Object? pageSize = freezed,
    Object? args = freezed,
  }) {
    return _then(_$Loaded<T>(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Iterable<T>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$Loaded<T> implements Loaded<T> {
  const _$Loaded(
      {required this.items,
      required this.totalCount,
      this.pageSize,
      this.args});

  @override
  final Iterable<T> items;
  @override
  final int totalCount;
  @override
  final int? pageSize;
  @override
  final dynamic args;

  @override
  String toString() {
    return 'ReadyListState<$T>.isLoaded(items: $items, totalCount: $totalCount, pageSize: $pageSize, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loaded<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality().equals(other.args, args));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      totalCount,
      pageSize,
      const DeepCollectionEquality().hash(args));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedCopyWith<T, _$Loaded<T>> get copyWith =>
      __$$LoadedCopyWithImpl<T, _$Loaded<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, dynamic args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)
        isLoadingFirst,
    required TResult Function(ErrorDisplayCallBack display,
            CurrentData<T>? currentData, dynamic args)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)
        isLoaded,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isRefreshing,
  }) {
    return isLoaded(items, totalCount, pageSize, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult? Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
  }) {
    return isLoaded?.call(items, totalCount, pageSize, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
    required TResult orElse(),
  }) {
    if (isLoaded != null) {
      return isLoaded(items, totalCount, pageSize, args);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(Refreshing<T> value) isRefreshing,
  }) {
    return isLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T> value)? isLoadingFirst,
    TResult? Function(ErrorState<T> value)? error,
    TResult? Function(Loaded<T> value)? isLoaded,
    TResult? Function(RequestNext<T> value)? requestNext,
    TResult? Function(LoadingNext<T> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T> value)? requestRefresh,
    TResult? Function(Refreshing<T> value)? isRefreshing,
  }) {
    return isLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(Refreshing<T> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (isLoaded != null) {
      return isLoaded(this);
    }
    return orElse();
  }
}

abstract class Loaded<T> implements ReadyListState<T> {
  const factory Loaded(
      {required final Iterable<T> items,
      required final int totalCount,
      final int? pageSize,
      final dynamic args}) = _$Loaded<T>;

  Iterable<T> get items;
  int get totalCount;
  int? get pageSize;
  @override
  dynamic get args;
  @override
  @JsonKey(ignore: true)
  _$$LoadedCopyWith<T, _$Loaded<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestNextCopyWith<T, $Res>
    implements $ReadyListStateCopyWith<T, $Res> {
  factory _$$RequestNextCopyWith(
          _$RequestNext<T> value, $Res Function(_$RequestNext<T>) then) =
      __$$RequestNextCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int? pageSize, CurrentData<T> currentData, dynamic args});

  $CurrentDataCopyWith<T, $Res> get currentData;
}

/// @nodoc
class __$$RequestNextCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res, _$RequestNext<T>>
    implements _$$RequestNextCopyWith<T, $Res> {
  __$$RequestNextCopyWithImpl(
      _$RequestNext<T> _value, $Res Function(_$RequestNext<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = freezed,
    Object? currentData = null,
    Object? args = freezed,
  }) {
    return _then(_$RequestNext<T>(
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      currentData: null == currentData
          ? _value.currentData
          : currentData // ignore: cast_nullable_to_non_nullable
              as CurrentData<T>,
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentDataCopyWith<T, $Res> get currentData {
    return $CurrentDataCopyWith<T, $Res>(_value.currentData, (value) {
      return _then(_value.copyWith(currentData: value));
    });
  }
}

/// @nodoc

class _$RequestNext<T> implements RequestNext<T> {
  const _$RequestNext({this.pageSize, required this.currentData, this.args});

  @override
  final int? pageSize;
  @override
  final CurrentData<T> currentData;
  @override
  final dynamic args;

  @override
  String toString() {
    return 'ReadyListState<$T>.requestNext(pageSize: $pageSize, currentData: $currentData, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestNext<T> &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.currentData, currentData) ||
                other.currentData == currentData) &&
            const DeepCollectionEquality().equals(other.args, args));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageSize, currentData,
      const DeepCollectionEquality().hash(args));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestNextCopyWith<T, _$RequestNext<T>> get copyWith =>
      __$$RequestNextCopyWithImpl<T, _$RequestNext<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, dynamic args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)
        isLoadingFirst,
    required TResult Function(ErrorDisplayCallBack display,
            CurrentData<T>? currentData, dynamic args)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)
        isLoaded,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isRefreshing,
  }) {
    return requestNext(pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult? Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
  }) {
    return requestNext?.call(pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
    required TResult orElse(),
  }) {
    if (requestNext != null) {
      return requestNext(pageSize, currentData, args);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(Refreshing<T> value) isRefreshing,
  }) {
    return requestNext(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T> value)? isLoadingFirst,
    TResult? Function(ErrorState<T> value)? error,
    TResult? Function(Loaded<T> value)? isLoaded,
    TResult? Function(RequestNext<T> value)? requestNext,
    TResult? Function(LoadingNext<T> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T> value)? requestRefresh,
    TResult? Function(Refreshing<T> value)? isRefreshing,
  }) {
    return requestNext?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(Refreshing<T> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (requestNext != null) {
      return requestNext(this);
    }
    return orElse();
  }
}

abstract class RequestNext<T> implements ReadyListState<T> {
  const factory RequestNext(
      {final int? pageSize,
      required final CurrentData<T> currentData,
      final dynamic args}) = _$RequestNext<T>;

  int? get pageSize;
  CurrentData<T> get currentData;
  @override
  dynamic get args;
  @override
  @JsonKey(ignore: true)
  _$$RequestNextCopyWith<T, _$RequestNext<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingNextCopyWith<T, $Res>
    implements $ReadyListStateCopyWith<T, $Res> {
  factory _$$LoadingNextCopyWith(
          _$LoadingNext<T> value, $Res Function(_$LoadingNext<T>) then) =
      __$$LoadingNextCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {ICancelToken? cancelToken,
      int? pageSize,
      CurrentData<T> currentData,
      dynamic args});

  $CurrentDataCopyWith<T, $Res> get currentData;
}

/// @nodoc
class __$$LoadingNextCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res, _$LoadingNext<T>>
    implements _$$LoadingNextCopyWith<T, $Res> {
  __$$LoadingNextCopyWithImpl(
      _$LoadingNext<T> _value, $Res Function(_$LoadingNext<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancelToken = freezed,
    Object? pageSize = freezed,
    Object? currentData = null,
    Object? args = freezed,
  }) {
    return _then(_$LoadingNext<T>(
      cancelToken: freezed == cancelToken
          ? _value.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as ICancelToken?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      currentData: null == currentData
          ? _value.currentData
          : currentData // ignore: cast_nullable_to_non_nullable
              as CurrentData<T>,
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentDataCopyWith<T, $Res> get currentData {
    return $CurrentDataCopyWith<T, $Res>(_value.currentData, (value) {
      return _then(_value.copyWith(currentData: value));
    });
  }
}

/// @nodoc

class _$LoadingNext<T> implements LoadingNext<T> {
  const _$LoadingNext(
      {this.cancelToken, this.pageSize, required this.currentData, this.args});

  @override
  final ICancelToken? cancelToken;
  @override
  final int? pageSize;
  @override
  final CurrentData<T> currentData;
  @override
  final dynamic args;

  @override
  String toString() {
    return 'ReadyListState<$T>.isLoadingNext(cancelToken: $cancelToken, pageSize: $pageSize, currentData: $currentData, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingNext<T> &&
            (identical(other.cancelToken, cancelToken) ||
                other.cancelToken == cancelToken) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.currentData, currentData) ||
                other.currentData == currentData) &&
            const DeepCollectionEquality().equals(other.args, args));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cancelToken, pageSize,
      currentData, const DeepCollectionEquality().hash(args));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingNextCopyWith<T, _$LoadingNext<T>> get copyWith =>
      __$$LoadingNextCopyWithImpl<T, _$LoadingNext<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, dynamic args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)
        isLoadingFirst,
    required TResult Function(ErrorDisplayCallBack display,
            CurrentData<T>? currentData, dynamic args)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)
        isLoaded,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isRefreshing,
  }) {
    return isLoadingNext(cancelToken, pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult? Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
  }) {
    return isLoadingNext?.call(cancelToken, pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
    required TResult orElse(),
  }) {
    if (isLoadingNext != null) {
      return isLoadingNext(cancelToken, pageSize, currentData, args);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(Refreshing<T> value) isRefreshing,
  }) {
    return isLoadingNext(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T> value)? isLoadingFirst,
    TResult? Function(ErrorState<T> value)? error,
    TResult? Function(Loaded<T> value)? isLoaded,
    TResult? Function(RequestNext<T> value)? requestNext,
    TResult? Function(LoadingNext<T> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T> value)? requestRefresh,
    TResult? Function(Refreshing<T> value)? isRefreshing,
  }) {
    return isLoadingNext?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(Refreshing<T> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (isLoadingNext != null) {
      return isLoadingNext(this);
    }
    return orElse();
  }
}

abstract class LoadingNext<T> implements ReadyListState<T> {
  const factory LoadingNext(
      {final ICancelToken? cancelToken,
      final int? pageSize,
      required final CurrentData<T> currentData,
      final dynamic args}) = _$LoadingNext<T>;

  ICancelToken? get cancelToken;
  int? get pageSize;
  CurrentData<T> get currentData;
  @override
  dynamic get args;
  @override
  @JsonKey(ignore: true)
  _$$LoadingNextCopyWith<T, _$LoadingNext<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestRefreshCopyWith<T, $Res>
    implements $ReadyListStateCopyWith<T, $Res> {
  factory _$$RequestRefreshCopyWith(
          _$RequestRefresh<T> value, $Res Function(_$RequestRefresh<T>) then) =
      __$$RequestRefreshCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int? pageSize, CurrentData<T> currentData, dynamic args});

  $CurrentDataCopyWith<T, $Res> get currentData;
}

/// @nodoc
class __$$RequestRefreshCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res, _$RequestRefresh<T>>
    implements _$$RequestRefreshCopyWith<T, $Res> {
  __$$RequestRefreshCopyWithImpl(
      _$RequestRefresh<T> _value, $Res Function(_$RequestRefresh<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = freezed,
    Object? currentData = null,
    Object? args = freezed,
  }) {
    return _then(_$RequestRefresh<T>(
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      currentData: null == currentData
          ? _value.currentData
          : currentData // ignore: cast_nullable_to_non_nullable
              as CurrentData<T>,
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentDataCopyWith<T, $Res> get currentData {
    return $CurrentDataCopyWith<T, $Res>(_value.currentData, (value) {
      return _then(_value.copyWith(currentData: value));
    });
  }
}

/// @nodoc

class _$RequestRefresh<T> implements RequestRefresh<T> {
  const _$RequestRefresh({this.pageSize, required this.currentData, this.args});

  @override
  final int? pageSize;
  @override
  final CurrentData<T> currentData;
  @override
  final dynamic args;

  @override
  String toString() {
    return 'ReadyListState<$T>.requestRefresh(pageSize: $pageSize, currentData: $currentData, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestRefresh<T> &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.currentData, currentData) ||
                other.currentData == currentData) &&
            const DeepCollectionEquality().equals(other.args, args));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageSize, currentData,
      const DeepCollectionEquality().hash(args));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestRefreshCopyWith<T, _$RequestRefresh<T>> get copyWith =>
      __$$RequestRefreshCopyWithImpl<T, _$RequestRefresh<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, dynamic args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)
        isLoadingFirst,
    required TResult Function(ErrorDisplayCallBack display,
            CurrentData<T>? currentData, dynamic args)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)
        isLoaded,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isRefreshing,
  }) {
    return requestRefresh(pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult? Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
  }) {
    return requestRefresh?.call(pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
    required TResult orElse(),
  }) {
    if (requestRefresh != null) {
      return requestRefresh(pageSize, currentData, args);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(Refreshing<T> value) isRefreshing,
  }) {
    return requestRefresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T> value)? isLoadingFirst,
    TResult? Function(ErrorState<T> value)? error,
    TResult? Function(Loaded<T> value)? isLoaded,
    TResult? Function(RequestNext<T> value)? requestNext,
    TResult? Function(LoadingNext<T> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T> value)? requestRefresh,
    TResult? Function(Refreshing<T> value)? isRefreshing,
  }) {
    return requestRefresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(Refreshing<T> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (requestRefresh != null) {
      return requestRefresh(this);
    }
    return orElse();
  }
}

abstract class RequestRefresh<T> implements ReadyListState<T> {
  const factory RequestRefresh(
      {final int? pageSize,
      required final CurrentData<T> currentData,
      final dynamic args}) = _$RequestRefresh<T>;

  int? get pageSize;
  CurrentData<T> get currentData;
  @override
  dynamic get args;
  @override
  @JsonKey(ignore: true)
  _$$RequestRefreshCopyWith<T, _$RequestRefresh<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshingCopyWith<T, $Res>
    implements $ReadyListStateCopyWith<T, $Res> {
  factory _$$RefreshingCopyWith(
          _$Refreshing<T> value, $Res Function(_$Refreshing<T>) then) =
      __$$RefreshingCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {ICancelToken? cancelToken,
      int? pageSize,
      CurrentData<T> currentData,
      dynamic args});

  $CurrentDataCopyWith<T, $Res> get currentData;
}

/// @nodoc
class __$$RefreshingCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res, _$Refreshing<T>>
    implements _$$RefreshingCopyWith<T, $Res> {
  __$$RefreshingCopyWithImpl(
      _$Refreshing<T> _value, $Res Function(_$Refreshing<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancelToken = freezed,
    Object? pageSize = freezed,
    Object? currentData = null,
    Object? args = freezed,
  }) {
    return _then(_$Refreshing<T>(
      cancelToken: freezed == cancelToken
          ? _value.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as ICancelToken?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      currentData: null == currentData
          ? _value.currentData
          : currentData // ignore: cast_nullable_to_non_nullable
              as CurrentData<T>,
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentDataCopyWith<T, $Res> get currentData {
    return $CurrentDataCopyWith<T, $Res>(_value.currentData, (value) {
      return _then(_value.copyWith(currentData: value));
    });
  }
}

/// @nodoc

class _$Refreshing<T> implements Refreshing<T> {
  const _$Refreshing(
      {this.cancelToken, this.pageSize, required this.currentData, this.args});

  @override
  final ICancelToken? cancelToken;
  @override
  final int? pageSize;
  @override
  final CurrentData<T> currentData;
  @override
  final dynamic args;

  @override
  String toString() {
    return 'ReadyListState<$T>.isRefreshing(cancelToken: $cancelToken, pageSize: $pageSize, currentData: $currentData, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Refreshing<T> &&
            (identical(other.cancelToken, cancelToken) ||
                other.cancelToken == cancelToken) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.currentData, currentData) ||
                other.currentData == currentData) &&
            const DeepCollectionEquality().equals(other.args, args));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cancelToken, pageSize,
      currentData, const DeepCollectionEquality().hash(args));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshingCopyWith<T, _$Refreshing<T>> get copyWith =>
      __$$RefreshingCopyWithImpl<T, _$Refreshing<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, dynamic args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)
        isLoadingFirst,
    required TResult Function(ErrorDisplayCallBack display,
            CurrentData<T>? currentData, dynamic args)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)
        isLoaded,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, dynamic args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)
        isRefreshing,
  }) {
    return isRefreshing(cancelToken, pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult? Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
  }) {
    return isRefreshing?.call(cancelToken, pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, dynamic args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, dynamic args)?
        isLoadingFirst,
    TResult Function(ErrorDisplayCallBack display, CurrentData<T>? currentData,
            dynamic args)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, dynamic args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, dynamic args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, dynamic args)?
        isRefreshing,
    required TResult orElse(),
  }) {
    if (isRefreshing != null) {
      return isRefreshing(cancelToken, pageSize, currentData, args);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(Refreshing<T> value) isRefreshing,
  }) {
    return isRefreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T> value)? initializing,
    TResult? Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T> value)? isLoadingFirst,
    TResult? Function(ErrorState<T> value)? error,
    TResult? Function(Loaded<T> value)? isLoaded,
    TResult? Function(RequestNext<T> value)? requestNext,
    TResult? Function(LoadingNext<T> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T> value)? requestRefresh,
    TResult? Function(Refreshing<T> value)? isRefreshing,
  }) {
    return isRefreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(Refreshing<T> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (isRefreshing != null) {
      return isRefreshing(this);
    }
    return orElse();
  }
}

abstract class Refreshing<T> implements ReadyListState<T> {
  const factory Refreshing(
      {final ICancelToken? cancelToken,
      final int? pageSize,
      required final CurrentData<T> currentData,
      final dynamic args}) = _$Refreshing<T>;

  ICancelToken? get cancelToken;
  int? get pageSize;
  CurrentData<T> get currentData;
  @override
  dynamic get args;
  @override
  @JsonKey(ignore: true)
  _$$RefreshingCopyWith<T, _$Refreshing<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
