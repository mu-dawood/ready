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
  $Res call({Iterable<T> items, int totalCount, int? pageSize});
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
  $Res call({Iterable<T> items, int totalCount, int? pageSize});
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
    ));
  }
}

/// @nodoc

class _$_CurrentData<T> implements _CurrentData<T> {
  const _$_CurrentData(
      {required this.items, required this.totalCount, this.pageSize});

  @override
  final Iterable<T> items;
  @override
  final int totalCount;
  @override
  final int? pageSize;

  @override
  String toString() {
    return 'CurrentData<$T>(items: $items, totalCount: $totalCount, pageSize: $pageSize)';
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
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(items), totalCount, pageSize);

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
      final int? pageSize}) = _$_CurrentData<T>;

  @override
  Iterable<T> get items;
  @override
  int get totalCount;
  @override
  int? get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$_CurrentDataCopyWith<T, _$_CurrentData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReadyListState<T, Args> {
  Args get args => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, Args args) initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, Args args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)
        isLoadingFirst,
    required TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)
        isLoaded,
    required TResult Function(int? pageSize, CurrentData<T> currentData, Args args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, Args args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize, CurrentData<T> currentData, Args args) isRefreshing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, Args args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult? Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isRefreshing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, Args args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isRefreshing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T, Args> value) initializing,
    required TResult Function(RequestFirstLoading<T, Args> value)
        requestFirstLoading,
    required TResult Function(FirstLoading<T, Args> value) isLoadingFirst,
    required TResult Function(ErrorState<T, Args> value) error,
    required TResult Function(Loaded<T, Args> value) isLoaded,
    required TResult Function(RequestNext<T, Args> value) requestNext,
    required TResult Function(LoadingNext<T, Args> value) isLoadingNext,
    required TResult Function(RequestRefresh<T, Args> value) requestRefresh,
    required TResult Function(Refreshing<T, Args> value) isRefreshing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T, Args> value)? initializing,
    TResult? Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult? Function(ErrorState<T, Args> value)? error,
    TResult? Function(Loaded<T, Args> value)? isLoaded,
    TResult? Function(RequestNext<T, Args> value)? requestNext,
    TResult? Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult? Function(Refreshing<T, Args> value)? isRefreshing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T, Args> value)? initializing,
    TResult Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult Function(ErrorState<T, Args> value)? error,
    TResult Function(Loaded<T, Args> value)? isLoaded,
    TResult Function(RequestNext<T, Args> value)? requestNext,
    TResult Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult Function(Refreshing<T, Args> value)? isRefreshing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadyListStateCopyWith<T, Args, ReadyListState<T, Args>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadyListStateCopyWith<T, Args, $Res> {
  factory $ReadyListStateCopyWith(ReadyListState<T, Args> value,
          $Res Function(ReadyListState<T, Args>) then) =
      _$ReadyListStateCopyWithImpl<T, Args, $Res, ReadyListState<T, Args>>;
  @useResult
  $Res call({Args args});
}

