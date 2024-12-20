import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNav({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Colors.black),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book, color: Colors.black),
          label: "My Course",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books, color: Colors.black),
          label: "Library",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, color: Colors.black),
          label: "Account",
        ),
      ],
    );
  }
}
