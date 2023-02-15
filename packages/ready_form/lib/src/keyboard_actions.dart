import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'ready_form/ready_form.dart';

class KeyboardActions extends StatelessWidget {
  final Widget child;
  final FocusTraversalPolicy? policy;
  const KeyboardActions({
    Key? key,
    required this.child,
    this.policy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return child;
    }
    return FocusTraversalGroup(
      policy: policy,
      child: KeyboardVisibilityBuilder(
        builder: (BuildContext context, bool isKeyboardVisible) {
          var duration = const Duration(milliseconds: 250);
          return Stack(
            children: [
              AnimatedPadding(
                padding: isKeyboardVisible
                    ? const EdgeInsets.only(bottom: kMinInteractiveDimension)
                    : EdgeInsets.zero,
                duration: duration,
                child: child,
              ),
              AnimatedPositioned(
                bottom: isKeyboardVisible ? -kMinInteractiveDimension : 0,
                right: 0,
                left: 0,
                duration: duration,
                height: kMinInteractiveDimension,
                child: AnimatedOpacity(
                  duration: duration,
                  opacity: isKeyboardVisible ? 1 : 0,
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
                        var isDark =
                            config.keyboardAppearance == Brightness.dark;
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
                          height:
                              isKeyboardVisible ? kMinInteractiveDimension : 0,
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
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
