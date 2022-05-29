// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of controllers;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReadyListState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(ReadyListState<T>? oldState) isEmpty,
    required TResult Function(
            ErrorDisplayCallBack display, ReadyListState<T>? oldState)
        error,
    required TResult Function(ICancelToken? cancelToken, int? pageSize)
        isLoadingFirst,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isLoadingNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isRefreshing,
    required TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)
        isLoaded,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestNext,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestRefresh,
    required TResult Function(int? pageSize, ReadyListState<T>? oldState)
        requestFirstLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Empty<T> value) isEmpty,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(Refreshing<T> value) isRefreshing,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadyListStateCopyWith<T, $Res> {
  factory $ReadyListStateCopyWith(
          ReadyListState<T> value, $Res Function(ReadyListState<T>) then) =
      _$ReadyListStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ReadyListStateCopyWithImpl<T, $Res>
    implements $ReadyListStateCopyWith<T, $Res> {
  _$ReadyListStateCopyWithImpl(this._value, this._then);

  final ReadyListState<T> _value;
  // ignore: unused_field
  final $Res Function(ReadyListState<T>) _then;
}

/// @nodoc
abstract class _$$InitializingCopyWith<T, $Res> {
  factory _$$InitializingCopyWith(
          _$Initializing<T> value, $Res Function(_$Initializing<T>) then) =
      __$$InitializingCopyWithImpl<T, $Res>;
  $Res call({bool requestFirstLoading, dynamic args});
}

/// @nodoc
class __$$InitializingCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$$InitializingCopyWith<T, $Res> {
  __$$InitializingCopyWithImpl(
      _$Initializing<T> _value, $Res Function(_$Initializing<T>) _then)
      : super(_value, (v) => _then(v as _$Initializing<T>));

  @override
  _$Initializing<T> get _value => super._value as _$Initializing<T>;

  @override
  $Res call({
    Object? requestFirstLoading = freezed,
    Object? args = freezed,
  }) {
    return _then(_$Initializing<T>(
      requestFirstLoading: requestFirstLoading == freezed
          ? _value.requestFirstLoading
          : requestFirstLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      args: args == freezed
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
            const DeepCollectionEquality()
                .equals(other.requestFirstLoading, requestFirstLoading) &&
            const DeepCollectionEquality().equals(other.args, args));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(requestFirstLoading),
      const DeepCollectionEquality().hash(args));

  @JsonKey(ignore: true)
  @override
  _$$InitializingCopyWith<T, _$Initializing<T>> get copyWith =>
      __$$InitializingCopyWithImpl<T, _$Initializing<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(ReadyListState<T>? oldState) isEmpty,
    required TResult Function(
            ErrorDisplayCallBack display, ReadyListState<T>? oldState)
        error,
    required TResult Function(ICancelToken? cancelToken, int? pageSize)
        isLoadingFirst,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isLoadingNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isRefreshing,
    required TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)
        isLoaded,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestNext,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestRefresh,
    required TResult Function(int? pageSize, ReadyListState<T>? oldState)
        requestFirstLoading,
  }) {
    return initializing(this.requestFirstLoading, args);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
  }) {
    return initializing?.call(this.requestFirstLoading, args);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
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
    required TResult Function(Empty<T> value) isEmpty,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(Refreshing<T> value) isRefreshing,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
  }) {
    return initializing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
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

  bool get requestFirstLoading => throw _privateConstructorUsedError;
  dynamic get args => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$InitializingCopyWith<T, _$Initializing<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyCopyWith<T, $Res> {
  factory _$$EmptyCopyWith(_$Empty<T> value, $Res Function(_$Empty<T>) then) =
      __$$EmptyCopyWithImpl<T, $Res>;
  $Res call({ReadyListState<T>? oldState});

  $ReadyListStateCopyWith<T, $Res>? get oldState;
}

/// @nodoc
class __$$EmptyCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$$EmptyCopyWith<T, $Res> {
  __$$EmptyCopyWithImpl(_$Empty<T> _value, $Res Function(_$Empty<T>) _then)
      : super(_value, (v) => _then(v as _$Empty<T>));

  @override
  _$Empty<T> get _value => super._value as _$Empty<T>;

  @override
  $Res call({
    Object? oldState = freezed,
  }) {
    return _then(_$Empty<T>(
      oldState == freezed
          ? _value.oldState
          : oldState // ignore: cast_nullable_to_non_nullable
              as ReadyListState<T>?,
    ));
  }

  @override
  $ReadyListStateCopyWith<T, $Res>? get oldState {
    if (_value.oldState == null) {
      return null;
    }

    return $ReadyListStateCopyWith<T, $Res>(_value.oldState!, (value) {
      return _then(_value.copyWith(oldState: value));
    });
  }
}

/// @nodoc

class _$Empty<T> implements Empty<T> {
  const _$Empty([this.oldState]);

  @override
  final ReadyListState<T>? oldState;

  @override
  String toString() {
    return 'ReadyListState<$T>.isEmpty(oldState: $oldState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Empty<T> &&
            const DeepCollectionEquality().equals(other.oldState, oldState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(oldState));

  @JsonKey(ignore: true)
  @override
  _$$EmptyCopyWith<T, _$Empty<T>> get copyWith =>
      __$$EmptyCopyWithImpl<T, _$Empty<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(ReadyListState<T>? oldState) isEmpty,
    required TResult Function(
            ErrorDisplayCallBack display, ReadyListState<T>? oldState)
        error,
    required TResult Function(ICancelToken? cancelToken, int? pageSize)
        isLoadingFirst,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isLoadingNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isRefreshing,
    required TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)
        isLoaded,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestNext,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestRefresh,
    required TResult Function(int? pageSize, ReadyListState<T>? oldState)
        requestFirstLoading,
  }) {
    return isEmpty(oldState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
  }) {
    return isEmpty?.call(oldState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
    required TResult orElse(),
  }) {
    if (isEmpty != null) {
      return isEmpty(oldState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Empty<T> value) isEmpty,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(Refreshing<T> value) isRefreshing,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
  }) {
    return isEmpty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
  }) {
    return isEmpty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    required TResult orElse(),
  }) {
    if (isEmpty != null) {
      return isEmpty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements ReadyListState<T>, IRemoteResult<T> {
  const factory Empty([final ReadyListState<T>? oldState]) = _$Empty<T>;

  ReadyListState<T>? get oldState => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$EmptyCopyWith<T, _$Empty<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorStateCopyWith<T, $Res> {
  factory _$$ErrorStateCopyWith(
          _$ErrorState<T> value, $Res Function(_$ErrorState<T>) then) =
      __$$ErrorStateCopyWithImpl<T, $Res>;
  $Res call({ErrorDisplayCallBack display, ReadyListState<T>? oldState});

  $ReadyListStateCopyWith<T, $Res>? get oldState;
}

/// @nodoc
class __$$ErrorStateCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$$ErrorStateCopyWith<T, $Res> {
  __$$ErrorStateCopyWithImpl(
      _$ErrorState<T> _value, $Res Function(_$ErrorState<T>) _then)
      : super(_value, (v) => _then(v as _$ErrorState<T>));

  @override
  _$ErrorState<T> get _value => super._value as _$ErrorState<T>;

  @override
  $Res call({
    Object? display = freezed,
    Object? oldState = freezed,
  }) {
    return _then(_$ErrorState<T>(
      display == freezed
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as ErrorDisplayCallBack,
      oldState == freezed
          ? _value.oldState
          : oldState // ignore: cast_nullable_to_non_nullable
              as ReadyListState<T>?,
    ));
  }

  @override
  $ReadyListStateCopyWith<T, $Res>? get oldState {
    if (_value.oldState == null) {
      return null;
    }

    return $ReadyListStateCopyWith<T, $Res>(_value.oldState!, (value) {
      return _then(_value.copyWith(oldState: value));
    });
  }
}

/// @nodoc

class _$ErrorState<T> implements ErrorState<T> {
  const _$ErrorState(this.display, [this.oldState]);

  @override
  final ErrorDisplayCallBack display;
  @override
  final ReadyListState<T>? oldState;

  @override
  String toString() {
    return 'ReadyListState<$T>.error(display: $display, oldState: $oldState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorState<T> &&
            (identical(other.display, display) || other.display == display) &&
            const DeepCollectionEquality().equals(other.oldState, oldState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, display, const DeepCollectionEquality().hash(oldState));

  @JsonKey(ignore: true)
  @override
  _$$ErrorStateCopyWith<T, _$ErrorState<T>> get copyWith =>
      __$$ErrorStateCopyWithImpl<T, _$ErrorState<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(ReadyListState<T>? oldState) isEmpty,
    required TResult Function(
            ErrorDisplayCallBack display, ReadyListState<T>? oldState)
        error,
    required TResult Function(ICancelToken? cancelToken, int? pageSize)
        isLoadingFirst,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isLoadingNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isRefreshing,
    required TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)
        isLoaded,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestNext,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestRefresh,
    required TResult Function(int? pageSize, ReadyListState<T>? oldState)
        requestFirstLoading,
  }) {
    return error(display, oldState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
  }) {
    return error?.call(display, oldState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(display, oldState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Empty<T> value) isEmpty,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(Refreshing<T> value) isRefreshing,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorState<T> implements ReadyListState<T>, IRemoteResult<T> {
  const factory ErrorState(final ErrorDisplayCallBack display,
      [final ReadyListState<T>? oldState]) = _$ErrorState<T>;

  ErrorDisplayCallBack get display => throw _privateConstructorUsedError;
  ReadyListState<T>? get oldState => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$ErrorStateCopyWith<T, _$ErrorState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirstLoadingCopyWith<T, $Res> {
  factory _$$FirstLoadingCopyWith(
          _$FirstLoading<T> value, $Res Function(_$FirstLoading<T>) then) =
      __$$FirstLoadingCopyWithImpl<T, $Res>;
  $Res call({ICancelToken? cancelToken, int? pageSize});
}

/// @nodoc
class __$$FirstLoadingCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$$FirstLoadingCopyWith<T, $Res> {
  __$$FirstLoadingCopyWithImpl(
      _$FirstLoading<T> _value, $Res Function(_$FirstLoading<T>) _then)
      : super(_value, (v) => _then(v as _$FirstLoading<T>));

  @override
  _$FirstLoading<T> get _value => super._value as _$FirstLoading<T>;

  @override
  $Res call({
    Object? cancelToken = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_$FirstLoading<T>(
      cancelToken: cancelToken == freezed
          ? _value.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as ICancelToken?,
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$FirstLoading<T> implements FirstLoading<T> {
  const _$FirstLoading({this.cancelToken, this.pageSize});

  @override
  final ICancelToken? cancelToken;
  @override
  final int? pageSize;

  @override
  String toString() {
    return 'ReadyListState<$T>.isLoadingFirst(cancelToken: $cancelToken, pageSize: $pageSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirstLoading<T> &&
            const DeepCollectionEquality()
                .equals(other.cancelToken, cancelToken) &&
            const DeepCollectionEquality().equals(other.pageSize, pageSize));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cancelToken),
      const DeepCollectionEquality().hash(pageSize));

  @JsonKey(ignore: true)
  @override
  _$$FirstLoadingCopyWith<T, _$FirstLoading<T>> get copyWith =>
      __$$FirstLoadingCopyWithImpl<T, _$FirstLoading<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(ReadyListState<T>? oldState) isEmpty,
    required TResult Function(
            ErrorDisplayCallBack display, ReadyListState<T>? oldState)
        error,
    required TResult Function(ICancelToken? cancelToken, int? pageSize)
        isLoadingFirst,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isLoadingNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isRefreshing,
    required TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)
        isLoaded,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestNext,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestRefresh,
    required TResult Function(int? pageSize, ReadyListState<T>? oldState)
        requestFirstLoading,
  }) {
    return isLoadingFirst(cancelToken, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
  }) {
    return isLoadingFirst?.call(cancelToken, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
    required TResult orElse(),
  }) {
    if (isLoadingFirst != null) {
      return isLoadingFirst(cancelToken, pageSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Empty<T> value) isEmpty,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(Refreshing<T> value) isRefreshing,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
  }) {
    return isLoadingFirst(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
  }) {
    return isLoadingFirst?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
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
      final int? pageSize}) = _$FirstLoading<T>;

  ICancelToken? get cancelToken => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$FirstLoadingCopyWith<T, _$FirstLoading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingNextCopyWith<T, $Res> {
  factory _$$LoadingNextCopyWith(
          _$LoadingNext<T> value, $Res Function(_$LoadingNext<T>) then) =
      __$$LoadingNextCopyWithImpl<T, $Res>;
  $Res call(
      {ICancelToken? cancelToken,
      int? pageSize,
      Iterable<T> items,
      int totalCount});
}

/// @nodoc
class __$$LoadingNextCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$$LoadingNextCopyWith<T, $Res> {
  __$$LoadingNextCopyWithImpl(
      _$LoadingNext<T> _value, $Res Function(_$LoadingNext<T>) _then)
      : super(_value, (v) => _then(v as _$LoadingNext<T>));

  @override
  _$LoadingNext<T> get _value => super._value as _$LoadingNext<T>;

  @override
  $Res call({
    Object? cancelToken = freezed,
    Object? pageSize = freezed,
    Object? items = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$LoadingNext<T>(
      cancelToken: cancelToken == freezed
          ? _value.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as ICancelToken?,
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Iterable<T>,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadingNext<T> implements LoadingNext<T> {
  const _$LoadingNext(
      {this.cancelToken,
      this.pageSize,
      required this.items,
      required this.totalCount});

  @override
  final ICancelToken? cancelToken;
  @override
  final int? pageSize;
  @override
  final Iterable<T> items;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'ReadyListState<$T>.isLoadingNext(cancelToken: $cancelToken, pageSize: $pageSize, items: $items, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingNext<T> &&
            const DeepCollectionEquality()
                .equals(other.cancelToken, cancelToken) &&
            const DeepCollectionEquality().equals(other.pageSize, pageSize) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cancelToken),
      const DeepCollectionEquality().hash(pageSize),
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  _$$LoadingNextCopyWith<T, _$LoadingNext<T>> get copyWith =>
      __$$LoadingNextCopyWithImpl<T, _$LoadingNext<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(ReadyListState<T>? oldState) isEmpty,
    required TResult Function(
            ErrorDisplayCallBack display, ReadyListState<T>? oldState)
        error,
    required TResult Function(ICancelToken? cancelToken, int? pageSize)
        isLoadingFirst,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isLoadingNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isRefreshing,
    required TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)
        isLoaded,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestNext,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestRefresh,
    required TResult Function(int? pageSize, ReadyListState<T>? oldState)
        requestFirstLoading,
  }) {
    return isLoadingNext(cancelToken, pageSize, items, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
  }) {
    return isLoadingNext?.call(cancelToken, pageSize, items, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
    required TResult orElse(),
  }) {
    if (isLoadingNext != null) {
      return isLoadingNext(cancelToken, pageSize, items, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Empty<T> value) isEmpty,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(Refreshing<T> value) isRefreshing,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
  }) {
    return isLoadingNext(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
  }) {
    return isLoadingNext?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
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
      required final Iterable<T> items,
      required final int totalCount}) = _$LoadingNext<T>;

  ICancelToken? get cancelToken => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  Iterable<T> get items => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$LoadingNextCopyWith<T, _$LoadingNext<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshingCopyWith<T, $Res> {
  factory _$$RefreshingCopyWith(
          _$Refreshing<T> value, $Res Function(_$Refreshing<T>) then) =
      __$$RefreshingCopyWithImpl<T, $Res>;
  $Res call(
      {ICancelToken? cancelToken,
      int? pageSize,
      Iterable<T> items,
      int totalCount});
}

/// @nodoc
class __$$RefreshingCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$$RefreshingCopyWith<T, $Res> {
  __$$RefreshingCopyWithImpl(
      _$Refreshing<T> _value, $Res Function(_$Refreshing<T>) _then)
      : super(_value, (v) => _then(v as _$Refreshing<T>));

  @override
  _$Refreshing<T> get _value => super._value as _$Refreshing<T>;

  @override
  $Res call({
    Object? cancelToken = freezed,
    Object? pageSize = freezed,
    Object? items = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$Refreshing<T>(
      cancelToken: cancelToken == freezed
          ? _value.cancelToken
          : cancelToken // ignore: cast_nullable_to_non_nullable
              as ICancelToken?,
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Iterable<T>,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Refreshing<T> implements Refreshing<T> {
  const _$Refreshing(
      {this.cancelToken,
      this.pageSize,
      required this.items,
      required this.totalCount});

  @override
  final ICancelToken? cancelToken;
  @override
  final int? pageSize;
  @override
  final Iterable<T> items;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'ReadyListState<$T>.isRefreshing(cancelToken: $cancelToken, pageSize: $pageSize, items: $items, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Refreshing<T> &&
            const DeepCollectionEquality()
                .equals(other.cancelToken, cancelToken) &&
            const DeepCollectionEquality().equals(other.pageSize, pageSize) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cancelToken),
      const DeepCollectionEquality().hash(pageSize),
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  _$$RefreshingCopyWith<T, _$Refreshing<T>> get copyWith =>
      __$$RefreshingCopyWithImpl<T, _$Refreshing<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(ReadyListState<T>? oldState) isEmpty,
    required TResult Function(
            ErrorDisplayCallBack display, ReadyListState<T>? oldState)
        error,
    required TResult Function(ICancelToken? cancelToken, int? pageSize)
        isLoadingFirst,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isLoadingNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isRefreshing,
    required TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)
        isLoaded,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestNext,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestRefresh,
    required TResult Function(int? pageSize, ReadyListState<T>? oldState)
        requestFirstLoading,
  }) {
    return isRefreshing(cancelToken, pageSize, items, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
  }) {
    return isRefreshing?.call(cancelToken, pageSize, items, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
    required TResult orElse(),
  }) {
    if (isRefreshing != null) {
      return isRefreshing(cancelToken, pageSize, items, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Empty<T> value) isEmpty,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(Refreshing<T> value) isRefreshing,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
  }) {
    return isRefreshing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
  }) {
    return isRefreshing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
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
      required final Iterable<T> items,
      required final int totalCount}) = _$Refreshing<T>;

  ICancelToken? get cancelToken => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  Iterable<T> get items => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RefreshingCopyWith<T, _$Refreshing<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedCopyWith<T, $Res> {
  factory _$$LoadedCopyWith(
          _$Loaded<T> value, $Res Function(_$Loaded<T>) then) =
      __$$LoadedCopyWithImpl<T, $Res>;
  $Res call({Iterable<T> items, int totalCount, ReadyListState<T>? oldState});

  $ReadyListStateCopyWith<T, $Res>? get oldState;
}

/// @nodoc
class __$$LoadedCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$$LoadedCopyWith<T, $Res> {
  __$$LoadedCopyWithImpl(_$Loaded<T> _value, $Res Function(_$Loaded<T>) _then)
      : super(_value, (v) => _then(v as _$Loaded<T>));

  @override
  _$Loaded<T> get _value => super._value as _$Loaded<T>;

  @override
  $Res call({
    Object? items = freezed,
    Object? totalCount = freezed,
    Object? oldState = freezed,
  }) {
    return _then(_$Loaded<T>(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Iterable<T>,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      oldState: oldState == freezed
          ? _value.oldState
          : oldState // ignore: cast_nullable_to_non_nullable
              as ReadyListState<T>?,
    ));
  }

  @override
  $ReadyListStateCopyWith<T, $Res>? get oldState {
    if (_value.oldState == null) {
      return null;
    }

    return $ReadyListStateCopyWith<T, $Res>(_value.oldState!, (value) {
      return _then(_value.copyWith(oldState: value));
    });
  }
}

/// @nodoc

class _$Loaded<T> implements Loaded<T> {
  const _$Loaded(
      {required this.items, required this.totalCount, this.oldState});

  @override
  final Iterable<T> items;
  @override
  final int totalCount;
  @override
  final ReadyListState<T>? oldState;

  @override
  String toString() {
    return 'ReadyListState<$T>.isLoaded(items: $items, totalCount: $totalCount, oldState: $oldState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loaded<T> &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount) &&
            const DeepCollectionEquality().equals(other.oldState, oldState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(totalCount),
      const DeepCollectionEquality().hash(oldState));

  @JsonKey(ignore: true)
  @override
  _$$LoadedCopyWith<T, _$Loaded<T>> get copyWith =>
      __$$LoadedCopyWithImpl<T, _$Loaded<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(ReadyListState<T>? oldState) isEmpty,
    required TResult Function(
            ErrorDisplayCallBack display, ReadyListState<T>? oldState)
        error,
    required TResult Function(ICancelToken? cancelToken, int? pageSize)
        isLoadingFirst,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isLoadingNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isRefreshing,
    required TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)
        isLoaded,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestNext,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestRefresh,
    required TResult Function(int? pageSize, ReadyListState<T>? oldState)
        requestFirstLoading,
  }) {
    return isLoaded(items, totalCount, oldState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
  }) {
    return isLoaded?.call(items, totalCount, oldState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
    required TResult orElse(),
  }) {
    if (isLoaded != null) {
      return isLoaded(items, totalCount, oldState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Empty<T> value) isEmpty,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(Refreshing<T> value) isRefreshing,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
  }) {
    return isLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
  }) {
    return isLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
    required TResult orElse(),
  }) {
    if (isLoaded != null) {
      return isLoaded(this);
    }
    return orElse();
  }
}

