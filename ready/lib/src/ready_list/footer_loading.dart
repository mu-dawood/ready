part of ready_list;

class _FooterLoading<T, TController extends ReadyListController<T>>
    extends StatelessWidget {
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
    return state.maybeMap(
      orElse: () => _buildNone(),
      isLoaded: (state) {
        if (state.items.length < state.totalCount) {
          return _buildWidget(
            TextButton(
              onPressed: () {
                controller.emit(
                  ReadyListState.requestNext(
                    pageSize: config.pageSize,
                    args: state.args,
                    currentData: CurrentData(
                      items: state.items,
                      totalCount: state.totalCount,
                      args: state.args,
                    ),
                  ),
                );
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
      },
      isLoadingNext: (state) => _buildWidget(
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: CupertinoActivityIndicator(),
        ),
      ),
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
