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
part 'grids.dart';
part 'ready_screen_loader.dart';
part 'refresh_indicators.dart';

class ReadyList<T, TController extends ReadyListController<T>>
    extends StatefulWidget implements ReadyListConfigOptions {
  final ScrollController? scrollController;
  final ReadyListWidgetBuilder<T>? headerSlivers;
  final ReadyListWidgetBuilder<T>? footerSlivers;
  final ReadyListWidgetBuilder<T>? innerFooterSlivers;
  final ReadyListWidgetBuilder<T>? _slivers;
  final Iterable<T> Function(Iterable<T> items)? filterItems;
  final ReadyListItemBuilder<T>? _buildItem;
  final GridDelegateCallback? _gridDelegate;
  final TController controller;
  final bool keepAlive;
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
  final ShrinkWrapCallback? shrinkWrap;
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
    required ReadyListWidgetBuilder<T> slivers,
    required this.controller,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.allowRefresh,
    this.allowLoadNext,
    this.noMoreText,
    this.loadMoreText,
    this.reverse,
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
  _ReadyListState<T, TController> createState() =>
      _ReadyListState<T, TController>();
}

class _ReadyListState<T, TController extends ReadyListController<T>>
    extends State<ReadyList<T, TController>>
    with AutomaticKeepAliveClientMixin {
  final deltaExtent = 75.0;

  @override
  bool get wantKeepAlive => widget.keepAlive;

  ReadyListState<T> get state => widget.controller.state;

  @override
  void didChangeDependencies() {
    var _config = _ReadyListConfigOptionsDefaults.effective(widget, context);
    state.whenOrNull(
      needInitialLoading: () {
        if (widget.controller.isRemoteController) {
          widget.controller.remote!.loadInitialData(_config.pageSize);
        }
      },
    );
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant ReadyList<T, TController> oldWidget) {
    var _config = _ReadyListConfigOptionsDefaults.effective(widget, context);
    state.whenOrNull(
      needInitialLoading: () {
        if (widget.controller.isRemoteController) {
          widget.controller.remote!.loadInitialData(_config.pageSize);
        }
      },
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
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
        stream: widget.controller.stream,
        builder:
            (BuildContext context, AsyncSnapshot<ReadyListState<T>> snapshot) {
          var _config =
              _ReadyListConfigOptionsDefaults.effective(widget, context);

          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (_config.allowLoadNext) {
                state.whenOrNull(
                  loaded: (items, total) {
                    if (items.length < total) {
                      if (scrollInfo.metrics.pixels > 0) {
                        if (scrollInfo.metrics.pixels >=
                            scrollInfo.metrics.maxScrollExtent - 200) {
                          if (widget.controller
                              is! RemoteReadyListController<T>) {
                            (widget.controller as RemoteReadyListController<T>)
                                .nextData(_config.pageSize);
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
              gradient: _config.shimmerScopeGradient,
              child: _config.allowRefresh
                  ? _buildRefresh(_config, absorber)
                  : _buildCustomScrollView(_config, absorber),
            ),
          );
        },
      ),
    );
  }

  Future _onRefresh(_ReadyListConfigOptionsDefaults _config) async {
    if (widget.controller.isRemoteController) {
      if (state.mayWhen(
        orElse: () => true,
        loaded: (_, __) => false,
      )) {
        return;
      }
      var isVisible = Ready.isVisible(context);
      if (isVisible) {
        await (widget.controller.remote!).refreshData(_config.pageSize);
      }
    }
  }

  _buildRefresh(_ReadyListConfigOptionsDefaults _config,
      SliverOverlapAbsorberHandle? absorber) {
    double edgeOffset = absorber?.layoutExtent ?? 0;
    if (widget.controller.isRemoteController) {
      return RefreshIndicator(
        onRefresh: () => _onRefresh(_config),
        edgeOffset: edgeOffset,
        child: _buildCustomScrollView(_config, absorber),
      );
    } else {
      return _buildCustomScrollView(_config, absorber);
    }
  }

  Iterable<T> _filteredItems(Iterable<T> list) {
    return widget.filterItems?.call(list) ?? list;
  }

  Widget _buildCustomScrollView(_ReadyListConfigOptionsDefaults _config,
      SliverOverlapAbsorberHandle? absorber) {
    var shrinkWrap = _config.shrinkWrap?.call(state) ?? false;
    var showFooterLoading = _config.allowLoadNext;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return CustomScrollView(
          physics: _config.physics,
          scrollDirection: _config.axis,
          scrollBehavior: ScrollConfiguration.of(context)
              .copyWith(dragDevices: PointerDeviceKind.values.toSet()),
          shrinkWrap: shrinkWrap,
          reverse: _config.reverse,
          slivers: [
            if (absorber != null) SliverOverlapInjector(handle: absorber),
            if (widget.topLevelHeaderSlivers != null)
              ...widget.topLevelHeaderSlivers!,
            if (widget.headerSlivers != null) ...widget.headerSlivers!(state),
            if (widget._slivers != null)
              ...state.when(
                empty: () => [
                  _buildPlaceholders(shrinkWrap, _config, false, null),
                ],
                error: (error) =>
                    [_buildPlaceholders(shrinkWrap, _config, false, error)],
                initialLoading: (_) => widget._slivers!(state),
                refreshing: (items, total, _) => widget._slivers!(state),
                loadingNext: (items, total, _) => widget._slivers!(state),
                loaded: (items, total) => widget._slivers!(state),
                needInitialLoading: () => widget._slivers!(state),
              )
            else
              state.when(
                empty: () =>
                    _buildPlaceholders(shrinkWrap, _config, false, null),
                error: (message) =>
                    _buildPlaceholders(shrinkWrap, _config, false, message),
                initialLoading: (_) => !_config.allowFakeItems
                    ? _buildPlaceholders(shrinkWrap, _config, true, null)
                    : _buildBody(constraints, _config),
                refreshing: (items, _, __) =>
                    _buildBody(constraints, _config, _filteredItems(items)),
                loadingNext: (items, _, __) =>
                    _buildBody(constraints, _config, _filteredItems(items)),
                loaded: (items, _) =>
                    _buildBody(constraints, _config, _filteredItems(items)),
                needInitialLoading: () => !_config.allowFakeItems
                    ? _buildPlaceholders(shrinkWrap, _config, true, null)
                    : _buildBody(constraints, _config),
              ),
            if (widget.innerFooterSlivers != null)
              ...widget.innerFooterSlivers!(state),
            if (showFooterLoading && widget.controller.isRemoteController)
              _FooterLoading<T, TController>(
                shrinkWrap: shrinkWrap,
                config: _config,
                controller: widget.controller,
              ),
            if (widget.footerSlivers != null) ...widget.footerSlivers!(state),
            if (_config.topLevelFooterSlivers != null)
              ...(_config.topLevelFooterSlivers!),
            const SliverToBoxAdapter(child: SizedBox(height: 5))
          ],
        );
      },
    );
  }

  Widget _buildBody(
      BoxConstraints constraints, _ReadyListConfigOptionsDefaults _config,
      [Iterable<T>? items]) {
    if (widget._gridDelegate != null) {
      return SliverPadding(
        padding: _config.padding ?? EdgeInsets.zero,
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
              return _buildItem(items, _config, i);
            },
            childCount: items?.length,
          ),
        ),
      );
    } else if (widget._reorderOptions != null && items != null) {
      return SliverPadding(
        padding: _config.padding ?? EdgeInsets.zero,
        sliver: SliverReorderableList(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(items, _config, index);
          },
          onReorder: widget._reorderOptions!.onReorder,
          prototypeItem: widget._reorderOptions!.prototypeItem,
          proxyDecorator: widget._reorderOptions!.proxyDecorator,
        ),
      );
    } else {
      return SliverPadding(
        padding: _config.padding ?? EdgeInsets.zero,
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (ctx, i) {
              return _buildItem(items, _config, i);
            },
            childCount: items?.length,
          ),
        ),
      );
    }
  }

  Widget _buildPlaceholders(
    bool shrinkWrap,
    _ReadyListConfigOptionsDefaults _config,
    bool loading,
    String? error,
  ) {
    if (shrinkWrap == true) {
      return SliverToBoxAdapter(
        child: _buildRScreenLoading(_config, loading, error),
      );
    }
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: _buildRScreenLoading(_config, loading, error),
      ),
    );
  }

  _ReadyScreenLoader _buildRScreenLoading(
    _ReadyListConfigOptionsDefaults _config,
    bool loading,
    String? error,
  ) {
    var ctrl = widget.controller;
    return _ReadyScreenLoader(
      loading: loading,
      error: error,
      config: _config.placeholdersConfig,
      onReload: ctrl.isRemoteController
          ? () => ctrl.remote!.loadInitialData(_config.pageSize)
          : null,
    );
  }

  Widget _buildItem(
      Iterable<T>? items, _ReadyListConfigOptionsDefaults _config, int index) {
    if (items == null || index >= items.length) {
      if (_config.allowFakeItems) {
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
