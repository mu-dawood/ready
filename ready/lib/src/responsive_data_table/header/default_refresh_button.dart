part of responsive_data_table;

class _DefaultRefreshButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onRefresh;
  final bool refreshing;
  const _DefaultRefreshButton({
    Key? key,
    required this.enabled,
    required this.onRefresh,
    required this.refreshing,
  }) : super(key: key);

  static Widget get({
    required bool enabled,
    required VoidCallback onRefresh,
    required bool refreshing,
  }) {
    return Builder(builder: (context) {
      return _DefaultRefreshButton(
        enabled: enabled,
        onRefresh: onRefresh,
        refreshing: refreshing,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: enabled ? onRefresh : null,
      icon: refreshing
          ? Builder(builder: (context) {
              return SizedBox(
                width: IconTheme.of(context).size,
                height: IconTheme.of(context).size,
                child: const CircularProgressIndicator.adaptive(),
              );
            })
          : const Icon(Icons.refresh),
    );
  }
}