/// @nodoc
class _$ReadyListStateCopyWithImpl<T, Args, $Res,
        $Val extends ReadyListState<T, Args>>
    implements $ReadyListStateCopyWith<T, Args, $Res> {
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
              as Args,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitializingCopyWith<T, Args, $Res>
    implements $ReadyListStateCopyWith<T, Args, $Res> {
  factory _$$InitializingCopyWith(_$Initializing<T, Args> value,
          $Res Function(_$Initializing<T, Args>) then) =
      __$$InitializingCopyWithImpl<T, Args, $Res>;
  @override
  @useResult
  $Res call({bool requestFirstLoading, Args args});
}

/// @nodoc
class __$$InitializingCopyWithImpl<T, Args, $Res>
    extends _$ReadyListStateCopyWithImpl<T, Args, $Res, _$Initializing<T, Args>>
    implements _$$InitializingCopyWith<T, Args, $Res> {
  __$$InitializingCopyWithImpl(_$Initializing<T, Args> _value,
      $Res Function(_$Initializing<T, Args>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestFirstLoading = null,
    Object? args = freezed,
  }) {
    return _then(_$Initializing<T, Args>(
      requestFirstLoading: null == requestFirstLoading
          ? _value.requestFirstLoading
          : requestFirstLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as Args,
    ));
  }
}

/// @nodoc

class _$Initializing<T, Args> implements Initializing<T, Args> {
  const _$Initializing({this.requestFirstLoading = true, required this.args});

  @override
  @JsonKey()
  final bool requestFirstLoading;
  @override
  final Args args;

  @override
  String toString() {
    return 'ReadyListState<$T, $Args>.initializing(requestFirstLoading: $requestFirstLoading, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Initializing<T, Args> &&
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
  _$$InitializingCopyWith<T, Args, _$Initializing<T, Args>> get copyWith =>
      __$$InitializingCopyWithImpl<T, Args, _$Initializing<T, Args>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, Args args) initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, Args args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)
        isLoadingFirst,
    required TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)
        isLoaded,
    required TResult Function(int? pageSize, CurrentData<T> currentData, Args args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, Args args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize, CurrentData<T> currentData, Args args) isRefreshing,
  }) {
    return initializing(this.requestFirstLoading, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, Args args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult? Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isRefreshing,
  }) {
    return initializing?.call(this.requestFirstLoading, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, Args args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
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
    required TResult Function(Initializing<T, Args> value) initializing,
    required TResult Function(RequestFirstLoading<T, Args> value)
        requestFirstLoading,
    required TResult Function(FirstLoading<T, Args> value) isLoadingFirst,
    required TResult Function(ErrorState<T, Args> value) error,
    required TResult Function(Loaded<T, Args> value) isLoaded,
    required TResult Function(RequestNext<T, Args> value) requestNext,
    required TResult Function(LoadingNext<T, Args> value) isLoadingNext,
    required TResult Function(RequestRefresh<T, Args> value) requestRefresh,
    required TResult Function(Refreshing<T, Args> value) isRefreshing,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T, Args> value)? initializing,
    TResult? Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult? Function(ErrorState<T, Args> value)? error,
    TResult? Function(Loaded<T, Args> value)? isLoaded,
    TResult? Function(RequestNext<T, Args> value)? requestNext,
    TResult? Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult? Function(Refreshing<T, Args> value)? isRefreshing,
  }) {
    return initializing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T, Args> value)? initializing,
    TResult Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult Function(ErrorState<T, Args> value)? error,
    TResult Function(Loaded<T, Args> value)? isLoaded,
    TResult Function(RequestNext<T, Args> value)? requestNext,
    TResult Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult Function(Refreshing<T, Args> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class Initializing<T, Args> implements ReadyListState<T, Args> {
  const factory Initializing(
      {final bool requestFirstLoading,
      required final Args args}) = _$Initializing<T, Args>;

  bool get requestFirstLoading;
  @override
  Args get args;
  @override
  @JsonKey(ignore: true)
  _$$InitializingCopyWith<T, Args, _$Initializing<T, Args>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestFirstLoadingCopyWith<T, Args, $Res>
    implements $ReadyListStateCopyWith<T, Args, $Res> {
  factory _$$RequestFirstLoadingCopyWith(_$RequestFirstLoading<T, Args> value,
          $Res Function(_$RequestFirstLoading<T, Args>) then) =
      __$$RequestFirstLoadingCopyWithImpl<T, Args, $Res>;
  @override
  @useResult
  $Res call({int? pageSize, CurrentData<T>? currentData, Args args});

  $CurrentDataCopyWith<T, $Res>? get currentData;
}

/// @nodoc
class __$$RequestFirstLoadingCopyWithImpl<T, Args, $Res>
    extends _$ReadyListStateCopyWithImpl<T, Args, $Res,
        _$RequestFirstLoading<T, Args>>
    implements _$$RequestFirstLoadingCopyWith<T, Args, $Res> {
  __$$RequestFirstLoadingCopyWithImpl(_$RequestFirstLoading<T, Args> _value,
      $Res Function(_$RequestFirstLoading<T, Args>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = freezed,
    Object? currentData = freezed,
    Object? args = freezed,
  }) {
    return _then(_$RequestFirstLoading<T, Args>(
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
              as Args,
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

class _$RequestFirstLoading<T, Args> implements RequestFirstLoading<T, Args> {
  const _$RequestFirstLoading(
      {this.pageSize, this.currentData, required this.args});

  @override
  final int? pageSize;
  @override
  final CurrentData<T>? currentData;
  @override
  final Args args;

  @override
  String toString() {
    return 'ReadyListState<$T, $Args>.requestFirstLoading(pageSize: $pageSize, currentData: $currentData, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestFirstLoading<T, Args> &&
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
  _$$RequestFirstLoadingCopyWith<T, Args, _$RequestFirstLoading<T, Args>>
      get copyWith => __$$RequestFirstLoadingCopyWithImpl<T, Args,
          _$RequestFirstLoading<T, Args>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, Args args) initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, Args args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)
        isLoadingFirst,
    required TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)
        isLoaded,
    required TResult Function(int? pageSize, CurrentData<T> currentData, Args args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, Args args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize, CurrentData<T> currentData, Args args) isRefreshing,
  }) {
    return requestFirstLoading(pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, Args args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult? Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isRefreshing,
  }) {
    return requestFirstLoading?.call(pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, Args args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
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
    required TResult Function(Initializing<T, Args> value) initializing,
    required TResult Function(RequestFirstLoading<T, Args> value)
        requestFirstLoading,
    required TResult Function(FirstLoading<T, Args> value) isLoadingFirst,
    required TResult Function(ErrorState<T, Args> value) error,
    required TResult Function(Loaded<T, Args> value) isLoaded,
    required TResult Function(RequestNext<T, Args> value) requestNext,
    required TResult Function(LoadingNext<T, Args> value) isLoadingNext,
    required TResult Function(RequestRefresh<T, Args> value) requestRefresh,
    required TResult Function(Refreshing<T, Args> value) isRefreshing,
  }) {
    return requestFirstLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T, Args> value)? initializing,
    TResult? Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult? Function(ErrorState<T, Args> value)? error,
    TResult? Function(Loaded<T, Args> value)? isLoaded,
    TResult? Function(RequestNext<T, Args> value)? requestNext,
    TResult? Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult? Function(Refreshing<T, Args> value)? isRefreshing,
  }) {
    return requestFirstLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T, Args> value)? initializing,
    TResult Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult Function(ErrorState<T, Args> value)? error,
    TResult Function(Loaded<T, Args> value)? isLoaded,
    TResult Function(RequestNext<T, Args> value)? requestNext,
    TResult Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult Function(Refreshing<T, Args> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (requestFirstLoading != null) {
      return requestFirstLoading(this);
    }
    return orElse();
  }
}

