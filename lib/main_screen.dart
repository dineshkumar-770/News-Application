import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_news_app/International_New/international_news.dart';
import 'package:flutter_news_app/Local_News/local_news.dart';
import 'package:flutter_news_app/Sports_News/sports_news.dart';
import 'package:flutter_news_app/Techonology_News/techonology_news.dart';
import 'package:flutter_news_app/homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  void onItenTap(int index) {
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
            LocalNews(),
          ],
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            elevation: 10,
            backgroundColor: Color(0xff414A4C),
            iconTheme: MaterialStateProperty.all(
              IconThemeData(opacity: 0.75, color: Colors.amber.shade100),
            ),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            height: 65,
            labelTextStyle: MaterialStateProperty.all(
              GoogleFonts.lato(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          child: CurvedNavigationBar(
            animationDuration: Duration(milliseconds: 800),
            color: Color(0xff414a4c),
            height: 60,
            backgroundColor: Colors.amber.shade100,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              Icon(
                FontAwesomeIcons.globe,
                size: 25,
              ),
              Icon(
                FontAwesomeIcons.compass,
                size: 25,
              ),
              Icon(
                Icons.sports_cricket,
                size: 25,
              ),
              Icon(
                FontAwesomeIcons.laptop,
                size: 25,
              ),
              Icon(
                Icons.local_activity,
                size: 25,
              ),
            ],
            index: selectedIndex,
            onTap: (value) {
              setState(() {
                this.selectedIndex = value;
                print(selectedIndex.toString());
              });
            },
          ),
        ));
  }
}
