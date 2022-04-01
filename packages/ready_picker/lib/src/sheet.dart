import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

import 'controller.dart';

class SelectorSheet<T, TController extends ReadyPickerController<T>>
    extends StatefulWidget {
  final TController controller;
  final List<T> selectedItems;
  final bool allowMultiple;
  final Color? inActiveColor;
  final Color? activeColor;
  final TextStyle? textStyle;
  final Widget Function(
          TController controller, T? item, bool selected, VoidCallback onTap)?
      buildItem;
  const SelectorSheet({
    Key? key,
    required this.controller,
    required this.selectedItems,
    required this.allowMultiple,
    required this.inActiveColor,
    required this.activeColor,
    required this.textStyle,
    required this.buildItem,
  }) : super(key: key);
  @override
  _SelectorSheetState<T, TController> createState() =>
      _SelectorSheetState<T, TController>();
}

class _SelectorSheetState<T, TController extends ReadyPickerController<T>>
    extends State<SelectorSheet<T, TController>>
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
    var search = widget.controller.getSearchOptions(context);
    return ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .75),
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 100),
        padding: MediaQuery.of(context).viewInsets,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: ReadyList.list(
            controller: widget.controller,
            shrinkWrap: (_) => true,
            headerSlivers: (_) => [
              if (widget.allowMultiple == true || search != null)
                SliverAppBar(
                  pinned: true,
                  leading: const SizedBox(),
                  leadingWidth: 0,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: search == null
                      ? null
                      : TextField(
                          onChanged: search.callback,
                          decoration: search.decoration,
                        ),
                  actions: [
                    if (changed == true && widget.allowMultiple)
                      IconButton(
                        icon: const Icon(Icons.done),
                        onPressed: () {
                          Navigator.pop(context, selectedItems);
                        },
                      )
                  ],
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 15)),
            ],
            topLevelFooterSlivers: const [],
            buildItem: (T? item, int index) {
              return Animated(
                fade: const FadeAnimation(),
                child: buildItem(widget.controller, item),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildItem(TController controller, T? item) {
    var isSelected = selectedItems.any((element) {
      return item != null && controller.checkSelected(element, item);
    });
    onTap() {
      if (widget.allowMultiple == true) {
        if (isSelected) {
          selectedItems.removeWhere((element) {
            return item != null && controller.checkSelected(element, item);
          });
        } else if (item != null) {
          selectedItems.add(item);
        }
        setState(() {
          changed = true;
        });
      } else {
        Navigator.pop(context, item);
      }
    }

    if (widget.buildItem != null) {
      return widget.buildItem!(controller, item, isSelected, onTap);
    }
    if (item == null) {
      return const ListTile(title: Text('...'));
    }
    return ListTile(
      onTap: onTap,
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