abstract class RequestFirstLoading<T, Args> implements ReadyListState<T, Args> {
  const factory RequestFirstLoading(
      {final int? pageSize,
      final CurrentData<T>? currentData,
      required final Args args}) = _$RequestFirstLoading<T, Args>;

  int? get pageSize;
  CurrentData<T>? get currentData;
  @override
  Args get args;
  @override
  @JsonKey(ignore: true)
  _$$RequestFirstLoadingCopyWith<T, Args, _$RequestFirstLoading<T, Args>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirstLoadingCopyWith<T, Args, $Res>
    implements $ReadyListStateCopyWith<T, Args, $Res> {
  factory _$$FirstLoadingCopyWith(_$FirstLoading<T, Args> value,
          $Res Function(_$FirstLoading<T, Args>) then) =
      __$$FirstLoadingCopyWithImpl<T, Args, $Res>;
  @override
  @useResult
  $Res call(
      {ICancelToken? cancelToken,
      int? pageSize,
      CurrentData<T>? currentData,
      Args args});

  $CurrentDataCopyWith<T, $Res>? get currentData;
}

/// @nodoc
class __$$FirstLoadingCopyWithImpl<T, Args, $Res>
    extends _$ReadyListStateCopyWithImpl<T, Args, $Res, _$FirstLoading<T, Args>>
    implements _$$FirstLoadingCopyWith<T, Args, $Res> {
  __$$FirstLoadingCopyWithImpl(_$FirstLoading<T, Args> _value,
      $Res Function(_$FirstLoading<T, Args>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancelToken = freezed,
    Object? pageSize = freezed,
    Object? currentData = freezed,
    Object? args = freezed,
  }) {
    return _then(_$FirstLoading<T, Args>(
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
              as Args,
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

class _$FirstLoading<T, Args> implements FirstLoading<T, Args> {
  const _$FirstLoading(
      {this.cancelToken, this.pageSize, this.currentData, required this.args});

  @override
  final ICancelToken? cancelToken;
  @override
  final int? pageSize;
  @override
  final CurrentData<T>? currentData;
  @override
  final Args args;

  @override
  String toString() {
    return 'ReadyListState<$T, $Args>.isLoadingFirst(cancelToken: $cancelToken, pageSize: $pageSize, currentData: $currentData, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstLoading<T, Args> &&
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
  _$$FirstLoadingCopyWith<T, Args, _$FirstLoading<T, Args>> get copyWith =>
      __$$FirstLoadingCopyWithImpl<T, Args, _$FirstLoading<T, Args>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, Args args) initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, Args args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)
        isLoadingFirst,
    required TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)
        isLoaded,
    required TResult Function(int? pageSize, CurrentData<T> currentData, Args args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, Args args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize, CurrentData<T> currentData, Args args) isRefreshing,
  }) {
    return isLoadingFirst(cancelToken, pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, Args args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult? Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isRefreshing,
  }) {
    return isLoadingFirst?.call(cancelToken, pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, Args args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
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
    required TResult Function(Initializing<T, Args> value) initializing,
    required TResult Function(RequestFirstLoading<T, Args> value)
        requestFirstLoading,
    required TResult Function(FirstLoading<T, Args> value) isLoadingFirst,
    required TResult Function(ErrorState<T, Args> value) error,
    required TResult Function(Loaded<T, Args> value) isLoaded,
    required TResult Function(RequestNext<T, Args> value) requestNext,
    required TResult Function(LoadingNext<T, Args> value) isLoadingNext,
    required TResult Function(RequestRefresh<T, Args> value) requestRefresh,
    required TResult Function(Refreshing<T, Args> value) isRefreshing,
  }) {
    return isLoadingFirst(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T, Args> value)? initializing,
    TResult? Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult? Function(ErrorState<T, Args> value)? error,
    TResult? Function(Loaded<T, Args> value)? isLoaded,
    TResult? Function(RequestNext<T, Args> value)? requestNext,
    TResult? Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult? Function(Refreshing<T, Args> value)? isRefreshing,
  }) {
    return isLoadingFirst?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T, Args> value)? initializing,
    TResult Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult Function(ErrorState<T, Args> value)? error,
    TResult Function(Loaded<T, Args> value)? isLoaded,
    TResult Function(RequestNext<T, Args> value)? requestNext,
    TResult Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult Function(Refreshing<T, Args> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (isLoadingFirst != null) {
      return isLoadingFirst(this);
    }
    return orElse();
  }
}

abstract class FirstLoading<T, Args> implements ReadyListState<T, Args> {
  const factory FirstLoading(
      {final ICancelToken? cancelToken,
      final int? pageSize,
      final CurrentData<T>? currentData,
      required final Args args}) = _$FirstLoading<T, Args>;

