part of responsive_data_table;

class SearchFilter extends StatefulWidget implements _DataTableFilter<String?> {
  @override
  final String? value;
  final InputDecoration decoration;
  @override
  final ValueChanged<String?> onChange;
  const SearchFilter({
    Key? key,
    this.value,
    this.decoration = const InputDecoration(
        hintText: 'بحث ...',
        prefixIcon: Icon(Icons.search),
        prefixIconConstraints: BoxConstraints(maxWidth: 50, minWidth: 30)),
    required this.onChange,
  }) : super(key: key);
  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> with TickerProviderStateMixin {
  late TextEditingController controller;
  late FocusNode node;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value);
    node = FocusNode()
      ..addListener(() {
        if (mounted) setState(() {});
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (controller.text != widget.value) controller.text = widget.value ?? '';
  }

  void search(String v) {
    timer?.cancel();
    timer = Timer(const Duration(milliseconds: 1000), () {
      widget.onChange(v);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    node.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveDecoration = widget.decoration.applyDefaults(Theme.of(context).inputDecorationTheme);
    return AnimatedSize(
      alignment: AlignmentDirectional.centerStart,
      duration: const Duration(milliseconds: 300),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 150, maxWidth: node.hasFocus ? 300 : 150),
        child: TextField(
          focusNode: node,
          decoration: effectiveDecoration,
          controller: controller,
          onChanged: search,
        ),
      ),
    );
  }
}
