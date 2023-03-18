library ready_list;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../animated_items/animated_item.dart';
import '../controllers/controllers.dart';
import '../enums.dart';
import '../ready.dart';
import '../shimmers/shimmers.dart';
import '../utils.dart';

part 'config.dart';
part 'footer_loading.dart';
part 'grids.dart';
part 'ready_screen_loader.dart';

class ReadyList<T, Args, TController extends ReadyListController<T, Args>>
    extends StatefulWidget implements ReadyListConfigOptions {
  final ScrollController? scrollController;
  final ReadyListWidgetBuilder<T, Args>? headerSlivers;
  final ReadyListWidgetBuilder<T, Args>? footerSlivers;
  final ReadyListWidgetBuilder<T, Args>? innerFooterSlivers;
  final ReadyListSliverBuilder<T, Args>? _slivers;
  final Iterable<T> Function(Iterable<T> items)? filterItems;
  final ReadyListItemBuilder<T>? _buildItem;
  final GridDelegateCallback? _gridDelegate;
  final TController controller;
  final bool keepAlive;
  @override
  final StateResultCallBack<bool>? handleNestedScrollViewOverlap;
  @override
  final PlaceholdersConfig? placeholdersConfig;
  @override
  final bool? showNoMoreText;
  @override
  final bool? allowRefresh;
  @override
  final bool? allowLoadNext;
  @override
  final String? noMoreText;
  @override
  final String? loadMoreText;
  @override
  final EdgeInsetsGeometry? padding;
  @override
  final bool? reverse;
  @override
  final bool? allowFakeItems;
  @override
  final GradientGetterCallback? shimmerScopeGradient;
  @override
  final StateResultCallBack<bool>? shrinkWrap;
  @override
  final AxisConfig? axis;
  @override
  final ScrollPhysics? physics;
  @override
  final List<Widget>? topLevelFooterSlivers;
  @override
  final List<Widget>? topLevelHeaderSlivers;
  @override
  final int? pageSize;
  final ReorderOptions? _reorderOptions;

  const ReadyList.slivers({
    Key? key,
    this.scrollController,
    this.headerSlivers,
    this.innerFooterSlivers,
    this.footerSlivers,
    required ReadyListSliverBuilder<T, Args> slivers,
    required this.controller,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.allowRefresh,
    this.allowLoadNext,
    this.noMoreText,
    this.loadMoreText,
    this.reverse,
    this.handleNestedScrollViewOverlap,
    this.keepAlive = true,
    this.shrinkWrap,
    this.pageSize,
    this.axis,
    this.physics,
    this.topLevelFooterSlivers,
    this.topLevelHeaderSlivers,
    this.shimmerScopeGradient,
  })  : _slivers = slivers,
        _buildItem = null,
        filterItems = null,
        _reorderOptions = null,
        _gridDelegate = null,
        allowFakeItems = false,
        padding = null,
        super(key: key);

  const ReadyList.list({
    Key? key,
    this.scrollController,
    this.headerSlivers,
    this.innerFooterSlivers,
    this.footerSlivers,
    required ReadyListItemBuilder<T> buildItem,
    ReorderOptions? reorderOptions,
    required this.controller,
    this.filterItems,
    this.handleNestedScrollViewOverlap,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.allowRefresh,
    this.allowLoadNext,
    this.noMoreText,
    this.loadMoreText,
    this.padding,
    this.reverse,
    this.keepAlive = true,
    this.shimmerScopeGradient,
    this.shrinkWrap,
    this.pageSize,
    this.axis,
    this.physics,
    this.topLevelFooterSlivers,
    this.topLevelHeaderSlivers,
    this.allowFakeItems,
  })  : _slivers = null,
        _buildItem = buildItem,
        _reorderOptions = reorderOptions,
        _gridDelegate = null,
        super(key: key);

  /// [SliverStaggeredGridDelegateWithFixedCrossAxisCount]
  /// [SliverStaggeredGridDelegateWithMaxCrossAxisExtent]
  /// You can use [Grids.columns_1] [Grids.columns_2] etc...
  const ReadyList.grid({
    Key? key,
    this.scrollController,
    this.headerSlivers,
    this.handleNestedScrollViewOverlap,
    this.innerFooterSlivers,
    this.footerSlivers,
    required ReadyListItemBuilder<T> buildItem,
    GridDelegateCallback gridDelegate = Grids.columns_2,
    required this.controller,
    this.filterItems,
    this.allowFakeItems,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.allowRefresh,
    this.allowLoadNext,
    this.noMoreText,
    this.loadMoreText,
    this.padding,
    this.pageSize,
    this.reverse,
    this.keepAlive = true,
    this.shimmerScopeGradient,
    this.shrinkWrap,
    this.axis,
    this.physics,
    this.topLevelFooterSlivers,
    this.topLevelHeaderSlivers,
  })  : _slivers = null,
        _buildItem = buildItem,
        _reorderOptions = null,
        _gridDelegate = gridDelegate,
        super(key: key);

  @override
  State<ReadyList<T, Args, TController>> createState() =>
      _ReadyListState<T, Args, TController>();
}