abstract class Loaded<T> implements ReadyListState<T>, IRemoteResult<T> {
  const factory Loaded(
      {required final Iterable<T> items,
      required final int totalCount,
      final ReadyListState<T>? oldState}) = _$Loaded<T>;

  Iterable<T> get items => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  ReadyListState<T>? get oldState => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$LoadedCopyWith<T, _$Loaded<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestNextCopyWith<T, $Res> {
  factory _$$RequestNextCopyWith(
          _$RequestNext<T> value, $Res Function(_$RequestNext<T>) then) =
      __$$RequestNextCopyWithImpl<T, $Res>;
  $Res call({int? pageSize, Iterable<T> items, int totalCount});
}

/// @nodoc
class __$$RequestNextCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$$RequestNextCopyWith<T, $Res> {
  __$$RequestNextCopyWithImpl(
      _$RequestNext<T> _value, $Res Function(_$RequestNext<T>) _then)
      : super(_value, (v) => _then(v as _$RequestNext<T>));

  @override
  _$RequestNext<T> get _value => super._value as _$RequestNext<T>;

  @override
  $Res call({
    Object? pageSize = freezed,
    Object? items = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$RequestNext<T>(
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Iterable<T>,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RequestNext<T> implements RequestNext<T> {
  const _$RequestNext(
      {this.pageSize, required this.items, required this.totalCount});

  @override
  final int? pageSize;
  @override
  final Iterable<T> items;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'ReadyListState<$T>.requestNext(pageSize: $pageSize, items: $items, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestNext<T> &&
            const DeepCollectionEquality().equals(other.pageSize, pageSize) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pageSize),
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  _$$RequestNextCopyWith<T, _$RequestNext<T>> get copyWith =>
      __$$RequestNextCopyWithImpl<T, _$RequestNext<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(ReadyListState<T>? oldState) isEmpty,
    required TResult Function(
            ErrorDisplayCallBack display, ReadyListState<T>? oldState)
        error,
    required TResult Function(ICancelToken? cancelToken, int? pageSize)
        isLoadingFirst,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isLoadingNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isRefreshing,
    required TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)
        isLoaded,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestNext,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestRefresh,
    required TResult Function(int? pageSize, ReadyListState<T>? oldState)
        requestFirstLoading,
  }) {
    return requestNext(pageSize, items, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
  }) {
    return requestNext?.call(pageSize, items, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
    required TResult orElse(),
  }) {
    if (requestNext != null) {
      return requestNext(pageSize, items, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Empty<T> value) isEmpty,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(Refreshing<T> value) isRefreshing,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
  }) {
    return requestNext(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
  }) {
    return requestNext?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
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
      required final Iterable<T> items,
      required final int totalCount}) = _$RequestNext<T>;