  ICancelToken? get cancelToken;
  int? get pageSize;
  CurrentData<T>? get currentData;
  @override
  Args get args;
  @override
  @JsonKey(ignore: true)
  _$$FirstLoadingCopyWith<T, Args, _$FirstLoading<T, Args>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStateCopyWith<T, Args, $Res>
    implements $ReadyListStateCopyWith<T, Args, $Res> {
  factory _$$ErrorStateCopyWith(_$ErrorState<T, Args> value,
          $Res Function(_$ErrorState<T, Args>) then) =
      __$$ErrorStateCopyWithImpl<T, Args, $Res>;
  @override
  @useResult
  $Res call(
      {Args args, ErrorDisplayCallBack display, CurrentData<T>? currentData});

  $CurrentDataCopyWith<T, $Res>? get currentData;
}

/// @nodoc
class __$$ErrorStateCopyWithImpl<T, Args, $Res>
    extends _$ReadyListStateCopyWithImpl<T, Args, $Res, _$ErrorState<T, Args>>
    implements _$$ErrorStateCopyWith<T, Args, $Res> {
  __$$ErrorStateCopyWithImpl(
      _$ErrorState<T, Args> _value, $Res Function(_$ErrorState<T, Args>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? args = freezed,
    Object? display = null,
    Object? currentData = freezed,
  }) {
    return _then(_$ErrorState<T, Args>(
      args: freezed == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as Args,
      display: null == display
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as ErrorDisplayCallBack,
      currentData: freezed == currentData
          ? _value.currentData
          : currentData // ignore: cast_nullable_to_non_nullable
              as CurrentData<T>?,
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

class _$ErrorState<T, Args> implements ErrorState<T, Args> {
  const _$ErrorState(
      {required this.args, required this.display, this.currentData});

  @override
  final Args args;
  @override
  final ErrorDisplayCallBack display;
  @override
  final CurrentData<T>? currentData;

  @override
  String toString() {
    return 'ReadyListState<$T, $Args>.error(args: $args, display: $display, currentData: $currentData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorState<T, Args> &&
            const DeepCollectionEquality().equals(other.args, args) &&
            (identical(other.display, display) || other.display == display) &&
            (identical(other.currentData, currentData) ||
                other.currentData == currentData));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(args), display, currentData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateCopyWith<T, Args, _$ErrorState<T, Args>> get copyWith =>
      __$$ErrorStateCopyWithImpl<T, Args, _$ErrorState<T, Args>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, Args args) initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, Args args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)
        isLoadingFirst,
    required TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)
        isLoaded,
    required TResult Function(int? pageSize, CurrentData<T> currentData, Args args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, Args args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize, CurrentData<T> currentData, Args args) isRefreshing,
  }) {
    return error(args, display, currentData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, Args args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult? Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isRefreshing,
  }) {
    return error?.call(args, display, currentData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, Args args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isRefreshing,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(args, display, currentData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T, Args> value) initializing,
    required TResult Function(RequestFirstLoading<T, Args> value)
        requestFirstLoading,
    required TResult Function(FirstLoading<T, Args> value) isLoadingFirst,
    required TResult Function(ErrorState<T, Args> value) error,
    required TResult Function(Loaded<T, Args> value) isLoaded,
    required TResult Function(RequestNext<T, Args> value) requestNext,
    required TResult Function(LoadingNext<T, Args> value) isLoadingNext,
    required TResult Function(RequestRefresh<T, Args> value) requestRefresh,
    required TResult Function(Refreshing<T, Args> value) isRefreshing,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T, Args> value)? initializing,
    TResult? Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult? Function(ErrorState<T, Args> value)? error,
    TResult? Function(Loaded<T, Args> value)? isLoaded,
    TResult? Function(RequestNext<T, Args> value)? requestNext,
    TResult? Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult? Function(Refreshing<T, Args> value)? isRefreshing,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T, Args> value)? initializing,
    TResult Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult Function(ErrorState<T, Args> value)? error,
    TResult Function(Loaded<T, Args> value)? isLoaded,
    TResult Function(RequestNext<T, Args> value)? requestNext,
    TResult Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult Function(Refreshing<T, Args> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState<T, Args> implements ReadyListState<T, Args> {
  const factory ErrorState(
      {required final Args args,
      required final ErrorDisplayCallBack display,
      final CurrentData<T>? currentData}) = _$ErrorState<T, Args>;

  @override
  Args get args;
  ErrorDisplayCallBack get display;
  CurrentData<T>? get currentData;
  @override
  @JsonKey(ignore: true)
  _$$ErrorStateCopyWith<T, Args, _$ErrorState<T, Args>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedCopyWith<T, Args, $Res>
    implements $ReadyListStateCopyWith<T, Args, $Res> {
  factory _$$LoadedCopyWith(
          _$Loaded<T, Args> value, $Res Function(_$Loaded<T, Args>) then) =
      __$$LoadedCopyWithImpl<T, Args, $Res>;
  @override
  @useResult
  $Res call({Iterable<T> items, int totalCount, int? pageSize, Args args});
}

/// @nodoc
class __$$LoadedCopyWithImpl<T, Args, $Res>
    extends _$ReadyListStateCopyWithImpl<T, Args, $Res, _$Loaded<T, Args>>
    implements _$$LoadedCopyWith<T, Args, $Res> {
  __$$LoadedCopyWithImpl(
      _$Loaded<T, Args> _value, $Res Function(_$Loaded<T, Args>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = null,
    Object? pageSize = freezed,
    Object? args = freezed,
  }) {
    return _then(_$Loaded<T, Args>(
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
              as Args,
    ));
  }
}

/// @nodoc

class _$Loaded<T, Args> implements Loaded<T, Args> {
  const _$Loaded(
      {required this.items,
      required this.totalCount,
      this.pageSize,
      required this.args});

  @override
  final Iterable<T> items;
  @override
  final int totalCount;
  @override
  final int? pageSize;
  @override
  final Args args;

  @override
  String toString() {
    return 'ReadyListState<$T, $Args>.isLoaded(items: $items, totalCount: $totalCount, pageSize: $pageSize, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loaded<T, Args> &&
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
  _$$LoadedCopyWith<T, Args, _$Loaded<T, Args>> get copyWith =>
      __$$LoadedCopyWithImpl<T, Args, _$Loaded<T, Args>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, Args args) initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, Args args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)
        isLoadingFirst,
    required TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)
        isLoaded,
    required TResult Function(int? pageSize, CurrentData<T> currentData, Args args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, Args args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize, CurrentData<T> currentData, Args args) isRefreshing,
  }) {
    return isLoaded(items, totalCount, pageSize, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, Args args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult? Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isRefreshing,
  }) {
    return isLoaded?.call(items, totalCount, pageSize, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, Args args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
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
    required TResult Function(Initializing<T, Args> value) initializing,
    required TResult Function(RequestFirstLoading<T, Args> value)
        requestFirstLoading,
    required TResult Function(FirstLoading<T, Args> value) isLoadingFirst,
    required TResult Function(ErrorState<T, Args> value) error,
    required TResult Function(Loaded<T, Args> value) isLoaded,
    required TResult Function(RequestNext<T, Args> value) requestNext,
    required TResult Function(LoadingNext<T, Args> value) isLoadingNext,
    required TResult Function(RequestRefresh<T, Args> value) requestRefresh,
    required TResult Function(Refreshing<T, Args> value) isRefreshing,
  }) {
    return isLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T, Args> value)? initializing,
    TResult? Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult? Function(ErrorState<T, Args> value)? error,
    TResult? Function(Loaded<T, Args> value)? isLoaded,
    TResult? Function(RequestNext<T, Args> value)? requestNext,
    TResult? Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult? Function(Refreshing<T, Args> value)? isRefreshing,
  }) {
    return isLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T, Args> value)? initializing,
    TResult Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult Function(ErrorState<T, Args> value)? error,
    TResult Function(Loaded<T, Args> value)? isLoaded,
    TResult Function(RequestNext<T, Args> value)? requestNext,
    TResult Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult Function(Refreshing<T, Args> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (isLoaded != null) {
      return isLoaded(this);
    }
    return orElse();
  }
}

