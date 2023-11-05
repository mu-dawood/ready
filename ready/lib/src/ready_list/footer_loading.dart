part of ready_list;

class _FooterLoading<T, S extends BaseReadyListState<T>,
    TController extends ReadyListController<T, S>> extends StatelessWidget {
  final bool shrinkWrap;
  final TController controller;

  final _ReadyListConfigOptionsDefaults config;

  const _FooterLoading({
    Key? key,
    required this.shrinkWrap,
    required this.controller,
    required this.config,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = controller.state;
    switch (state.stateType) {
      case StateType.loaded:
        if (state.items.length < state.totalCount) {
          return _buildWidget(
            TextButton(
              onPressed: () {
                controller.requestNextLoading(config.pageSize);
              },
              child: Text(config.loadMoreText),
            ),
          );
        } else if (config.showNoMoreText) {
          return _buildWidget(Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              config.noMoreText,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ));
        } else {
          return _buildNone();
        }
      case StateType.isLoadingNext:
        return const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: CupertinoActivityIndicator(),
        );
      default:
        return _buildNone();
    }
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
