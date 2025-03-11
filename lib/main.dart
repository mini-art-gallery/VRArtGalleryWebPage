import 'package:flutter/material.dart';
import 'package:vr_art_gallery_web_page/widgets/description_item.dart';
import 'package:vr_art_gallery_web_page/widgets/gallery.dart';
import 'package:vr_art_gallery_web_page/widgets/paralax_scroll_view.dart';
import 'package:vr_art_gallery_web_page/widgets/blurred_image.dart';
import 'package:vr_art_gallery_web_page/widgets/gradient_text.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VR Art Gallery - Webpage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final descriptionItems = getDescriptionItems();
    final scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('VR Art Gallery'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilledButton(
                onPressed: () => _launchUrl(), child: const Text('Download')),
          )
        ],
      ),
      body: Center(
        child: ParalaxScrollView(
          controller: scrollController,
          background: const BlurredImage(assetPath: 'images/image1.jpg'),
          foreground: LayoutBuilder(
            builder: (context, constraints) {
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: constraints.maxHeight,
                      width: constraints.maxWidth,
                      child: Center(
                        child: Column(
                          children: [
                            Flexible(
                              flex: 3,
                              child: Center(
                                child: GradientText(
                                  'VR Art Gallery',
                                  gradient: const LinearGradient(
                                      colors: [Colors.red, Colors.white]),
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth / 8),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: FilledButton(
                                  onPressed: () => _launchUrl(),
                                  child: Text(
                                    'Download',
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth / 15),
                                  )),
                            )
                          ],
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
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth * 2 / 3,
                          maxHeight: constraints.maxHeight * 2 / 3,
                        ),
                        child: const Gallery(
                          photos: [
                            'images/image1.jpg',
                            'images/image1.jpg',
                            'images/image2.jpg',
                            'images/image3.jpg'
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Team',
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Michał Boguszewski',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Igor Faliszewski',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Bartosz Jadczak',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Damian Tomczak',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: FilledButton(
                                  onPressed: () => _launchUrl(),
                                  child: const Text(
                                    'Download',
                                    style: TextStyle(
                                      fontSize: 60,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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

final Uri _url =
    Uri.parse('https://github.com/mini-art-gallery/VRArtGallery/releases');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

List<(String title, String text, String imagePath)> getDescriptionItems() {
  return [
    (
      'Wirtualna Galeria Sztuki – Projekt Studentów MiNI PW',
      'Wirtualna galeria sztuki to innowacyjny projekt stworzony przez czterech studentów wydziału Matematyki i Nauk Informacyjnych Politechniki Warszawskiej. Stworzona w Unreal Engine aplikacja łączy świat wirtualnej rzeczywistości z narzędziami kreatywnymi, umożliwiając użytkownikom projektowanie i zwiedzanie przestrzeni artystycznych. Projekt oferuje dwa tryby: edycji oraz zwiedzania. W trybie edycji, na komputerze bez konieczności użycia gogli VR, można aranżować pokoje o dowolnym rozmiarze, dodawać obrazy, obiekty 3D i plakietki z opisami. Z kolei w trybie zwiedzania użytkownicy mogą eksplorować stworzone galerie w pełnym wymiarze VR, ciesząc się interaktywnym doświadczeniem. Aplikacja pozwala także zapisywać oraz wczytywać stworzone przestrzenie, co czyni ją idealnym narzędziem dla pasjonatów sztuki.',
      'images/image1.jpg'
    ),
    (
      'Dwa Światy Jednej Aplikacji: Edycja i Zwiedzanie',
      'Projekt wirtualnej galerii sztuki daje użytkownikom swobodę tworzenia oraz możliwość immersyjnego zwiedzania. W trybie edycji użytkownik ma do dyspozycji intuicyjne narzędzia do projektowania przestrzeni artystycznych – od ustawienia rozmiaru pokoju, poprzez rozmieszczenie obrazów i obiektów, aż po dodanie opisów. Co więcej, aplikacja umożliwia zapis i wczytywanie wcześniej zaprojektowanych pokoi, co pozwala na ciągłe doskonalenie swojego projektu. Drugi tryb – zwiedzanie – przenosi użytkownika do świata VR, w którym może eksplorować zaprojektowaną przestrzeń w pełni immersyjny sposób dzięki goglom VR. To wyjątkowe połączenie technologii i sztuki.',
      'images/image2.jpg'
    ),
    (
      'Nowoczesne Narzędzie dla Twórców i Entuzjastów Sztuki',
      'Wirtualna galeria sztuki to projekt, który doskonale wpisuje się w potrzeby współczesnych twórców i miłośników sztuki. Dzięki wykorzystaniu Unreal Engine, aplikacja oferuje realistyczne odwzorowanie przestrzeni w wirtualnej rzeczywistości. Tryb edycji pozwala na szczegółowe zaprojektowanie galerii, dostosowanie każdego elementu i zapis projektu. Zwiedzanie galerii w VR to z kolei możliwość przeniesienia się w stworzone przestrzenie i doświadczenie ich w pełnym wymiarze. Projekt ten nie tylko promuje nowe technologie, ale również umożliwia artystom i projektantom testowanie swoich pomysłów w wirtualnym środowisku, zanim przeniosą je do świata rzeczywistego.',
      'images/image3.jpg'
    )
  ];
}
