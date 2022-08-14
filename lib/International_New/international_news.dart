import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_news_app/artical_model.dart';
import 'package:flutter_news_app/content_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class InternationalNews extends StatefulWidget {
  const InternationalNews({Key? key}) : super(key: key);

  @override
  State<InternationalNews> createState() => _InternationalNewsState();
}

class _InternationalNewsState extends State<InternationalNews> {

  

  @override
  void initState() {
    super.initState();
    getArticle();
  }

  Future<List<Article>> getArticle() async {
    Uri endpointUrl = Uri.parse('https://newsapi.org/v2/everything?q=india&from=2022-08-07&sortBy=publishedAt&apiKey=c882c51d110f4e01a4631584f7aecb6a');
    var res = await get(endpointUrl);
    print(res.statusCode);
    if (res.statusCode == 200) {
      //print(res.body); 
      Map<String,dynamic> json = jsonDecode(res.body);
      
      List <dynamic> body = json['articles'];
      List <Article> articles = [];

      for (var element in body) {
        Article art = await Article.fromJson(element);
        articles.add(art);
      }
      return articles;
      
    } else{
      throw (res.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('NATIONAL', style: GoogleFonts.robotoSlab(fontSize: 29, letterSpacing: 5, fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Article>>(
          future: getArticle(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else{
              if(snapshot.hasError){
                print(snapshot.error);
                return Center(child: Text('No Internet Connection'),);
              }else{
                return Center(child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: NetworkImage(snapshot.data[index].urlToImage),fit: BoxFit.fill)
                          ),
                      ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder:  (context){
                              return ContentPage(
                                mainContentUrl: snapshot.data[index].url,
                                mainDiscription: snapshot.data[index].description,
                                mainContent: snapshot.data[index].content,
                                mainImageUrl: snapshot.data[index].urlToImage,
                                mainContentHeading: snapshot.data[index].title);
                            }));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  snapshot.data[index].title,textAlign: TextAlign.start,style: GoogleFonts.lato(
                                    fontSize: 22,color: Colors.white
                                  ),
                                ),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('By:-' +snapshot.data[index].author, style: GoogleFonts.lato(
                                    fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold
                                  ),),
                                  Text('Published on:-' +snapshot.data[index].publishedAt, style: GoogleFonts.lato(
                                    fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold
                                  ),), 
                                ],
                              ),
                              
                            ],
                          ),
                                              ),
                          ),
                        ),
                      ),
                    ]);
                  }),);
              }
            }
          },
          ),
      ),
    );
  }
}