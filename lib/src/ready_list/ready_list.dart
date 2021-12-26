library ready_list;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../animated_items/animated_item.dart';
import '../ready.dart';
import '../shimmers/shimmers.dart';

part 'config.dart';
part 'grids.dart';
part 'ready_list.freezed.dart';
part 'ready_list_controller.dart';
part 'ready_list_state.dart';
part 'ready_screen_loader.dart';
part 'refresh_indecators.dart';

typedef ReadyListWidgetBuilder<T> = List<Widget> Function(ReadyListState<T> state);

class ReadyList<T, TController extends ReadyListController<T>> extends StatefulWidget
    implements ReadyListConfigOptions {
  final ScrollController? scrollController;
  final ReadyListWidgetBuilder<T>? headerSlivers;
  final ReadyListWidgetBuilder<T>? innerHeaderSlivers;
  final ReadyListWidgetBuilder<T>? footerSlivers;
  final ReadyListWidgetBuilder<T>? innerFooterSlivers;
  final ReadyListWidgetBuilder<T>? _slivers;
  final Iterable<T> Function(Iterable<T> items)? filterItems;
  final Widget Function(T item, int index)? _buildItem;
  final SliverStaggeredGridDelegate Function(int? length)? _gridDelegate;
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
  final String? loadFailedText;
  @override
  final String? noMoreText;
  @override
  final String? loadMoreText;
  @override
  final EdgeInsetsGeometry? padding;
  @override
  final bool? reverse;
  @override
  final Widget Function(int index)? buildShimmer;
  @override
  final LinearGradient? shimmergradient;
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
    this.innerHeaderSlivers,
    this.footerSlivers,
    required ReadyListWidgetBuilder<T> slivers,
    required this.controller,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.allowRefresh,
    this.allowLoadNext,
    this.loadFailedText,
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
  })  : _slivers = slivers,
        _buildItem = null,
        filterItems = null,
        _reorderOptions = null,
        _gridDelegate = null,
        padding = null,
        buildShimmer = null,
        shimmergradient = null,
        super(key: key);

  const ReadyList.list({
    Key? key,
    this.scrollController,
    this.headerSlivers,
    this.innerFooterSlivers,
    this.innerHeaderSlivers,
    this.footerSlivers,
    required Widget Function(T item, int index) buildItem,
    ReorderOptions? reorderOptions,
    required this.controller,
    this.filterItems,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.allowRefresh,
    this.allowLoadNext,
    this.loadFailedText,
    this.noMoreText,
    this.loadMoreText,
    this.padding,
    this.reverse,
    this.keepAlive = true,
    this.buildShimmer,
    this.shimmergradient,
    this.shrinkWrap,
    this.pageSize,
    this.axis,
    this.physics,
    this.topLevelFooterSlivers,
    this.topLevelHeaderSlivers,
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
    this.innerHeaderSlivers,
    this.footerSlivers,
    required Widget Function(T item, int index) buildItem,
    SliverStaggeredGridDelegate Function(int? length)? gridDelegate = Grids.columns_2,
    required this.controller,
    this.filterItems,
    this.placeholdersConfig,
    this.showNoMoreText,
    this.allowRefresh,
    this.allowLoadNext,
    this.loadFailedText,
    this.noMoreText,
    this.loadMoreText,
    this.padding,
    this.pageSize,
    this.reverse,
    this.keepAlive = true,
    this.buildShimmer,
    this.shimmergradient,
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
  _ReadyListState<T, TController> createState() => _ReadyListState<T, TController>();
}

class _ReadyListState<T, TController extends ReadyListController<T>> extends State<ReadyList<T, TController>>
    with AutomaticKeepAliveClientMixin {
  final deltaExtent = 75.0;

  @override
  bool get wantKeepAlive => widget.keepAlive;

  ReadyListState<T> get state => widget.controller.state;

  @override
  void didChangeDependencies() {
    var _config = _ReadyListConfigOptionsDefauls.effective(widget, context);
    state.whenOrNull(
      needIntialLoading: () {
        widget.controller.loadIntial(_config.pageSize);
      },
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return AnimatedItemsScope(
      child: StreamBuilder(
        stream: widget.controller.stream,
        builder: (BuildContext context, AsyncSnapshot<ReadyListState<T>> snapshot) {
          var _config = _ReadyListConfigOptionsDefauls.effective(widget, context);
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (_config.allowLoadNext) {
                state.whenOrNull(
                  items: (items, total, intial) {
                    if (items.length < total) {
                      if (scrollInfo.metrics.pixels > 0) {
                        if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 200) {
                          widget.controller.nextData(_config.pageSize);
                        }
                      }
                    }
                  },
                );
              }
              return false;
            },
            child: Shimmer(
              gradient: _config.shimmergradient,
              child: _config.allowRefresh ? _buildRefresh(_config) : _buildCustomScrollView(_config),
            ),
          );
        },
      ),
    );
  }

  Future _onRefresh(_ReadyListConfigOptionsDefauls _config) async {
    if (state.maybeWhen(
      orElse: () => true,
      items: (_, __, ___) => false,
    )) {
      return;
    }
    var isVisible = Ready.isVisible(context);
    if (isVisible) {
      await widget.controller.refreshData(_config.pageSize);
    }
  }

  _buildRefresh(_ReadyListConfigOptionsDefauls _config) {
    late double edgeOffset;
    try {
      var absorber = NestedScrollView.sliverOverlapAbsorberHandleFor(context);
      edgeOffset = absorber.layoutExtent!;
    } catch (e) {
      edgeOffset = 0;
    }

    return RefreshIndicator(
      onRefresh: () => _onRefresh(_config),
      edgeOffset: edgeOffset,
      child: _buildCustomScrollView(_config),
    );
  }

  Iterable<T> _filteredItems(Iterable<T> list) {
    return widget.filterItems?.call(list) ?? list;
  }

  Widget _buildCustomScrollView(_ReadyListConfigOptionsDefauls _config) {
    var shrinkWrap = _config.shrinkWrap?.call(state) ?? false;
    var showFooterLoading = _config.allowLoadNext;
    return CustomScrollView(
      physics: _config.physics,
      scrollDirection: _config.axis,
      scrollBehavior: ScrollConfiguration.of(context).copyWith(dragDevices: PointerDeviceKind.values.toSet()),
      shrinkWrap: shrinkWrap,
      reverse: _config.reverse,
      slivers: [
        if (widget.topLevelHeaderSlivers != null) ...widget.topLevelHeaderSlivers!,
        if (widget.headerSlivers != null) ...widget.headerSlivers!(state),
        if (widget.innerHeaderSlivers != null) ...widget.innerHeaderSlivers!(state),
        if (widget._slivers != null)
          ...state.when(
            empty: () => [
              _buildPlaceholders(shrinkWrap, _config, false, null),
            ],
            error: (error) => [_buildPlaceholders(shrinkWrap, _config, false, error)],
            intialLoading: (_) => widget._slivers!(state),
            refreshing: (items, total, _) => widget._slivers!(state),
            loadingNext: (items, total, _) => widget._slivers!(state),
            items: (items, hasMore, oldState) => widget._slivers!(state),
            needIntialLoading: () => widget._slivers!(state),
          )
        else
          state.map(
            empty: (_) => _buildPlaceholders(shrinkWrap, _config, false, null),
            error: (state) => _buildPlaceholders(shrinkWrap, _config, false, state.message),
            intialLoading: (_) => _config.buildShimmer == null
                ? _buildPlaceholders(shrinkWrap, _config, true, null)
                : _buildBody(_config),
            refreshing: (state) => _buildBody(_config, _filteredItems(state.items)),
            loadingNext: (state) => _buildBody(_config, _filteredItems(state.items)),
            items: (state) => _buildBody(_config, _filteredItems(state.items)),
            needIntialLoading: (_) => _config.buildShimmer == null
                ? _buildPlaceholders(shrinkWrap, _config, true, null)
                : _buildBody(_config),
          ),
        if (widget.innerFooterSlivers != null) ...widget.innerFooterSlivers!(state),
        if (showFooterLoading)
          _FooterLoading<T>(
            shrinkWrap: shrinkWrap,
            config: _config,
            controller: widget.controller,
          ),
        if (widget.footerSlivers != null) ...widget.footerSlivers!(state),
        if (_config.topLevelFooterSlivers != null) ...(_config.topLevelFooterSlivers!),
        const SliverToBoxAdapter(child: SizedBox(height: 5))
      ],
    );
  }

  Widget _buildBody(_ReadyListConfigOptionsDefauls _config, [Iterable<T>? items]) {
    if (widget._gridDelegate != null) {
      return SliverPadding(
        padding: _config.padding ?? EdgeInsets.zero,
        sliver: SliverStaggeredGrid(
          gridDelegate: widget._gridDelegate!(items?.length),
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
    _ReadyListConfigOptionsDefauls _config,
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
    _ReadyListConfigOptionsDefauls _config,
    bool loading,
    String? error,
  ) {
    var ctrl = widget.controller;
    return _ReadyScreenLoader(
      loading: loading,
      error: error,
      config: _config.placeholdersConfig,
      onReload: () => ctrl.loadIntial(_config.pageSize),
    );
  }

  Widget _buildItem(Iterable<T>? items, _ReadyListConfigOptionsDefauls _config, int index) {
    Widget child;
    bool loading = false;
    if (items == null || index >= items.length) {
      if (_config.buildShimmer != null) {
        loading = true;
        child = _config.buildShimmer!(index);
      } else {
        child = const SizedBox.shrink();
      }
    } else if (widget._buildItem == null) {
      child = Card(
        child: Text('Item num: $index'),
      );
    } else {
      child = widget._buildItem!(items.elementAt(index), index);
    }
    return AnimatedItemConfig(
      index: index,
      child: ShimmerLoading(
        isLoading: loading,
        child: child,
      ),
    );
  }
}
