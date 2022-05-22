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

class ReadyList<T, TController extends ReadyListController<T>>
    extends StatefulWidget implements ReadyListConfigOptions {
  final ScrollController? scrollController;
  final ReadyListWidgetBuilder<T>? headerSlivers;
  final ReadyListWidgetBuilder<T>? footerSlivers;
  final ReadyListWidgetBuilder<T>? innerFooterSlivers;
  final ReadyListSliverBuilder<T>? _slivers;
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
  final Axis? axis;
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
    required ReadyListSliverBuilder<T> slivers,
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
  State<ReadyList<T, TController>> createState() =>
      _ReadyListState<T, TController>();
}

class _ReadyListState<T, TController extends ReadyListController<T>>
    extends State<ReadyList<T, TController>>
    with AutomaticKeepAliveClientMixin {
  final deltaExtent = 75.0;
  StreamSubscription? _subscription;
  @override
  bool get wantKeepAlive => widget.keepAlive;

  ReadyListState<T> get state => widget.controller.state;
  Stream<ReadyListState<T>> get stream => widget.controller.stream;

  void _checkState(ReadyListState<T> state) {
    var configuration =
        _ReadyListConfigOptionsDefaults.effective(widget, context);
    state.whenOrNull(
      needFirstLoading: (_) {
        if (widget.controller.hasHandler) {
          widget.controller.handler!.firstLoad(configuration.pageSize);
        }
      },
    );
  }

  @override
  void initState() {
    _subscription = stream.listen(_checkState);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _checkState(state);
    super.didChangeDependencies();
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

    return AnimatedItemsScope(
      child: StreamBuilder(
        stream: stream,
        builder:
            (BuildContext context, AsyncSnapshot<ReadyListState<T>> snapshot) {
          var configuration =
              _ReadyListConfigOptionsDefaults.effective(widget, context);

          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (configuration.allowLoadNext) {
                state.whenOrNull(
                  loaded: (items, total) {
                    if (items.length < total) {
                      if (scrollInfo.metrics.pixels > 0) {
                        if (scrollInfo.metrics.pixels >=
                            scrollInfo.metrics.maxScrollExtent - 200) {
                          if (widget.controller.hasHandler) {
                            widget.controller.handler!
                                .nextData(configuration.pageSize);
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

  Future _onRefresh(_ReadyListConfigOptionsDefaults configuration) async {
    if (widget.controller.hasHandler) {
      if (state.mayWhen(
        orElse: () => true,
        loaded: (_, __) => false,
      )) {
        return;
      }
      var isVisible = Ready.isVisible(context);
      if (isVisible) {
        await (widget.controller.handler!).refreshData(configuration.pageSize);
      }
    }
  }

  _buildRefresh(_ReadyListConfigOptionsDefaults configuration,
      SliverOverlapAbsorberHandle? absorber) {
    double edgeOffset = absorber?.layoutExtent ?? 0;
    if (widget.controller.hasHandler) {
      return RefreshIndicator(
        onRefresh: () => _onRefresh(configuration),
        edgeOffset: edgeOffset,
        child: _buildCustomScrollView(configuration, absorber),
      );
    } else {
      return _buildCustomScrollView(configuration, absorber);
    }
  }

  Iterable<T> _filteredItems(Iterable<T> list) {
    return widget.filterItems?.call(list) ?? list;
  }

  Widget _buildCustomScrollView(_ReadyListConfigOptionsDefaults configuration,
      SliverOverlapAbsorberHandle? absorber) {
    var shrinkWrap = configuration.shrinkWrap?.call(state) ?? false;
    var showFooterLoading = configuration.allowLoadNext;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return CustomScrollView(
          physics: configuration.physics,
          scrollDirection: configuration.axis,
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
              ...state.when(
                empty: () => widget._slivers!(
                    state,
                    () => _buildPlaceholders(
                        shrinkWrap, configuration, false, null)),
                error: (display) => widget._slivers!(
                    state,
                    () => _buildPlaceholders(shrinkWrap, configuration, false,
                        display.call(context))),
                firstLoading: (_) => widget._slivers!(
                  state,
                  () => !configuration.allowFakeItems
                      ? _buildPlaceholders(
                          shrinkWrap, configuration, true, null)
                      : null,
                ),
                needFirstLoading: (_) => widget._slivers!(
                  state,
                  () => !configuration.allowFakeItems
                      ? _buildPlaceholders(
                          shrinkWrap, configuration, true, null)
                      : null,
                ),
                initializing: () => widget._slivers!(
                  state,
                  () => !configuration.allowFakeItems
                      ? _buildPlaceholders(
                          shrinkWrap, configuration, true, null)
                      : null,
                ),
                refreshing: (items, total, _) =>
                    widget._slivers!(state, () => null),
                loadingNext: (items, total, _) =>
                    widget._slivers!(state, () => null),
                loaded: (items, total) => widget._slivers!(state, () => null),
              )
            else
              state.when(
                empty: () =>
                    _buildPlaceholders(shrinkWrap, configuration, false, null),
                error: (display) => _buildPlaceholders(
                    shrinkWrap, configuration, false, display.call(context)),
                firstLoading: (_) => !configuration.allowFakeItems
                    ? _buildPlaceholders(shrinkWrap, configuration, true, null)
                    : _buildBody(constraints, configuration),
                refreshing: (items, _, __) => _buildBody(
                    constraints, configuration, _filteredItems(items)),
                loadingNext: (items, _, __) => _buildBody(
                    constraints, configuration, _filteredItems(items)),
                loaded: (items, _) => _buildBody(
                    constraints, configuration, _filteredItems(items)),
                needFirstLoading: (_) => !configuration.allowFakeItems
                    ? _buildPlaceholders(shrinkWrap, configuration, true, null)
                    : _buildBody(constraints, configuration),
                initializing: () => !configuration.allowFakeItems
                    ? _buildPlaceholders(shrinkWrap, configuration, true, null)
                    : _buildBody(constraints, configuration),
              ),
            if (widget.innerFooterSlivers != null)
              ...widget.innerFooterSlivers!(state),
            if (showFooterLoading && widget.controller.hasHandler)
              _FooterLoading<T, TController>(
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
    );
  }

  Widget _buildBody(
      BoxConstraints constraints, _ReadyListConfigOptionsDefaults configuration,
      [Iterable<T>? items]) {
    if (widget._gridDelegate != null) {
      return SliverPadding(
        padding: configuration.padding ?? EdgeInsets.zero,
        sliver: SliverStaggeredGrid(
          // spell-checker: disable
          addAutomaticKeepAlives: false,
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
      onReload: ctrl.hasHandler
          ? () => ctrl.handler!.firstLoad(configuration.pageSize)
          : null,
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
