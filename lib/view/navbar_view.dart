import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tomato/view/riwayat/riwayat_page.dart';

import 'package:tomato/view/home.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  int _currentIndex = 0;
  List<Widget> _children = [Home(), RiwayatPage()];

  void _onItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white, // Warna bayangan
              spreadRadius: 2, // Radius penyebaran bayangan
              blurRadius: 5, // Radius blur bayangan
              offset: Offset(0, 3), // Posisi bayangan (X, Y)
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          child: GNav(
            gap: 20,
            backgroundColor: Colors.white,
            color: Color.fromARGB(255, 98, 150, 130),
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 98, 150, 130),
            padding: EdgeInsets.all(15),
            tabs: const [
              GButton(
                icon: Icons.home_filled,
                text: 'Home',
                iconSize: 25,
              ),
              GButton(
                icon: Icons.my_library_books_rounded,
                text: 'Riwayat',
                iconSize: 25,
              ),
              // GButton(
              //   icon: Icons.bar_chart_rounded,
              //   text: 'Statistik',
              //   iconSize: 25,
              // ),
            ],
            onTabChange: _onItemTap,
          ),
        ),
      ),
    );
  }
}
