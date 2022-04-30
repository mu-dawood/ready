part of 'ready_form.dart';

/// wrap your fields with this widget will override the default behaviour of
/// field visibility
///
/// for [EnsureContextVisible] constructor the [ensureVisible] callback will be called after the default behaviour
/// for [EnsureContextVisible.override] constructor the [ensureVisible] callback will override the default behaviour

class EnsureContextVisible extends StatefulWidget {
  final Future Function(BuildContext context)? after;
  final Future Function(BuildContext context)? before;
  final Future Function(BuildContext context)? _ensureVisible;
  final Widget child;
  const EnsureContextVisible({
    Key? key,
    this.after,
    this.before,
    required this.child,
  })  : _ensureVisible = null,
        super(key: key);
  const EnsureContextVisible.override({
    Key? key,
    required Future Function(BuildContext context) ensureVisible,
    required this.child,
  })  : _ensureVisible = ensureVisible,
        after = null,
        before = null,
        super(key: key);

  @override
  State<EnsureContextVisible> createState() => _EnsureContextVisibleState();
}

class _EnsureContextVisibleState extends State<EnsureContextVisible> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