  int? get pageSize => throw _privateConstructorUsedError;
  Iterable<T> get items => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RequestNextCopyWith<T, _$RequestNext<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestRefreshCopyWith<T, $Res> {
  factory _$$RequestRefreshCopyWith(
          _$RequestRefresh<T> value, $Res Function(_$RequestRefresh<T>) then) =
      __$$RequestRefreshCopyWithImpl<T, $Res>;
  $Res call({int? pageSize, Iterable<T> items, int totalCount});
}

/// @nodoc
class __$$RequestRefreshCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$$RequestRefreshCopyWith<T, $Res> {
  __$$RequestRefreshCopyWithImpl(
      _$RequestRefresh<T> _value, $Res Function(_$RequestRefresh<T>) _then)
      : super(_value, (v) => _then(v as _$RequestRefresh<T>));

  @override
  _$RequestRefresh<T> get _value => super._value as _$RequestRefresh<T>;

  @override
  $Res call({
    Object? pageSize = freezed,
    Object? items = freezed,
    Object? totalCount = freezed,
  }) {
    return _then(_$RequestRefresh<T>(
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Iterable<T>,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RequestRefresh<T> implements RequestRefresh<T> {
  const _$RequestRefresh(
      {this.pageSize, required this.items, required this.totalCount});

  @override
  final int? pageSize;
  @override
  final Iterable<T> items;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'ReadyListState<$T>.requestRefresh(pageSize: $pageSize, items: $items, totalCount: $totalCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestRefresh<T> &&
            const DeepCollectionEquality().equals(other.pageSize, pageSize) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pageSize),
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(totalCount));

  @JsonKey(ignore: true)
  @override
  _$$RequestRefreshCopyWith<T, _$RequestRefresh<T>> get copyWith =>
      __$$RequestRefreshCopyWithImpl<T, _$RequestRefresh<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(ReadyListState<T>? oldState) isEmpty,
    required TResult Function(
            ErrorDisplayCallBack display, ReadyListState<T>? oldState)
        error,
    required TResult Function(ICancelToken? cancelToken, int? pageSize)
        isLoadingFirst,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isLoadingNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isRefreshing,
    required TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)
        isLoaded,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestNext,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestRefresh,
    required TResult Function(int? pageSize, ReadyListState<T>? oldState)
        requestFirstLoading,
  }) {
    return requestRefresh(pageSize, items, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
  }) {
    return requestRefresh?.call(pageSize, items, totalCount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
    required TResult orElse(),
  }) {
    if (requestRefresh != null) {
      return requestRefresh(pageSize, items, totalCount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Empty<T> value) isEmpty,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(Refreshing<T> value) isRefreshing,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
  }) {
    return requestRefresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
  }) {
    return requestRefresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
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
      required final Iterable<T> items,
      required final int totalCount}) = _$RequestRefresh<T>;

  int? get pageSize => throw _privateConstructorUsedError;
  Iterable<T> get items => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RequestRefreshCopyWith<T, _$RequestRefresh<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestFirstLoadingCopyWith<T, $Res> {
  factory _$$RequestFirstLoadingCopyWith(_$RequestFirstLoading<T> value,
          $Res Function(_$RequestFirstLoading<T>) then) =
      __$$RequestFirstLoadingCopyWithImpl<T, $Res>;
  $Res call({int? pageSize, ReadyListState<T>? oldState});

  $ReadyListStateCopyWith<T, $Res>? get oldState;
}

