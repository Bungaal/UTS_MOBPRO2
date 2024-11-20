import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: const Color.fromARGB(255, 121, 162, 196),  // Warna latar belakang BottomNavigationBar
      selectedItemColor: const Color.fromARGB(255, 0, 0, 0),  // Warna item yang dipilih
      unselectedItemColor: const Color.fromARGB(255, 128, 146, 229),  // Warna item yang tidak dipilih
      showUnselectedLabels: true,  // Menampilkan label untuk item yang tidak dipilih
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
