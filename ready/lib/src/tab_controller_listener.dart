import 'package:flutter/material.dart';

/// This will listen to [controller] and call [builder] every time index changed
/// If [controller] is null then it will listen to nearest [DefaultTabController]
class TabControllerBuilder extends StatefulWidget {
  final TabController? controller;
  final Widget Function(int index) builder;
  const TabControllerBuilder({
    Key? key,
    this.controller,
    required this.builder,
  }) : super(key: key);

  @override
  State<TabControllerBuilder> createState() => _TabControllerBuilderState();
}

class _TabControllerBuilderState extends State<TabControllerBuilder> {
  TabController? _controller;

  void _onIndexChanged() {
    if (mounted) setState(() {});
  }

  @override
  void didUpdateWidget(TabControllerBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) _updateController();
  }

  void _updateController() {
    _controller?.removeListener(_onIndexChanged);
    _controller = widget.controller ?? DefaultTabController.of(context);
    _controller?.addListener(_onIndexChanged);
  }

  @override
  void didChangeDependencies() {
    _updateController();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller?.removeListener(_onIndexChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_controller?.index ?? 0);
  }
}

class TabControllerListener extends StatefulWidget {
  final TabController? controller;
  final Function(int index) onPageChanged;
  final Widget child;
  const TabControllerListener({
    Key? key,
    this.controller,
    required this.onPageChanged,
    required this.child,
  }) : super(key: key);

  @override
  State<TabControllerListener> createState() => _TabControllerListenerState();
}

class _TabControllerListenerState extends State<TabControllerListener> {
  TabController? _controller;

  void _onIndexChanged() {
    if (mounted) {
      widget.onPageChanged(_controller?.index ?? 0);
    }
  }

  @override
  void didUpdateWidget(TabControllerListener oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) _updateController();
  }

  void _updateController() {
    _controller?.removeListener(_onIndexChanged);
    _controller = widget.controller ?? DefaultTabController.of(context);
    _controller?.addListener(_onIndexChanged);
  }

  @override
  void didChangeDependencies() {
    _updateController();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller?.removeListener(_onIndexChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
