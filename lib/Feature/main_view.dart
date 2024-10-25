import 'package:flutter/material.dart';
import 'package:movie/Feature/favourite/presentation/views/favourite_view.dart';
import 'package:movie/Feature/home/presentation/view/home_view.dart';
import 'package:movie/Feature/search/presentation/views/search_view_body_bloc_provider.dart';

class SimpleBottomNavigation extends StatefulWidget {
  const SimpleBottomNavigation({super.key});

  @override
  State<SimpleBottomNavigation> createState() => _SimpleBottomNavigationState();
}

class _SimpleBottomNavigationState extends State<SimpleBottomNavigation> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeView(),
    const FavoritesView(),
    const SearchViewBodyBlocProvider(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff1E1E29),
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xff6200ee),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.shifting,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: _navBarItems),
    );
  }
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.bookmark_border_outlined),
    activeIcon: Icon(Icons.bookmark_rounded),
    label: 'Bookmarks',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.search_outlined),
    activeIcon: Icon(Icons.search_rounded),
    label: 'Search',
  ),
];
