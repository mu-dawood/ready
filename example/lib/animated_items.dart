import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

class AnimatedScopeItemsExample extends StatelessWidget {
  const AnimatedScopeItemsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedItemsScope(
      delay: const Duration(seconds: 1),
      child: GridView.count(
        crossAxisCount: 5,
        padding: const EdgeInsets.all(20),
        children: const [
          FlipItem(child: Card()),
          FlipSlideFadeItem(child: Card()),
          FlipSlideItem(child: Card()),
          ScaleItem(child: Card()),
          SlideFadeItem(child: Card()),
          SlideItem(child: Card()),
          FadeItem(child: Card()),
        ],
      ),
    );
  }
}

class AnimatedItemsExample extends StatelessWidget {
  const AnimatedItemsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisCount: 5,
      children: const [
        FlipItem(child: Card()),
        FlipSlideFadeItem(child: Card()),
        FlipSlideItem(child: Card()),
        ScaleItem(child: Card()),
        SlideFadeItem(child: Card()),
        SlideItem(child: Card()),
        FadeItem(child: Card()),
      ],
    );
  }
}
