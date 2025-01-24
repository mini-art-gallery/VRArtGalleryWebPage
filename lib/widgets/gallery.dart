import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key, required this.photos});

  final List<String> photos;

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> with TickerProviderStateMixin {
  final pageController = PageController();
  late final TabController tabController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: widget.photos.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(120, 158, 158, 158),
      child: Column(
        children: [
          const Text(
            'Photo Gallery',
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(60, 10, 60, 5),
                child: Stack(children: [
                  PageView(
                    controller: pageController,
                    children: widget.photos.map((p) => Image.asset(p)).toList(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        _updateCurrentPage(currentPage - 1);
                      },
                      icon: const Icon(Icons.arrow_left),
                      color: Colors.white,
                      iconSize: 50,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        _updateCurrentPage(currentPage + 1);
                      },
                      icon: const Icon(Icons.arrow_right),
                      color: Colors.white,
                      iconSize: 50,
                    ),
                  ),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TabPageSelector(
              controller: tabController,
            ),
          ),
        ],
      ),
    );
  }

  void _updateCurrentPage(int index) {
    if (index < 0 || index >= widget.photos.length) {
      return;
    }

    setState(() {
      tabController.index = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      currentPage = index;
    });
  }
}