/// @nodoc
class __$$RequestFirstLoadingCopyWithImpl<T, $Res>
    extends _$ReadyListStateCopyWithImpl<T, $Res>
    implements _$$RequestFirstLoadingCopyWith<T, $Res> {
  __$$RequestFirstLoadingCopyWithImpl(_$RequestFirstLoading<T> _value,
      $Res Function(_$RequestFirstLoading<T>) _then)
      : super(_value, (v) => _then(v as _$RequestFirstLoading<T>));

  @override
  _$RequestFirstLoading<T> get _value =>
      super._value as _$RequestFirstLoading<T>;

  @override
  $Res call({
    Object? pageSize = freezed,
    Object? oldState = freezed,
  }) {
    return _then(_$RequestFirstLoading<T>(
      pageSize: pageSize == freezed
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      oldState: oldState == freezed
          ? _value.oldState
          : oldState // ignore: cast_nullable_to_non_nullable
              as ReadyListState<T>?,
    ));
  }

  @override
  $ReadyListStateCopyWith<T, $Res>? get oldState {
    if (_value.oldState == null) {
      return null;
    }

    return $ReadyListStateCopyWith<T, $Res>(_value.oldState!, (value) {
      return _then(_value.copyWith(oldState: value));
    });
  }
}

/// @nodoc

