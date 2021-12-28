part of ready_list;

class _FooterLoading<T, TController extends ReadyListController<T>>
    extends StatelessWidget {
  final bool shrinkWrap;
  final TController controller;

  final _ReadyListConfigOptionsDefauls config;

  const _FooterLoading({
    Key? key,
    required this.shrinkWrap,
    required this.controller,
    required this.config,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _state = controller.state;
    return _state.when(
      empty: () => _buildNone(),
      error: (error) => _buildNone(),
      intialLoading: (_) => _buildNone(),
      loaded: (items, total) {
        if (items.length < total) {
          return _buildWidget(
            TextButton(
              onPressed: () {
                controller.nextData(config.pageSize);
              },
              child: Text(config.loadMoreText),
            ),
          );
        } else if (config.showNoMoreText) {
          return _buildWidget(Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              config.noMoreText,
              style: Theme.of(context).textTheme.caption,
            ),
          ));
        } else {
          return _buildNone();
        }
      },
      loadingNext: (items, _, __) => _buildWidget(const Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: CupertinoActivityIndicator(),
      )),
      refreshing: (items, _, __) => _buildNone(),
      needIntialLoading: () => _buildNone(),
    );
  }

  Widget _buildNone() => const SliverToBoxAdapter();
  Widget _buildWidget(Widget child) {
    if (shrinkWrap) {
      return SliverToBoxAdapter(
        child: SafeArea(
          top: false,
          child: Center(
            child: child,
          ),
        ),
      );
    } else {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: SafeArea(
          top: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: child,
          ),
        ),
      );
    }
  }
}