abstract class Loaded<T, Args> implements ReadyListState<T, Args> {
  const factory Loaded(
      {required final Iterable<T> items,
      required final int totalCount,
      final int? pageSize,
      required final Args args}) = _$Loaded<T, Args>;

  Iterable<T> get items;
  int get totalCount;
  int? get pageSize;
  @override
  Args get args;
  @override
  @JsonKey(ignore: true)
  _$$LoadedCopyWith<T, Args, _$Loaded<T, Args>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestNextCopyWith<T, Args, $Res>
    implements $ReadyListStateCopyWith<T, Args, $Res> {
  factory _$$RequestNextCopyWith(_$RequestNext<T, Args> value,
          $Res Function(_$RequestNext<T, Args>) then) =
      __$$RequestNextCopyWithImpl<T, Args, $Res>;
  @override
  @useResult
  $Res call({int? pageSize, CurrentData<T> currentData, Args args});

  $CurrentDataCopyWith<T, $Res> get currentData;
}

/// @nodoc
class __$$RequestNextCopyWithImpl<T, Args, $Res>
    extends _$ReadyListStateCopyWithImpl<T, Args, $Res, _$RequestNext<T, Args>>
    implements _$$RequestNextCopyWith<T, Args, $Res> {
  __$$RequestNextCopyWithImpl(_$RequestNext<T, Args> _value,
      $Res Function(_$RequestNext<T, Args>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = freezed,
    Object? currentData = null,
    Object? args = freezed,
  }) {
    return _then(_$RequestNext<T, Args>(
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
              as Args,
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

class _$RequestNext<T, Args> implements RequestNext<T, Args> {
  const _$RequestNext(
      {this.pageSize, required this.currentData, required this.args});

  @override
  final int? pageSize;
  @override
  final CurrentData<T> currentData;
  @override
  final Args args;

  @override
  String toString() {
    return 'ReadyListState<$T, $Args>.requestNext(pageSize: $pageSize, currentData: $currentData, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestNext<T, Args> &&
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
  _$$RequestNextCopyWith<T, Args, _$RequestNext<T, Args>> get copyWith =>
      __$$RequestNextCopyWithImpl<T, Args, _$RequestNext<T, Args>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, Args args) initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, Args args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)
        isLoadingFirst,
    required TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)
        isLoaded,
    required TResult Function(int? pageSize, CurrentData<T> currentData, Args args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, Args args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize, CurrentData<T> currentData, Args args) isRefreshing,
  }) {
    return requestNext(pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, Args args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult? Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isRefreshing,
  }) {
    return requestNext?.call(pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, Args args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
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
    required TResult Function(Initializing<T, Args> value) initializing,
    required TResult Function(RequestFirstLoading<T, Args> value)
        requestFirstLoading,
    required TResult Function(FirstLoading<T, Args> value) isLoadingFirst,
    required TResult Function(ErrorState<T, Args> value) error,
    required TResult Function(Loaded<T, Args> value) isLoaded,
    required TResult Function(RequestNext<T, Args> value) requestNext,
    required TResult Function(LoadingNext<T, Args> value) isLoadingNext,
    required TResult Function(RequestRefresh<T, Args> value) requestRefresh,
    required TResult Function(Refreshing<T, Args> value) isRefreshing,
  }) {
    return requestNext(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T, Args> value)? initializing,
    TResult? Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult? Function(ErrorState<T, Args> value)? error,
    TResult? Function(Loaded<T, Args> value)? isLoaded,
    TResult? Function(RequestNext<T, Args> value)? requestNext,
    TResult? Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult? Function(Refreshing<T, Args> value)? isRefreshing,
  }) {
    return requestNext?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T, Args> value)? initializing,
    TResult Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult Function(ErrorState<T, Args> value)? error,
    TResult Function(Loaded<T, Args> value)? isLoaded,
    TResult Function(RequestNext<T, Args> value)? requestNext,
    TResult Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult Function(Refreshing<T, Args> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (requestNext != null) {
      return requestNext(this);
    }
    return orElse();
  }
}

