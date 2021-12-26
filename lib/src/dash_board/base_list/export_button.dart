part of responsive_data_table;

class _ExportButton<T, TController extends ReadyListController<T>> extends StatelessWidget {
  final VoidCallback export;
  final TController controller;
  const _ExportButton({
    Key? key,
    required this.export,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.assignment),
      color: controller.state.maybeWhen(
        orElse: () => Theme.of(context).disabledColor,
        items: (_, __, ___) => null,
      ),
      onPressed: controller.state.whenOrNull(
        items: (_, __, ___) => export,
      ),
    );
  }
}
