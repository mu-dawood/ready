import 'package:flutter/material.dart';

import 'ready_form.dart';

class KeyboardActions extends StatefulWidget {
  final Widget child;
  const KeyboardActions({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _KeyboardActionsState createState() => _KeyboardActionsState();

  static _KeyboardActionsState? of(BuildContext context) {
    return context.findAncestorStateOfType<_KeyboardActionsState>();
  }
}

class _KeyboardActionsState extends State<KeyboardActions>
    with WidgetsBindingObserver {
  late FocusScopeNode node;
  var _keyboardOpened = false;
  bool _canGoPrevious = false;
  bool _canGoNext = false;
  bool get canGoPrevious => _canGoPrevious;
  bool get canGoNext => _canGoNext;
  bool get keyboardOpened => _keyboardOpened;

  Iterable<FocusNode> get traversalDescendants => node.traversalChildren.where(
        (FocusNode node) {
          return (node.context as StatefulElement?)?.widget is! Focus;
        },
      );
  bool isLastNode(FocusNode _node) {
    if (traversalDescendants.isEmpty) return false;
    return traversalDescendants.last == _node;
  }

  bool isFirstNode(FocusNode _node) {
    if (traversalDescendants.isEmpty) return false;
    return traversalDescendants.first == _node;
  }

  bool isInFirstNode() {
    if (node.focusedChild == null) return false;
    return isFirstNode(node.focusedChild!);
  }

  bool isInLastNode() {
    if (node.focusedChild == null) return false;
    return isLastNode(node.focusedChild!);
  }

  TextInputAction preferredAction() {
    return isInLastNode() ? TextInputAction.previous : TextInputAction.next;
  }

  void _focusChanged() {
    if (mounted) {
      var _prev = node.hasFocus &&
          node.focusedChild != null &&
          !isFirstNode(node.focusedChild!);
      var _next = node.hasFocus &&
          node.focusedChild != null &&
          !isLastNode(node.focusedChild!);
      if (_prev != _canGoPrevious || _next != _canGoNext) {
        setState(() {
          _canGoNext = _next;
          _canGoPrevious = _prev;
        });
      }
    }
  }

  @override
  void initState() {
    node = FocusScopeNode(debugLabel: 'KeyboardActions');
    FocusManager.instance.addListener(_focusChanged);
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_focusChanged);
    node.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    if (mounted) {
      var data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
      var opened = data.viewInsets.bottom > 0;
      if (opened != _keyboardOpened) {
        setState(() {
          _keyboardOpened = opened;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var state = node.focusedChild?.context is StatefulElement
        ? (node.focusedChild?.context as StatefulElement).state
        : null;
    var editable = state is EditableTextState ? state : null;
    Color? background;
    Color? foreground;
    if (editable != null) {
      var config = editable.textInputConfiguration;
      var isDark = config.keyboardAppearance == Brightness.dark;
      background = Color(isDark ? 0xFF595959 : 0xFFc8cdd6);
      foreground = isDark ? Colors.white : Colors.black;
    } else {
      background = Theme.of(context).colorScheme.surface;
      foreground = Theme.of(context).colorScheme.onSurface;
    }
    return Stack(
      children: [
        AnimatedPadding(
          padding: keyboardOpened
              ? const EdgeInsets.only(bottom: kMinInteractiveDimension)
              : EdgeInsets.zero,
          duration: const Duration(milliseconds: 250),
          child: FocusScope(
            node: node,
            child: widget.child,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          height: keyboardOpened ? kMinInteractiveDimension : 0,
          child: AnimatedSize(
            duration: const Duration(milliseconds: 250),
            alignment: AlignmentDirectional.topCenter,
            child: SizedBox(
              height: keyboardOpened ? kMinInteractiveDimension : 0,
              child: Material(
                color: background,
                child: Row(
                  children: [
                    IconButton(
                      color: foreground,
                      onPressed: canGoPrevious
                          ? () async {
                              node.previousFocus();
                            }
                          : null,
                      icon: const Icon(Icons.navigate_before_rounded),
                    ),
                    IconButton(
                      color: foreground,
                      onPressed: canGoNext
                          ? () {
                              node.nextFocus();
                            }
                          : null,
                      icon: const Icon(Icons.navigate_next_rounded),
                    ),
                    if (ReadyForm.of(context) != null) ...[
                      IconButton(
                        color: foreground,
                        onPressed: () {
                          ReadyForm.of(context)?.onSubmit();
                        },
                        icon: const Icon(Icons.done_rounded),
                      ),
                    ],
                    const Spacer(),
                    IconButton(
                      color: foreground,
                      onPressed: () {
                        node.unfocus();
                      },
                      icon: const Icon(Icons.keyboard_hide_rounded),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
