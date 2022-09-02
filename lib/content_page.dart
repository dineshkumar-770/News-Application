import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ContentPage extends StatefulWidget {

  var mainContentHeading;
  var mainImageUrl;
  var mainContent;
  var mainDiscription;
  var mainContentUrl;
  var mainAuthor;
  ContentPage({required this.mainContentHeading, required this.mainImageUrl,required this.mainContent, required this.mainDiscription, required this.mainContentUrl, required this.mainAuthor});
  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {


  _launchUrl() async {
    
    var uri = Uri.parse(widget.mainContentUrl);
    if (await canLaunchUrl(uri)) {
      // ignore: deprecated_member_use
      await launch(
        uri.toString(),
        enableJavaScript: true
        );
      print('URL Launched');
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.black,
        title: Text('CONTENT', style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.amber.shade200),),centerTitle: true,),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  child: Text(widget.mainContentHeading,textAlign: TextAlign.center,style: GoogleFonts.cinzel(
                    fontSize: 26, fontWeight: FontWeight.bold, color: Colors.yellow.shade100,
                  ),),
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(image: NetworkImage(widget.mainImageUrl),fit: BoxFit.fill),
                  ),
                ),
                SizedBox(height: 10,),
                Text('Authored By :-' + widget.mainAuthor, style: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.amber.shade200),),
                SizedBox(height: 10,),
                Text('\"' +widget.mainDiscription +'\"',textAlign: TextAlign.center,style: GoogleFonts.lato(
                  fontSize: 25,color: Colors.white,wordSpacing: 5,fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10,),
                Text(widget.mainContent,textAlign: TextAlign.justify ,style: GoogleFonts.lato(
                  fontSize: 20,color: Colors.white70,wordSpacing: 5,
                ),),
                SizedBox(height: 10,),
                Link(
                target: LinkTarget.self,  
                uri: Uri.parse(widget.mainContentUrl), builder: (context,followlink)=>
                CupertinoButton(child: Text('Read more'), onPressed: followlink),
                ),
              ],
          ),
            ),
          ],
        )
      ),
    );
  }
}