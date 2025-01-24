import 'package:flutter/material.dart';
import 'package:vr_art_gallery_web_page/widgets/description_item.dart';
import 'package:vr_art_gallery_web_page/widgets/paralax_scroll_view.dart';
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
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, brightness: Brightness.dark),
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
    final descriptionItems = getDescriptionItems();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: ParalaxScrollView(
          background: const BlurredImage(assetPath: 'images/background.jpeg'),
          foreground: LayoutBuilder(
            builder: (context, constraints) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Center(
                        child: GradientText(
                          'VR Art Gallery',
                          gradient: const LinearGradient(
                              colors: [Colors.red, Colors.white]),
                          style: TextStyle(fontSize: constraints.maxWidth / 8),
                        ),
                      ),
                    ),
                  ),
                  SliverList.builder(
                    itemBuilder: (context, index) => Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth * 5 / 6),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: DescriptionItem(
                            title: descriptionItems[index].$1,
                            text: descriptionItems[index].$2,
                            image: Image.asset(descriptionItems[index].$3),
                            reorder: index % 2 == 1,
                          ),
                        ),
                      ),
                    ),
                    itemCount: descriptionItems.length,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

List<(String title, String text, String imagePath)> getDescriptionItems() {
  return [
    ('Title 1', 'text 1', 'images/background.jpeg'),
    (
      'Lorem Ipsum',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris non ligula sed massa commodo lobortis vel ornare risus. Aliquam porta orci non sem tincidunt eleifend. Praesent in arcu quam. Fusce eu arcu auctor, mattis magna in, mattis purus. Etiam iaculis dignissim ultrices. Aenean egestas vel nisl et vehicula. Duis nisl risus, finibus at accumsan varius, convallis ullamcorper odio. Suspendisse potenti. Vivamus quam erat, viverra sed arcu sed, faucibus consectetur nunc. Cras fermentum sit amet felis sit amet porttitor. Maecenas cursus quis eros vitae faucibus.',
      'images/background.jpeg'
    ),
    (
      'Lorem Ipsum',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris non ligula sed massa commodo lobortis vel ornare risus. Aliquam porta orci non sem tincidunt eleifend. Praesent in arcu quam. Fusce eu arcu auctor, mattis magna in, mattis purus. Etiam iaculis dignissim ultrices. Aenean egestas vel nisl et vehicula. Duis nisl risus, finibus at accumsan varius, convallis ullamcorper odio. Suspendisse potenti. Vivamus quam erat, viverra sed arcu sed, faucibus consectetur nunc. Cras fermentum sit amet felis sit amet porttitor. Maecenas cursus quis eros vitae faucibus.',
      'images/background.jpeg'
    ),
    (
      'Lorem Ipsum',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris non ligula sed massa commodo lobortis vel ornare risus. Aliquam porta orci non sem tincidunt eleifend. Praesent in arcu quam. Fusce eu arcu auctor, mattis magna in, mattis purus. Etiam iaculis dignissim ultrices. Aenean egestas vel nisl et vehicula. Duis nisl risus, finibus at accumsan varius, convallis ullamcorper odio. Suspendisse potenti. Vivamus quam erat, viverra sed arcu sed, faucibus consectetur nunc. Cras fermentum sit amet felis sit amet porttitor. Maecenas cursus quis eros vitae faucibus.',
      'images/background.jpeg'
    ),
    (
      'Lorem Ipsum',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris non ligula sed massa commodo lobortis vel ornare risus. Aliquam porta orci non sem tincidunt eleifend. Praesent in arcu quam. Fusce eu arcu auctor, mattis magna in, mattis purus. Etiam iaculis dignissim ultrices. Aenean egestas vel nisl et vehicula. Duis nisl risus, finibus at accumsan varius, convallis ullamcorper odio. Suspendisse potenti. Vivamus quam erat, viverra sed arcu sed, faucibus consectetur nunc. Cras fermentum sit amet felis sit amet porttitor. Maecenas cursus quis eros vitae faucibus.',
      'images/background.jpeg'
    ),
    (
      'Lorem Ipsum',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris non ligula sed massa commodo lobortis vel ornare risus. Aliquam porta orci non sem tincidunt eleifend. Praesent in arcu quam. Fusce eu arcu auctor, mattis magna in, mattis purus. Etiam iaculis dignissim ultrices. Aenean egestas vel nisl et vehicula. Duis nisl risus, finibus at accumsan varius, convallis ullamcorper odio. Suspendisse potenti. Vivamus quam erat, viverra sed arcu sed, faucibus consectetur nunc. Cras fermentum sit amet felis sit amet porttitor. Maecenas cursus quis eros vitae faucibus.',
      'images/background.jpeg'
    ),
    (
      'Lorem Ipsum',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris non ligula sed massa commodo lobortis vel ornare risus. Aliquam porta orci non sem tincidunt eleifend. Praesent in arcu quam. Fusce eu arcu auctor, mattis magna in, mattis purus. Etiam iaculis dignissim ultrices. Aenean egestas vel nisl et vehicula. Duis nisl risus, finibus at accumsan varius, convallis ullamcorper odio. Suspendisse potenti. Vivamus quam erat, viverra sed arcu sed, faucibus consectetur nunc. Cras fermentum sit amet felis sit amet porttitor. Maecenas cursus quis eros vitae faucibus.',
      'images/background.jpeg'
    ),
  ];
}
