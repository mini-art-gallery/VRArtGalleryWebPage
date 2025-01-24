import 'package:flutter/material.dart';

class ParalaxScrollView extends StatefulWidget {
  const ParalaxScrollView({
    super.key,
    required this.background,
    required this.foreground,
    required this.controller,
  });

  final Widget background;
  final Widget foreground;
  final ScrollController controller;

  @override
  State<ParalaxScrollView> createState() => _ParalaxScrollViewState();
}

class _ParalaxScrollViewState extends State<ParalaxScrollView> {
  double _scrollOffset = 0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification) {
          setState(() {
            _scrollOffset = widget.controller.offset;
          });
        }
        return true;
      },
      child: Stack(
        children: [
          Transform.translate(
              offset: Offset(0, -_scrollOffset * 0.2),
              child: widget.background),
          widget.foreground,
        ],
      ),
    );
  }
}
