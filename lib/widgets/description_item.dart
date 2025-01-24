import 'package:flutter/material.dart';

class DescriptionItem extends StatelessWidget {
  const DescriptionItem({
    super.key,
    required this.title,
    required this.text,
    required this.image,
    required this.reorder,
  });

  final String title;
  final String text;
  final Image image;
  final bool reorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(120, 158, 158, 158),
      child: Row(
        children: reorder
            ? [_Text(title: title, text: text), _Image(image: image)]
            : [_Image(image: image), _Text(title: title, text: text)],
      ),
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.image,
  });

  final Image image;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: ClipPath(clipper: _Clipper(), child: image),
    ));
  }
}

class _Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width / 15, 0);
    path.lineTo(size.width, size.height / 15);
    path.lineTo(size.width * 14 / 15, size.height);
    path.lineTo(0, size.height * 14 / 15);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
