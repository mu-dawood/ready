part of 'filters.dart';

class _DefaultInputDecoration extends InputDecoration {
  const _DefaultInputDecoration([Widget? suffixIcon])
      : super(

        // suffixIcon: suffixIcon,
        // border: InputBorder.none,
        // contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        // prefixIconConstraints: const BoxConstraints(maxWidth: 50, minWidth: 30),
        );
}

/// search filter
class SearchFilter extends StatefulWidget
    with DecoratedDataTableFilter<String?> {
  @override
  final String? value;
  @override
  final InputDecoration decoration;
  @override
  final ValueChanged<String?> onChange;
  const SearchFilter({
    Key? key,
    this.value,
    this.decoration = const _DefaultInputDecoration(Icon(Icons.search)),
    required this.onChange,
  }) : super(key: key);
  @override
  State<SearchFilter> createState() => _SearchFilterState();

  @override
  String hintText(ReadyListLocalizations tr) {
    return tr.search;
  }
}

class _SearchFilterState extends State<SearchFilter>
    with TickerProviderStateMixin {
  late TextEditingController controller;
  late FocusNode node;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '');
    node = FocusNode()
      ..addListener(() {
        if (mounted) setState(() {});
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var val = widget.value ?? '';
    if (controller.text != val) controller.text = val;
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
    final effectiveDecoration = widget._effectiveDecoration(context);
    return AnimatedSize(
      alignment: AlignmentDirectional.centerStart,
      duration: const Duration(milliseconds: 300),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: 150, maxWidth: node.hasFocus ? 300 : 150),
        child: TextField(
          focusNode: node,
          decoration: effectiveDecoration,
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.start,
          onChanged: search,
        ),
      ),
    );
  }
}
