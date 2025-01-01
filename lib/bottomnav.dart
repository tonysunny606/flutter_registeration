import 'package:flutter/material.dart';
import 'package:flutter_registeration/notescreen.dart';
import 'package:flutter_registeration/profile.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  List pages=[
    Notescreen(),
    ProfileScreen()
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex=value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'note'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }
}