abstract class RequestNext<T, Args> implements ReadyListState<T, Args> {
  const factory RequestNext(
      {final int? pageSize,
      required final CurrentData<T> currentData,
      required final Args args}) = _$RequestNext<T, Args>;

  int? get pageSize;
  CurrentData<T> get currentData;
  @override
  Args get args;
  @override
  @JsonKey(ignore: true)
  _$$RequestNextCopyWith<T, Args, _$RequestNext<T, Args>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingNextCopyWith<T, Args, $Res>
    implements $ReadyListStateCopyWith<T, Args, $Res> {
  factory _$$LoadingNextCopyWith(_$LoadingNext<T, Args> value,
          $Res Function(_$LoadingNext<T, Args>) then) =
      __$$LoadingNextCopyWithImpl<T, Args, $Res>;
  @override
  @useResult
  $Res call(
      {ICancelToken? cancelToken,
      int? pageSize,
      CurrentData<T> currentData,
      Args args});

  $CurrentDataCopyWith<T, $Res> get currentData;
}

/// @nodoc
class __$$LoadingNextCopyWithImpl<T, Args, $Res>
    extends _$ReadyListStateCopyWithImpl<T, Args, $Res, _$LoadingNext<T, Args>>
    implements _$$LoadingNextCopyWith<T, Args, $Res> {
  __$$LoadingNextCopyWithImpl(_$LoadingNext<T, Args> _value,
      $Res Function(_$LoadingNext<T, Args>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancelToken = freezed,
    Object? pageSize = freezed,
    Object? currentData = null,
    Object? args = freezed,
  }) {
    return _then(_$LoadingNext<T, Args>(
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
              as Args,
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

class _$LoadingNext<T, Args> implements LoadingNext<T, Args> {
  const _$LoadingNext(
      {this.cancelToken,
      this.pageSize,
      required this.currentData,
      required this.args});

  @override
  final ICancelToken? cancelToken;
  @override
  final int? pageSize;
  @override
  final CurrentData<T> currentData;
  @override
  final Args args;

  @override
  String toString() {
    return 'ReadyListState<$T, $Args>.isLoadingNext(cancelToken: $cancelToken, pageSize: $pageSize, currentData: $currentData, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingNext<T, Args> &&
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
  _$$LoadingNextCopyWith<T, Args, _$LoadingNext<T, Args>> get copyWith =>
      __$$LoadingNextCopyWithImpl<T, Args, _$LoadingNext<T, Args>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, Args args) initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, Args args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)
        isLoadingFirst,
    required TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)
        isLoaded,
    required TResult Function(int? pageSize, CurrentData<T> currentData, Args args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, Args args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize, CurrentData<T> currentData, Args args) isRefreshing,
  }) {
    return isLoadingNext(cancelToken, pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, Args args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult? Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isRefreshing,
  }) {
    return isLoadingNext?.call(cancelToken, pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, Args args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
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
    required TResult Function(Initializing<T, Args> value) initializing,
    required TResult Function(RequestFirstLoading<T, Args> value)
        requestFirstLoading,
    required TResult Function(FirstLoading<T, Args> value) isLoadingFirst,
    required TResult Function(ErrorState<T, Args> value) error,
    required TResult Function(Loaded<T, Args> value) isLoaded,
    required TResult Function(RequestNext<T, Args> value) requestNext,
    required TResult Function(LoadingNext<T, Args> value) isLoadingNext,
    required TResult Function(RequestRefresh<T, Args> value) requestRefresh,
    required TResult Function(Refreshing<T, Args> value) isRefreshing,
  }) {
    return isLoadingNext(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T, Args> value)? initializing,
    TResult? Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult? Function(ErrorState<T, Args> value)? error,
    TResult? Function(Loaded<T, Args> value)? isLoaded,
    TResult? Function(RequestNext<T, Args> value)? requestNext,
    TResult? Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult? Function(Refreshing<T, Args> value)? isRefreshing,
  }) {
    return isLoadingNext?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T, Args> value)? initializing,
    TResult Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult Function(ErrorState<T, Args> value)? error,
    TResult Function(Loaded<T, Args> value)? isLoaded,
    TResult Function(RequestNext<T, Args> value)? requestNext,
    TResult Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult Function(Refreshing<T, Args> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (isLoadingNext != null) {
      return isLoadingNext(this);
    }
    return orElse();
  }
}

