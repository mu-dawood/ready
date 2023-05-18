part of 'filters.dart';

/// single option filter
class OptionFilterItem<T> {
  final String display;
  final T value;
  OptionFilterItem({
    required this.display,
    required this.value,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OptionFilterItem<T> &&
        other.display == display &&
        other.value == value;
  }

  @override
  int get hashCode => display.hashCode ^ value.hashCode;
}

class SingleOptionFilter<T> extends StatelessWidget
    with DecoratedDataTableFilter<T?> {
  @override
  final T? value;
  final String display;
  final bool allowClear;
  @override
  final InputDecoration decoration;
  final Iterable<OptionFilterItem<T>> items;
  @override
  final ValueChanged<T?> onChange;
  const SingleOptionFilter({
    Key? key,
    required this.onChange,
    required this.items,
    this.value,
    required this.display,
    this.allowClear = true,
    this.decoration =
        const _DefaultInputDecoration(Icon(Icons.keyboard_arrow_down_rounded)),
  }) : super(key: key);

  OptionFilterItem<T>? getSelectedItem(BuildContext context) {
    for (var element in items) {
      if (value == element.value) return element;
    }
    return null;
  }

  @override
  String hintText(ReadyListLocalizations tr) {
    return display;
  }

  @override
  Widget build(BuildContext context) {
    var selected = getSelectedItem(context);

    final effectiveDecoration = _effectiveDecoration(context);
    return buildTab(
        context,
        IntrinsicWidth(
          child: InputDecorator(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            decoration: effectiveDecoration,
            isEmpty: selected == null,
            child: Text(selected?.display ?? ''),
          ),
        ));
  }

  Widget buildTab(BuildContext context, Widget child) {
    return InkWell(
      onTap: () {
        showMenuItems(context).then((value) {
          if (!value.isCancel) onChange(value.value);
        });
      },
      child: child,
    );
  }

  Future<SingleOptionDialogResult<T>> showMenuItems(
      BuildContext context) async {
    var result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return _SingleOptionDialog<T>(
          allowClear: allowClear,
          items: items,
          selected: value,
          display: display,
        );
      },
    );
    if (result == 'cancel') {
      return SingleOptionDialogResult<T>._(null, true);
    } else {
      return SingleOptionDialogResult<T>._(result, false);
    }
  }
}

class SingleOptionDialogResult<T> {
  final T? value;
  final bool isCancel;

  SingleOptionDialogResult._(this.value, this.isCancel);
}

class _SingleOptionDialog<T> extends StatefulWidget {
  final bool allowClear;
  final Iterable<OptionFilterItem<T>> items;
  final T? selected;
  final String display;
  const _SingleOptionDialog({
    Key? key,
    required this.allowClear,
    required this.items,
    required this.selected,
    required this.display,
  }) : super(key: key);

  @override
  State<_SingleOptionDialog<T>> createState() => __SingleOptionDialogState<T>();
}

class __SingleOptionDialogState<T> extends State<_SingleOptionDialog<T>> {
  late T? selected;
  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.display),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items.map((e) {
            return RadioListTile<T>(
              value: e.value,
              groupValue: selected,
              contentPadding: EdgeInsets.zero,
              onChanged: (value) {
                setState(() {
                  selected = value;
                });
              },
              title: Text(e.display),
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).maybePop('cancel'),
          style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error),
          child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
        ),
        if (widget.allowClear && selected != null)
          TextButton(
            onPressed: () {
              setState(() {
                selected = null;
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

class BooleanFilter extends StatelessWidget {
  final ValueChanged<bool?> onChange;
  final bool value;
  final bool disableNull;
  final String? trueDisplay;
  final String? falseDisplay;
  final String? display;
  final String? nullDisplay;
  const BooleanFilter({
    Key? key,
    required this.onChange,
    this.value = false,
    this.disableNull = false,
    this.trueDisplay,
    this.falseDisplay,
    this.nullDisplay,
    this.display,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleOptionFilter<bool?>(
      value: value,
      display: display ?? Ready.localization(context).state,
      items: <OptionFilterItem<bool?>>[
        if (disableNull != true)
          OptionFilterItem<bool?>(
            value: null,
            display: nullDisplay ?? Ready.localization(context).all,
          ),
        OptionFilterItem<bool?>(
            value: true,
            display: trueDisplay ?? Ready.localization(context).active),
        OptionFilterItem<bool?>(
            value: false,
            display: falseDisplay ?? Ready.localization(context).notActive),
      ],
      onChange: onChange,
    );
  }
}
