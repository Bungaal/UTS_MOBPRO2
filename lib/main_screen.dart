import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'explore.dart';
import 'library.dart';
import 'profile.dart';
import 'bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  final String username;

  const MainScreen({super.key, required this.username});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(username: ''),  // HomeScreen akan menerima parameter username
    Explore(),
    Library(),
    Profile(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Menghilangkan tombol back dengan mengatur 'leading' ke null
        leading: null,
        title: Text('Welcome, ${widget.username}'),
      ),
      body: _pages[_currentIndex],  // Mengubah halaman sesuai dengan tab yang dipilih
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex, 
        onTap: _onTabTapped, 
      ),
    );
  }
}
