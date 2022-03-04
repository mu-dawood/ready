part of ready_picker;

class _SelectorSheet<T, TController extends SelectFormBloc<T>>
    extends StatefulWidget {
  final TController controller;
  final List<T> selectedItems;
  final bool allowMultiple;
  final Color? inActiveColor;
  final Color? activeColor;
  final TextStyle? textStyle;
  const _SelectorSheet({
    Key? key,
    required this.controller,
    required this.selectedItems,
    required this.allowMultiple,
    this.inActiveColor,
    this.activeColor,
    this.textStyle,
  }) : super(key: key);
  @override
  __SelectorSheetState<T, TController> createState() =>
      __SelectorSheetState<T, TController>();
}

class __SelectorSheetState<T, TController extends SelectFormBloc<T>>
    extends State<_SelectorSheet<T, TController>>
    with SingleTickerProviderStateMixin {
  late List<T> selectedItems;
  bool changed = false;
  @override
  void initState() {
    selectedItems = widget.selectedItems.map((e) => e).toList();
    super.initState();
  }

  Color getActiveColor() {
    return widget.activeColor ?? Theme.of(context).primaryColor;
  }

  Color getInActiveColor() {
    return widget.inActiveColor ?? Theme.of(context).disabledColor;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .75),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: ReadyList.list(
          controller: widget.controller,
          shrinkWrap: (_) => true,
          headerSlivers: (_) => [
            if (widget.allowMultiple == true)
              SliverAppBar(
                pinned: true,
                actions: [
                  if (changed == true)
                    IconButton(
                        icon: const Icon(Icons.done),
                        onPressed: () {
                          Navigator.pop(context, selectedItems);
                        })
                ],
              ),
            const SliverToBoxAdapter(child: SizedBox(height: 15)),
          ],
          topLevelFooterSlivers: const [],
          buildItem: (T? item, int index) {
            return Animated(
              fade: const FadeAnimation(),
              child: item == null
                  ? const ListTile(title: Text("..."))
                  : buildItem(widget.controller, item),
            );
          },
        ),
      ),
    );
  }

  Widget buildItem(TController controller, T item) {
    var isSelected = selectedItems.any((element) {
      return controller.checkSelected(element, item);
    });
    return ListTile(
      onTap: () {
        if (widget.allowMultiple == true) {
          if (isSelected) {
            selectedItems.removeWhere((element) {
              return controller.checkSelected(element, item);
            });
          } else {
            selectedItems.add(item);
          }
          setState(() {
            changed = true;
          });
        } else {
          Navigator.pop(context, item);
        }
      },
      trailing: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected
              ? getActiveColor().withOpacity(0.1)
              : getInActiveColor().withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(5),
        child: Icon(
          Icons.check,
          color: isSelected ? getActiveColor() : getInActiveColor(),
        ),
      ),
      title: DefaultTextStyle.merge(
        style: TextStyle(color: isSelected ? getActiveColor() : null),
        child: Text(
          controller.getItemDisplay(context, item),
          style: widget.textStyle,
        ),
      ),
    );
  }
}