class _ReadyListState<T, Args, TController extends ReadyListController<T, Args>>
    extends State<ReadyList<T, Args, TController>>
    with AutomaticKeepAliveClientMixin {
  final deltaExtent = 75.0;
  StreamSubscription? _subscription;
  @override
  bool get wantKeepAlive => widget.keepAlive;

  ReadyListState<T, Args> get state => widget.controller.state;

  @override
  void didChangeDependencies() {
    state.whenOrNull(
      initializing: (value, args) {
        if (!value) return;
        var configuration =
            _ReadyListConfigOptionsDefaults.effective(widget, context);
        widget.controller.emit(ReadyListState.requestFirstLoading(
            pageSize: configuration.pageSize, args: args));
      },
    );
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ReadyList<T, Args, TController> oldWidget) {
    state.whenOrNull(
      initializing: (value, _) {
        if (!value) return;
        var configuration =
            _ReadyListConfigOptionsDefaults.effective(widget, context);

        widget.controller.requestFirstLoading(configuration.pageSize);
      },
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    SliverOverlapAbsorberHandle? absorber;
    try {
      absorber = NestedScrollView.sliverOverlapAbsorberHandleFor(context);
    } catch (e) {
      absorber = null;
    }
    if (absorber?.layoutExtent == null) {
      absorber = null;
    }

    return AnimatedItemsScope(
      child: StreamBuilder(
        stream: widget.controller.stream,
        initialData: widget.controller.state,
        builder: (BuildContext context,
            AsyncSnapshot<ReadyListState<T, Args>> snapshot) {
          var configuration =
              _ReadyListConfigOptionsDefaults.effective(widget, context);

          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (configuration.allowLoadNext) {
                state.mapOrNull(
                  isLoaded: (state) {
                    if (state.items.length < state.totalCount) {
                      if (scrollInfo.metrics.pixels > 0) {
                        if (scrollInfo.metrics.pixels >=
                            scrollInfo.metrics.maxScrollExtent - 200) {
                          if (configuration.allowLoadNext) {
                            widget.controller
                                .requestNext(configuration.pageSize);
                          }
                        }
                      }
                    }
                  },
                );
              }
              return false;
            },
            child: ShimmerScope(
              gradient: configuration.shimmerScopeGradient,
              child: configuration.allowRefresh
                  ? _buildRefresh(configuration, absorber)
                  : _buildCustomScrollView(configuration, absorber),
            ),
          );
        },
      ),
    );
  }

  Future _onRefresh(_ReadyListConfigOptionsDefaults configuration) {
    return state.maybeMap<Future>(
      orElse: () => Future.value(),
      isLoaded: (state) {
        var isVisible = Ready.isVisible(context);
        if (isVisible) {
          widget.controller.requestRefresh(configuration.pageSize);
          return widget.controller.stream.first;
        }
        return Future.value();
      },
    );
  }

  _buildRefresh(_ReadyListConfigOptionsDefaults configuration,
      SliverOverlapAbsorberHandle? absorber) {
    double edgeOffset = absorber?.layoutExtent ?? 0;
    return RefreshIndicator(
      onRefresh: () => _onRefresh(configuration),
      edgeOffset: edgeOffset,
      child: _buildCustomScrollView(configuration, absorber),
    );
  }

  Iterable<T> _filteredItems(Iterable<T> list) {
    return widget.filterItems?.call(list) ?? list;
  }

  Widget _buildCustomScrollView(_ReadyListConfigOptionsDefaults configuration,
      SliverOverlapAbsorberHandle? absorber) {
    var shrinkWrap = configuration.shrinkWrap?.call(state) ?? false;
    var showFooterLoading = configuration.allowLoadNext;

    return ConstrainedBox(
      constraints: configuration.axis.constraints(state),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return CustomScrollView(
            physics: configuration.physics,
            scrollDirection: configuration.axis.axis,
            scrollBehavior: ScrollConfiguration.of(context)
                .copyWith(dragDevices: PointerDeviceKind.values.toSet()),
            shrinkWrap: shrinkWrap,
            reverse: configuration.reverse,
            slivers: [
              if (absorber != null &&
                  configuration.handleNestedScrollViewOverlap(state))
                SliverOverlapInjector(handle: absorber),
              if (widget.topLevelHeaderSlivers != null)
                ...widget.topLevelHeaderSlivers!,
              if (widget.headerSlivers != null) ...widget.headerSlivers!(state),
              if (widget._slivers != null)
                ...state.maybeMap(
                  error: (state) => widget._slivers!(
                    state,
                    () => _buildPlaceholders(shrinkWrap, configuration, false,
                        state.display(context)),
                  ),
                  isLoadingFirst: (_) => widget._slivers!(
                    state,
                    () => !configuration.allowFakeItems
                        ? _buildPlaceholders(
                            shrinkWrap, configuration, true, null)
                        : null,
                  ),
                  requestFirstLoading: (_) => widget._slivers!(
                    state,
                    () => !configuration.allowFakeItems
                        ? _buildPlaceholders(
                            shrinkWrap, configuration, true, null)
                        : null,
                  ),
                  initializing: (_) => widget._slivers!(
                    state,
                    () => !configuration.allowFakeItems
                        ? _buildPlaceholders(
                            shrinkWrap, configuration, true, null)
                        : null,
                  ),
                  orElse: () => widget._slivers!(state, () => null),
                  isLoaded: (value) {
                    if (value.items.isEmpty) {
                      return widget._slivers!(
                          state,
                          () => _buildPlaceholders(
                              shrinkWrap, configuration, false, null));
                    }
                    return widget._slivers!(state, () => null);
                  },
                )
              else
                state.maybeMap(
                  orElse: () => !configuration.allowFakeItems
                      ? _buildPlaceholders(
                          shrinkWrap, configuration, true, null)
                      : _buildBody(constraints, configuration),
                  error: (state) => _buildPlaceholders(
                      shrinkWrap, configuration, false, state.display(context)),
                  isRefreshing: (state) => _buildBody(constraints,
                      configuration, _filteredItems(state.currentData.items)),
                  requestRefresh: (state) => _buildBody(constraints,
                      configuration, _filteredItems(state.currentData.items)),
                  isLoadingNext: (state) => _buildBody(constraints,
                      configuration, _filteredItems(state.currentData.items)),
                  requestNext: (state) => _buildBody(constraints, configuration,
                      _filteredItems(state.currentData.items)),
                  isLoaded: (state) {
                    if (state.items.isEmpty) {
                      return _buildPlaceholders(
                          shrinkWrap, configuration, false, null);
                    }
                    return _buildBody(constraints, configuration,
                        _filteredItems(state.items));
                  },
                ),
              if (widget.innerFooterSlivers != null)
                ...widget.innerFooterSlivers!(state),
              if (showFooterLoading)
                _FooterLoading<T, Args, TController>(
                  shrinkWrap: shrinkWrap,
                  config: configuration,
                  controller: widget.controller,
                ),
              if (widget.footerSlivers != null) ...widget.footerSlivers!(state),
              if (configuration.topLevelFooterSlivers != null)
                ...(configuration.topLevelFooterSlivers!),
              const SliverToBoxAdapter(child: SizedBox(height: 5))
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(
      BoxConstraints constraints, _ReadyListConfigOptionsDefaults configuration,
      [Iterable<T>? items]) {
    if (widget._gridDelegate != null) {
      return SliverPadding(
        padding: configuration.padding ?? EdgeInsets.zero,
        sliver: SliverMasonryGrid(
          // spell-checker: enable
          gridDelegate: widget._gridDelegate!(
            width: constraints.maxWidth,
            length: items?.length,
          ),
          delegate: SliverChildBuilderDelegate(
            (ctx, i) {
              return _buildItem(items, configuration, i);
            },
            childCount: items?.length,
          ),
        ),
      );
    } else if (widget._reorderOptions != null) {
      return SliverPadding(
        padding: configuration.padding ?? EdgeInsets.zero,
        sliver: SliverReorderableList(
          itemCount: items?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(items, configuration, index);
          },
          onReorder: widget._reorderOptions!.onReorder,
          prototypeItem: widget._reorderOptions!.prototypeItem,
          proxyDecorator: widget._reorderOptions!.proxyDecorator,
        ),
      );
    } else {
      return SliverPadding(
        padding: configuration.padding ?? EdgeInsets.zero,
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, i) {
              return _buildItem(items, configuration, i);
            },
            childCount: items?.length,
          ),
        ),
      );
    }
  }

  Widget _buildPlaceholders(
    bool shrinkWrap,
    _ReadyListConfigOptionsDefaults configuration,
    bool loading,
    String? error,
  ) {
    if (shrinkWrap == true) {
      return SliverToBoxAdapter(
        child: _buildRScreenLoading(configuration, loading, error),
      );
    }
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: _buildRScreenLoading(configuration, loading, error),
      ),
    );
  }

  ReadyScreenLoader _buildRScreenLoading(
    _ReadyListConfigOptionsDefaults configuration,
    bool loading,
    String? error,
  ) {
    var ctrl = widget.controller;
    return ReadyScreenLoader(
      loading: loading,
      error: error,
      config: configuration.placeholdersConfig,
      onReload: ctrl.state.mapOrNull(
        error: (_) {
          return () =>
              widget.controller.requestFirstLoading(configuration.pageSize);
        },
        isLoaded: (state) {
          if (state.items.isEmpty) {
            return () =>
                widget.controller.requestFirstLoading(configuration.pageSize);
          } else {
            return () => ctrl.requestRefresh(configuration.pageSize);
          }
        },
      ),
    );
  }

  Widget _buildItem(Iterable<T>? items,
      _ReadyListConfigOptionsDefaults configuration, int index) {
    if (items == null || index >= items.length) {
      if (configuration.allowFakeItems) {
        return widget._buildItem!(null, index);
      } else {
        return const SizedBox.shrink();
      }
    } else if (widget._buildItem == null) {
      return Card(
        child: Text('Item num: $index'),
      );
    } else {
      return widget._buildItem!(items.elementAt(index), index);
    }
  }
}