abstract class LoadingNext<T, Args> implements ReadyListState<T, Args> {
  const factory LoadingNext(
      {final ICancelToken? cancelToken,
      final int? pageSize,
      required final CurrentData<T> currentData,
      required final Args args}) = _$LoadingNext<T, Args>;

  ICancelToken? get cancelToken;
  int? get pageSize;
  CurrentData<T> get currentData;
  @override
  Args get args;
  @override
  @JsonKey(ignore: true)
  _$$LoadingNextCopyWith<T, Args, _$LoadingNext<T, Args>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestRefreshCopyWith<T, Args, $Res>
    implements $ReadyListStateCopyWith<T, Args, $Res> {
  factory _$$RequestRefreshCopyWith(_$RequestRefresh<T, Args> value,
          $Res Function(_$RequestRefresh<T, Args>) then) =
      __$$RequestRefreshCopyWithImpl<T, Args, $Res>;
  @override
  @useResult
  $Res call({int? pageSize, CurrentData<T> currentData, Args args});

  $CurrentDataCopyWith<T, $Res> get currentData;
}

/// @nodoc
class __$$RequestRefreshCopyWithImpl<T, Args, $Res>
    extends _$ReadyListStateCopyWithImpl<T, Args, $Res,
        _$RequestRefresh<T, Args>>
    implements _$$RequestRefreshCopyWith<T, Args, $Res> {
  __$$RequestRefreshCopyWithImpl(_$RequestRefresh<T, Args> _value,
      $Res Function(_$RequestRefresh<T, Args>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = freezed,
    Object? currentData = null,
    Object? args = freezed,
  }) {
    return _then(_$RequestRefresh<T, Args>(
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
              as Args,
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

class _$RequestRefresh<T, Args> implements RequestRefresh<T, Args> {
  const _$RequestRefresh(
      {this.pageSize, required this.currentData, required this.args});

  @override
  final int? pageSize;
  @override
  final CurrentData<T> currentData;
  @override
  final Args args;

  @override
  String toString() {
    return 'ReadyListState<$T, $Args>.requestRefresh(pageSize: $pageSize, currentData: $currentData, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestRefresh<T, Args> &&
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
  _$$RequestRefreshCopyWith<T, Args, _$RequestRefresh<T, Args>> get copyWith =>
      __$$RequestRefreshCopyWithImpl<T, Args, _$RequestRefresh<T, Args>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, Args args) initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, Args args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)
        isLoadingFirst,
    required TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)
        isLoaded,
    required TResult Function(int? pageSize, CurrentData<T> currentData, Args args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, Args args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize, CurrentData<T> currentData, Args args) isRefreshing,
  }) {
    return requestRefresh(pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, Args args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult? Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isRefreshing,
  }) {
    return requestRefresh?.call(pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, Args args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
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
    required TResult Function(Initializing<T, Args> value) initializing,
    required TResult Function(RequestFirstLoading<T, Args> value)
        requestFirstLoading,
    required TResult Function(FirstLoading<T, Args> value) isLoadingFirst,
    required TResult Function(ErrorState<T, Args> value) error,
    required TResult Function(Loaded<T, Args> value) isLoaded,
    required TResult Function(RequestNext<T, Args> value) requestNext,
    required TResult Function(LoadingNext<T, Args> value) isLoadingNext,
    required TResult Function(RequestRefresh<T, Args> value) requestRefresh,
    required TResult Function(Refreshing<T, Args> value) isRefreshing,
  }) {
    return requestRefresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T, Args> value)? initializing,
    TResult? Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult? Function(ErrorState<T, Args> value)? error,
    TResult? Function(Loaded<T, Args> value)? isLoaded,
    TResult? Function(RequestNext<T, Args> value)? requestNext,
    TResult? Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult? Function(Refreshing<T, Args> value)? isRefreshing,
  }) {
    return requestRefresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T, Args> value)? initializing,
    TResult Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult Function(ErrorState<T, Args> value)? error,
    TResult Function(Loaded<T, Args> value)? isLoaded,
    TResult Function(RequestNext<T, Args> value)? requestNext,
    TResult Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult Function(Refreshing<T, Args> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (requestRefresh != null) {
      return requestRefresh(this);
    }
    return orElse();
  }
}

abstract class RequestRefresh<T, Args> implements ReadyListState<T, Args> {
  const factory RequestRefresh(
      {final int? pageSize,
      required final CurrentData<T> currentData,
      required final Args args}) = _$RequestRefresh<T, Args>;

