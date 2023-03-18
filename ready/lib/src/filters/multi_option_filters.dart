part of 'filters.dart';

class MultiOptionFilter<T> extends StatelessWidget
    with DecoratedDataTableFilter<Set<T>> {
  @override
  final Set<T> value;
  final String display;
  final bool allowClear;
  @override
  final InputDecoration decoration;
  final Iterable<OptionFilterItem<T>> items;
  @override
  final ValueChanged<Set<T>> onChange;
  const MultiOptionFilter({
    Key? key,
    required this.onChange,
    required this.items,
    this.value = const {},
    required this.display,
    this.allowClear = true,
    this.decoration =
        const _DefaultInputDecoration(Icon(Icons.arrow_drop_down_rounded)),
  }) : super(key: key);

  Set<OptionFilterItem<T>> getSelectedItems() {
    return items.where((a) => value.any((b) => a.value == b)).toSet();
  }

  @override
  String hintText(ReadyListLocalizations tr) {
    return display;
  }

  @override
  Widget build(BuildContext context) {
    var selected = getSelectedItems();

    final effectiveDecoration = _effectiveDecoration(context);
    return buildTab(
        context,
        IntrinsicWidth(
          child: InputDecorator(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            decoration: effectiveDecoration,
            isEmpty: selected.isEmpty,
            child: Text(
              selected.map((e) => e.display).join(','),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ));
  }

  Widget buildTab(BuildContext context, Widget child) {
    return InkWell(
      onTap: () {
        showMenuItems(context).then((value) {
          if (value != null) onChange(value);
        });
      },
      child: child,
    );
  }

  Future<Set<T>?> showMenuItems(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _MultiOptionDialog<T>(
          allowClear: allowClear,
          items: items,
          selected: value,
          display: display,
        );
      },
    );
  }
}

class _MultiOptionDialog<T> extends StatefulWidget {
  final bool allowClear;
  final Iterable<OptionFilterItem<T>> items;
  final Set<T> selected;
  final String display;
  const _MultiOptionDialog({
    Key? key,
    required this.allowClear,
    required this.items,
    required this.selected,
    required this.display,
  }) : super(key: key);

  @override
  State<_MultiOptionDialog<T>> createState() => __MultiOptionDialogState<T>();
}

class __MultiOptionDialogState<T> extends State<_MultiOptionDialog<T>> {
  final Set<T> selected = {};
  @override
  void initState() {
    selected.addAll(widget.selected);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.display),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items.map((e) {
            return CheckboxListTile(
              value: selected.any((element) => element == e.value),
              contentPadding: EdgeInsets.zero,
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    selected.add(e.value);
                  } else {
                    selected.remove(e.value);
                  }
                });
              },
              title: Text(e.display),
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).maybePop(),
          style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        if (widget.allowClear && selected.isNotEmpty)
          TextButton(
            onPressed: () {
              setState(() {
                selected.clear();
              });
            },
            child: Text(ReadyListLocalizations.of(context)?.clear ?? 'Clear'),
          ),
        TextButton(
          onPressed: () => Navigator.of(context).maybePop(selected),
          child: Text(MaterialLocalizations.of(context).okButtonLabel),
        ),
      ],
    );
  }
}
