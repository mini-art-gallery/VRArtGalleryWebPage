import 'dart:ui';
import 'package:flutter/material.dart';

class BlurredImage extends StatelessWidget {
  const BlurredImage({
    super.key,
    required this.assetPath,
  });

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          assetPath,
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned.fill(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0),
          ),
        ))
      ],
    );
  }
}
