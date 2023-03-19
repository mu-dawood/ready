part of 'filters.dart';

/// toggle filter
class ToggleFilter extends StatelessWidget with DecoratedDataTableFilter<bool> {
  @override
  final ValueChanged<bool> onChange;
  final String? activeText;
  final String? notActiveText;
  @override
  final InputDecoration decoration;
  @override
  final bool value;
  const ToggleFilter({
    Key? key,
    required this.onChange,
    this.activeText,
    this.notActiveText,
    this.value = false,
    this.decoration = const _DefaultInputDecoration(null),
  }) : super(key: key);
  @override
  String hintText(ReadyListLocalizations tr) {
    if (value) {
      return activeText ?? tr.active;
    }
    return notActiveText ?? tr.notActive;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveDecoration = _effectiveDecoration(context);
    return buildTab(
        context,
        IntrinsicWidth(
          child: InputDecorator(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            decoration: effectiveDecoration.copyWith(
              suffixIcon: Icon(
                value
                    ? Icons.check_box_outline_blank_rounded
                    : Icons.check_box_rounded,
                color: value
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).disabledColor,
              ),
            ),
            isEmpty: false,
            child: Text(hintText(Ready.localization(context))),
          ),
        ));
  }

  Widget buildTab(BuildContext context, Widget child) {
    return InkWell(
      onTap: () {
        onChange(!value);
      },
      child: child,
    );
  }
}
