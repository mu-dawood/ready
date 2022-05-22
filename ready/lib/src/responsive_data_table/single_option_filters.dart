part of responsive_data_table;

/// single option filter
class OptionFilterItem<T> {
  final String display;
  final T? value;

  OptionFilterItem({this.display = '', this.value});
}

class SingleOptionFilter<T> extends StatefulWidget
    implements _DataTableFilter<T?> {
  @override
  final T? value;
  final String display;
  final bool canReset;
  final List<OptionFilterItem<T>> items;
  @override
  final ValueChanged<T?> onChange;
  const SingleOptionFilter({
    Key? key,
    required this.onChange,
    required this.items,
    this.value,
    required this.display,
    this.canReset = true,
  }) : super(key: key);

  @override
  State<SingleOptionFilter<T>> createState() => _SingleOptionFilterState<T>();
}

class _SingleOptionFilterState<T> extends State<SingleOptionFilter<T>>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var selected =
        widget.items.firstWhere((el) => el.value == widget.value, orElse: () {
      return OptionFilterItem<T>(
        display: widget.display,
      );
    });

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          PopupMenuButton<OptionFilterItem<T>>(
            initialValue: selected.value == null ? null : selected,
            tooltip: widget.display,
            onSelected: (v) async {
              widget.onChange(v.value);
              FocusScope.of(context).requestFocus(FocusNode());
            },
            itemBuilder: (BuildContext context) {
              return [
                ...widget.items
                    .map(
                      (e) => PopupMenuItem<OptionFilterItem<T>>(
                        value: e,
                        child: Text(e.display),
                      ),
                    )
                    .toList()
              ];
            },
            child: TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.more_vert),
              label: Text(selected.display),
            ),
          ),
          if (widget.canReset == true && widget.value != null)
            IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {
                  widget.onChange(null);
                  FocusScope.of(context).requestFocus(FocusNode());
                })
        ],
      ),
    );
  }
}

class BooleanFilter extends StatelessWidget {
  final ValueChanged<bool?> onChange;
  final bool? value;
  final bool disableNull;
  final String? trueDisplay;
  final String? falseDisplay;
  final String? display;
  final String? nullDisplay;
  const BooleanFilter({
    Key? key,
    required this.onChange,
    this.value,
    this.disableNull = false,
    this.trueDisplay,
    this.falseDisplay,
    this.nullDisplay,
    this.display,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleOptionFilter<bool>(
      value: value,
      display: display ?? Ready.localization(context).state,
      items: <OptionFilterItem<bool>>[
        if (disableNull != true)
          OptionFilterItem<bool>(
              value: null,
              display: nullDisplay ?? Ready.localization(context).all),
        OptionFilterItem<bool>(
            value: true,
            display: trueDisplay ?? Ready.localization(context).active),
        OptionFilterItem<bool>(
            value: false,
            display: falseDisplay ?? Ready.localization(context).notActive),
      ],
      onChange: onChange,
    );
  }
}
