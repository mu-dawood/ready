part of responsive_data_table;

/// simple loading button
class LoadingButton extends StatefulWidget {
  final Icon icon;
  final String tooltip;
  final Future Function() load;
  final bool Function(bool loading) enabled;

  const LoadingButton({
    Key? key,
    required this.icon,
    required this.load,
    required this.enabled,
    required this.tooltip,
  }) : super(key: key);
  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var enabled = widget.enabled(isLoading);

    return IconButton(
      tooltip: widget.tooltip,
      icon: isLoading
          ? const Center(
              child: SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(),
              ),
            )
          : widget.icon,
      onPressed: enabled
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
          : null,
    );
  }
}
