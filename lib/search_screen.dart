import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_news_app/International_New/international_news.dart';
import 'package:flutter_news_app/Local_News/local_news.dart';
import 'package:flutter_news_app/Sports_News/sports_news.dart';
import 'package:flutter_news_app/Techonology_News/techonology_news.dart';
import 'package:flutter_news_app/customsearch/custom_search.dart';
import 'package:flutter_news_app/homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController keyWordController = TextEditingController();

  List<String> thumbnails = [
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/world-news-design-template-f59a6f90851b4d2a15392cf509688b4d_screen.jpg?ts=1649919607',
    'https://cfvod.kaltura.com/p/2531481/sp/253148100/thumbnail/entry_id/1_24mi19dq/version/100001/width/412/height/248',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/neon-sports-news-youtube-banner-design-template-74f47bee7fb67540dc227c312abf46d9_screen.jpg?ts=1566568629',
    'https://assets.thehansindia.com/h-upload/2021/06/26/1084530-t.webp',
    'https://media.istockphoto.com/vectors/-vector-id1183338498?k=20&m=1183338498&s=612x612&w=0&h=yztzRygYDsQooJf2j8NMp2tp_PjywGYjhobPTVHenU4=',
  ];

  List<Widget> Screens = [
    HomePage(),
    InternationalNews(),
    SportsNews(),
    TechNews(),
    LocalNews(),
  ];

  List<String> titles = [
    'International News',
    'National Conflicts',
    'Sports Lovers',
    'Technology Hots',
    'Local Controversies',
  ];
  String url =
      'https://i.pinimg.com/originals/b1/da/88/b1da88bc43fafcf7ef32df60ac5747ac.jpg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'SEARCH',
          style: GoogleFonts.dmSans(
              fontSize: 30,
              color: Colors.amber.shade200,
              fontWeight: FontWeight.bold,
              letterSpacing: 5),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover)),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black54),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    style: TextStyle(color: Colors.white70, fontSize: 17.5),
                    onChanged: (value) {},
                    controller: keyWordController,
                    cursorHeight: 25,
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: Colors.amber.shade200,
                    decoration: InputDecoration(
                      labelText: 'Keyword',
                      contentPadding: EdgeInsets.all(8),
                      labelStyle: TextStyle(
                          color: Colors.amber.shade200,
                          fontWeight: FontWeight.bold),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.amber.shade200),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.newspaper,
                        color: Colors.amber.shade200,
                      ),
                      hintText: 'Search for Keyword',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 0.75, color: Colors.amber.shade200),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      fillColor: Color(0xffD5D399),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber.shade200),
                    onPressed: () {
                      if (keyWordController.text.isNotEmpty) {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) {
                          return CustomSearch(
                              keywordValue: keyWordController.text
                                  .trim()
                                  .toString()
                                  .toLowerCase());
                        }));
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('ioNews'),
                            content: Text('This Field can\'t be empty'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(color: Colors.green),
                                  ))
                            ],
                          ),
                        );
                      }
                    },
                    child: Center(
                        child: Text(
                      'Search',
                      style:
                          GoogleFonts.lato(fontSize: 20, color: Colors.black54),
                    ))),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: Screens.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Stack(children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(thumbnails[index]),
                                    fit: BoxFit.fill,
                                    filterQuality: FilterQuality.low),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  CupertinoPageRoute(builder: (context) {
                                return Screens[index];
                              }));
                            },
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  titles[index],
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      );
                    }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
