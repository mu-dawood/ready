part of responsive_data_table;

/// simple loading button
class LoadingButton extends StatefulWidget {
  final Icon icon;
  final String tooltip;
  final Future Function() load;
  final bool Function(bool loading) enabled;
  final bool menuBar;
  const LoadingButton({
    Key? key,
    required this.icon,
    required this.load,
    required this.enabled,
    required this.tooltip,
    this.menuBar = false,
  }) : super(key: key);
  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var enabled = widget.enabled(isLoading);
    Widget icon = isLoading
        ? const Center(
            child: SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(),
            ),
          )
        : widget.icon;

    VoidCallback? onPressed = enabled
        ? () {
            if (isLoading) return;
            setState(() {
              isLoading = true;
            });
            widget.load().then((d) {
              setState(() {
                isLoading = false;
              });
            }).catchError((e) {
              setState(() {
                isLoading = false;
              });
            });
          }
        : null;
    if (widget.menuBar) {
      return MenuItemButton(
        onPressed: onPressed,
        requestFocusOnHover: false,
        leadingIcon: icon,
        child: Text(widget.tooltip),
      );
    } else {
      return IconButton(
        tooltip: widget.tooltip,
        icon: icon,
        onPressed: onPressed,
      );
    }
  }
}