  int? get pageSize;
  CurrentData<T> get currentData;
  @override
  Args get args;
  @override
  @JsonKey(ignore: true)
  _$$RequestRefreshCopyWith<T, Args, _$RequestRefresh<T, Args>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshingCopyWith<T, Args, $Res>
    implements $ReadyListStateCopyWith<T, Args, $Res> {
  factory _$$RefreshingCopyWith(_$Refreshing<T, Args> value,
          $Res Function(_$Refreshing<T, Args>) then) =
      __$$RefreshingCopyWithImpl<T, Args, $Res>;
  @override
  @useResult
  $Res call(
      {ICancelToken? cancelToken,
      int? pageSize,
      CurrentData<T> currentData,
      Args args});

  $CurrentDataCopyWith<T, $Res> get currentData;
}

/// @nodoc
class __$$RefreshingCopyWithImpl<T, Args, $Res>
    extends _$ReadyListStateCopyWithImpl<T, Args, $Res, _$Refreshing<T, Args>>
    implements _$$RefreshingCopyWith<T, Args, $Res> {
  __$$RefreshingCopyWithImpl(
      _$Refreshing<T, Args> _value, $Res Function(_$Refreshing<T, Args>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancelToken = freezed,
    Object? pageSize = freezed,
    Object? currentData = null,
    Object? args = freezed,
  }) {
    return _then(_$Refreshing<T, Args>(
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
              as Args,
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

class _$Refreshing<T, Args> implements Refreshing<T, Args> {
  const _$Refreshing(
      {this.cancelToken,
      this.pageSize,
      required this.currentData,
      required this.args});

  @override
  final ICancelToken? cancelToken;
  @override
  final int? pageSize;
  @override
  final CurrentData<T> currentData;
  @override
  final Args args;

  @override
  String toString() {
    return 'ReadyListState<$T, $Args>.isRefreshing(cancelToken: $cancelToken, pageSize: $pageSize, currentData: $currentData, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Refreshing<T, Args> &&
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
  _$$RefreshingCopyWith<T, Args, _$Refreshing<T, Args>> get copyWith =>
      __$$RefreshingCopyWithImpl<T, Args, _$Refreshing<T, Args>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, Args args) initializing,
    required TResult Function(
            int? pageSize, CurrentData<T>? currentData, Args args)
        requestFirstLoading,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)
        isLoadingFirst,
    required TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)
        error,
    required TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)
        isLoaded,
    required TResult Function(int? pageSize, CurrentData<T> currentData, Args args)
        requestNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)
        isLoadingNext,
    required TResult Function(
            int? pageSize, CurrentData<T> currentData, Args args)
        requestRefresh,
    required TResult Function(ICancelToken? cancelToken, int? pageSize, CurrentData<T> currentData, Args args) isRefreshing,
  }) {
    return isRefreshing(cancelToken, pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool requestFirstLoading, Args args)? initializing,
    TResult? Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult? Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult? Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult? Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult? Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isRefreshing,
  }) {
    return isRefreshing?.call(cancelToken, pageSize, currentData, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, Args args)? initializing,
    TResult Function(int? pageSize, CurrentData<T>? currentData, Args args)?
        requestFirstLoading,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T>? currentData, Args args)?
        isLoadingFirst,
    TResult Function(Args args, ErrorDisplayCallBack display,
            CurrentData<T>? currentData)?
        error,
    TResult Function(
            Iterable<T> items, int totalCount, int? pageSize, Args args)?
        isLoaded,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
        isLoadingNext,
    TResult Function(int? pageSize, CurrentData<T> currentData, Args args)?
        requestRefresh,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            CurrentData<T> currentData, Args args)?
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
    required TResult Function(Initializing<T, Args> value) initializing,
    required TResult Function(RequestFirstLoading<T, Args> value)
        requestFirstLoading,
    required TResult Function(FirstLoading<T, Args> value) isLoadingFirst,
    required TResult Function(ErrorState<T, Args> value) error,
    required TResult Function(Loaded<T, Args> value) isLoaded,
    required TResult Function(RequestNext<T, Args> value) requestNext,
    required TResult Function(LoadingNext<T, Args> value) isLoadingNext,
    required TResult Function(RequestRefresh<T, Args> value) requestRefresh,
    required TResult Function(Refreshing<T, Args> value) isRefreshing,
  }) {
    return isRefreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initializing<T, Args> value)? initializing,
    TResult? Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult? Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult? Function(ErrorState<T, Args> value)? error,
    TResult? Function(Loaded<T, Args> value)? isLoaded,
    TResult? Function(RequestNext<T, Args> value)? requestNext,
    TResult? Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult? Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult? Function(Refreshing<T, Args> value)? isRefreshing,
  }) {
    return isRefreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T, Args> value)? initializing,
    TResult Function(RequestFirstLoading<T, Args> value)? requestFirstLoading,
    TResult Function(FirstLoading<T, Args> value)? isLoadingFirst,
    TResult Function(ErrorState<T, Args> value)? error,
    TResult Function(Loaded<T, Args> value)? isLoaded,
    TResult Function(RequestNext<T, Args> value)? requestNext,
    TResult Function(LoadingNext<T, Args> value)? isLoadingNext,
    TResult Function(RequestRefresh<T, Args> value)? requestRefresh,
    TResult Function(Refreshing<T, Args> value)? isRefreshing,
    required TResult orElse(),
  }) {
    if (isRefreshing != null) {
      return isRefreshing(this);
    }
    return orElse();
  }
}

abstract class Refreshing<T, Args> implements ReadyListState<T, Args> {
  const factory Refreshing(
      {final ICancelToken? cancelToken,
      final int? pageSize,
      required final CurrentData<T> currentData,
      required final Args args}) = _$Refreshing<T, Args>;

  ICancelToken? get cancelToken;
  int? get pageSize;
  CurrentData<T> get currentData;
  @override
  Args get args;
  @override
  @JsonKey(ignore: true)
  _$$RefreshingCopyWith<T, Args, _$Refreshing<T, Args>> get copyWith =>
      throw _privateConstructorUsedError;
}
