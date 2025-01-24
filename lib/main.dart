import 'package:flutter/material.dart';
import 'package:vr_art_gallery_web_page/widgets/blurred_image.dart';
import 'package:vr_art_gallery_web_page/widgets/gradient_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Stack(
          children: [
            const BlurredImage(assetPath: 'images/background.jpeg'),
            Center(
              child: LayoutBuilder(builder: (context, constraints) {
                return GradientText(
                  'VR Art Gallery',
                  gradient:
                      const LinearGradient(colors: [Colors.red, Colors.white]),
                  style: TextStyle(fontSize: constraints.maxWidth / 8),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
