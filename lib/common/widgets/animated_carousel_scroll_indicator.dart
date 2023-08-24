import 'package:flutter/material.dart';

import '../../constants.dart';

class AnimatedCarouselScrollIndicator extends StatelessWidget {
  const AnimatedCarouselScrollIndicator({
    super.key,
    required this.length,
    required this.carouselImageIndex,
  });

  final int length;
  final int carouselImageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 8.0,
          width: carouselImageIndex == index ? 30.0 : 8.0,
          margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 4.0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
