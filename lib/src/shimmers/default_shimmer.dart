part of shimmers;

class Shimmer extends StatelessWidget {
  final Widget child;
  final LinearGradient? gradient;
  const Shimmer({Key? key, required this.child, this.gradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Shimmer(
      linearGradient: gradient ??
          LinearGradient(
            colors: [
              Theme.of(context).cardColor,
              Theme.of(context).backgroundColor,
              Theme.of(context).cardColor,
            ],
            stops: const [
              0.1,
              0.3,
              0.4,
            ],
            begin: const Alignment(-1.0, -0.3),
            end: const Alignment(1.0, 0.3),
            tileMode: TileMode.clamp,
          ),
      child: child,
    );
  }
}
