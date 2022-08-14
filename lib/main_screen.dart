import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_news_app/International_New/international_news.dart';
import 'package:flutter_news_app/Local_News/local_news.dart';
import 'package:flutter_news_app/Sports_News/sports_news.dart';
import 'package:flutter_news_app/Techonology_News/techonology_news.dart';
import 'package:flutter_news_app/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int selectedIndex = 0;

  void onItenTap(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          HomePage(),
          InternationalNews(),
          SportsNews(),
          TechNews(),
          LocalNews()
        ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        currentIndex: selectedIndex,
        onTap: onItenTap,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white70,
        items: [
        BottomNavigationBarItem(
          label: 'International',
          icon: Icon(Icons.assured_workload,)),
        BottomNavigationBarItem(
          label: 'National',
          icon: Icon(Icons.home)),
        BottomNavigationBarItem(
          label: 'Sports',
          icon: Icon(Icons.sports_cricket)),
        BottomNavigationBarItem(
          label: 'Techonology',
          icon: Icon(Icons.computer)),
        BottomNavigationBarItem(
          label: 'Local',
          icon: Icon(Icons.local_activity)),
      ],)
    );
  }
}