import 'package:flutter/material.dart';

import 'ready_form/ready_form.dart';

class KeyboardActions extends StatefulWidget {
  final Widget child;
  final FocusTraversalPolicy? policy;
  const KeyboardActions({
    Key? key,
    required this.child,
    this.policy,
  }) : super(key: key);

  @override
  State<KeyboardActions> createState() => KeyboardActionsState();

  static KeyboardActionsState? of(BuildContext context) {
    return context.findAncestorStateOfType<KeyboardActionsState>();
  }
}

class KeyboardActionsState extends State<KeyboardActions>
    with WidgetsBindingObserver {
  var _keyboardOpened = false;

  @override
  void initState() {
    FocusManager.instance.addListener(_onFocusChanged);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    FocusManager.instance.removeListener(_onFocusChanged);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    if (mounted) {
      var data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
      var opened = data.viewInsets.bottom > 0;
      if (opened != _keyboardOpened) {
        setState(() {
          _keyboardOpened = opened;
        });
      }
    }
  }

  void _onFocusChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: widget.policy,
      child: Stack(
        children: [
          AnimatedPadding(
            padding: _keyboardOpened
                ? const EdgeInsets.only(bottom: kMinInteractiveDimension)
                : EdgeInsets.zero,
            duration: const Duration(milliseconds: 250),
            child: widget.child,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            height: _keyboardOpened ? kMinInteractiveDimension : 0,
            child: Builder(
              builder: (context) {
                var scope = FocusScope.of(context);
                var focusedChild = scope.focusedChild;
                var state = focusedChild?.context is StatefulElement
                    ? (focusedChild?.context as StatefulElement).state
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

                return AnimatedSize(
                  duration: const Duration(milliseconds: 250),
                  alignment: AlignmentDirectional.topCenter,
                  child: SizedBox(
                    height: _keyboardOpened ? kMinInteractiveDimension : 0,
                    child: Material(
                      color: background,
                      child: Row(
                        children: [
                          IconButton(
                            color: foreground,
                            onPressed: () {
                              scope.nextFocus();
                            },
                            icon: const Icon(Icons.arrow_downward),
                          ),
                          IconButton(
                            color: foreground,
                            onPressed: () {
                              scope.previousFocus();
                            },
                            icon: const Icon(Icons.arrow_upward),
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
                              FocusScope.of(context).unfocus();
                            },
                            icon: const Icon(Icons.keyboard_hide_rounded),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
