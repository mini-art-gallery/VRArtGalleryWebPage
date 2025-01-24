import 'package:flutter/material.dart';

class ParalaxScrollView extends StatefulWidget {
  const ParalaxScrollView({
    super.key,
    required this.background,
    required this.foreground,
  });

  final Widget background;
  final Widget foreground;

  @override
  State<ParalaxScrollView> createState() => _ParalaxScrollViewState();
}

class _ParalaxScrollViewState extends State<ParalaxScrollView> {
  double scrollOffset = 0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification) {
          setState(() {
            scrollOffset = notification.metrics.pixels;
          });
        }
        return true;
      },
      child: Stack(
        children: [
          Transform.translate(
              offset: Offset(0, -scrollOffset * 0.2), child: widget.background),
          widget.foreground,
        ],
      ),
    );
  }
}
