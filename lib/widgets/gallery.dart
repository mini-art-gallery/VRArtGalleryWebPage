import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key, required this.photos});

  final List<String> photos;

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> with TickerProviderStateMixin {
  final _pageController = PageController();
  late final TabController _tabController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.photos.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    _tabController.dispose();
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
                    controller: _pageController,
                    children: widget.photos.map((p) => Image.asset(p)).toList(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {
                        _updateCurrentPage(_currentPage - 1);
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
                        _updateCurrentPage(_currentPage + 1);
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
              controller: _tabController,
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
      _tabController.index = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      _currentPage = index;
    });
  }
}