class _$RequestFirstLoading<T> implements RequestFirstLoading<T> {
  const _$RequestFirstLoading({this.pageSize, this.oldState});

  @override
  final int? pageSize;
  @override
  final ReadyListState<T>? oldState;

  @override
  String toString() {
    return 'ReadyListState<$T>.requestFirstLoading(pageSize: $pageSize, oldState: $oldState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestFirstLoading<T> &&
            const DeepCollectionEquality().equals(other.pageSize, pageSize) &&
            const DeepCollectionEquality().equals(other.oldState, oldState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pageSize),
      const DeepCollectionEquality().hash(oldState));

  @JsonKey(ignore: true)
  @override
  _$$RequestFirstLoadingCopyWith<T, _$RequestFirstLoading<T>> get copyWith =>
      __$$RequestFirstLoadingCopyWithImpl<T, _$RequestFirstLoading<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool requestFirstLoading, dynamic args)
        initializing,
    required TResult Function(ReadyListState<T>? oldState) isEmpty,
    required TResult Function(
            ErrorDisplayCallBack display, ReadyListState<T>? oldState)
        error,
    required TResult Function(ICancelToken? cancelToken, int? pageSize)
        isLoadingFirst,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isLoadingNext,
    required TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)
        isRefreshing,
    required TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)
        isLoaded,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestNext,
    required TResult Function(int? pageSize, Iterable<T> items, int totalCount)
        requestRefresh,
    required TResult Function(int? pageSize, ReadyListState<T>? oldState)
        requestFirstLoading,
  }) {
    return requestFirstLoading(pageSize, oldState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
  }) {
    return requestFirstLoading?.call(pageSize, oldState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool requestFirstLoading, dynamic args)? initializing,
    TResult Function(ReadyListState<T>? oldState)? isEmpty,
    TResult Function(ErrorDisplayCallBack display, ReadyListState<T>? oldState)?
        error,
    TResult Function(ICancelToken? cancelToken, int? pageSize)? isLoadingFirst,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isLoadingNext,
    TResult Function(ICancelToken? cancelToken, int? pageSize,
            Iterable<T> items, int totalCount)?
        isRefreshing,
    TResult Function(
            Iterable<T> items, int totalCount, ReadyListState<T>? oldState)?
        isLoaded,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestNext,
    TResult Function(int? pageSize, Iterable<T> items, int totalCount)?
        requestRefresh,
    TResult Function(int? pageSize, ReadyListState<T>? oldState)?
        requestFirstLoading,
    required TResult orElse(),
  }) {
    if (requestFirstLoading != null) {
      return requestFirstLoading(pageSize, oldState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initializing<T> value) initializing,
    required TResult Function(Empty<T> value) isEmpty,
    required TResult Function(ErrorState<T> value) error,
    required TResult Function(FirstLoading<T> value) isLoadingFirst,
    required TResult Function(LoadingNext<T> value) isLoadingNext,
    required TResult Function(Refreshing<T> value) isRefreshing,
    required TResult Function(Loaded<T> value) isLoaded,
    required TResult Function(RequestNext<T> value) requestNext,
    required TResult Function(RequestRefresh<T> value) requestRefresh,
    required TResult Function(RequestFirstLoading<T> value) requestFirstLoading,
  }) {
    return requestFirstLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
  }) {
    return requestFirstLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initializing<T> value)? initializing,
    TResult Function(Empty<T> value)? isEmpty,
    TResult Function(ErrorState<T> value)? error,
    TResult Function(FirstLoading<T> value)? isLoadingFirst,
    TResult Function(LoadingNext<T> value)? isLoadingNext,
    TResult Function(Refreshing<T> value)? isRefreshing,
    TResult Function(Loaded<T> value)? isLoaded,
    TResult Function(RequestNext<T> value)? requestNext,
    TResult Function(RequestRefresh<T> value)? requestRefresh,
    TResult Function(RequestFirstLoading<T> value)? requestFirstLoading,
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
      final ReadyListState<T>? oldState}) = _$RequestFirstLoading<T>;

  int? get pageSize => throw _privateConstructorUsedError;
  ReadyListState<T>? get oldState => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$RequestFirstLoadingCopyWith<T, _$RequestFirstLoading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
