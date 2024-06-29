import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/downloads_page.dart';
import 'package:netflix_clone/screens/games_page.dart';
import 'package:netflix_clone/screens/new_and_hot_page.dart';
import 'package:netflix_clone/untils/app_colors.dart';
import 'package:netflix_clone/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  final String selectedImage;
  final String userName;

  const HomeScreen({
    Key? key,
    required this.selectedImage,
    required this.userName,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController? _scrollController;
  double _scrollOffset = 0.0;
  int _currentIndex = 0;

  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    HomePage(),
    GamesPage(),
    NewAndHotPage(),
    DownloadsPage(),
  ];

  final List<String> _appBarTitles = [
    '',
    'Games',
    'New & Hot',
    'Downloads',
  ];

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController!.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(
          selectedImage: widget.selectedImage,
          scrollOffset: _scrollOffset,
          logoPath: _currentIndex == 0 ? 'assets/logo/logo.png' : null,
          title: _currentIndex == 0 ? null : _appBarTitles[_currentIndex],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.black,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: 'New & Hot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Home Page',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}






