import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentPage extends StatefulWidget {

  var mainContentHeading;
  var mainImageUrl;
  var mainContent;
  var mainDiscription;
  var mainContentUrl;
  ContentPage({required this.mainContentHeading, required this.mainImageUrl,required this.mainContent, required this.mainDiscription, required this.mainContentUrl});
  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {


  _launchUrl() async {
    
    var uri = Uri.parse(widget.mainContentUrl);
    if (await canLaunchUrl(uri)) {
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
      appBar: AppBar(title: Text('Full News Content'),centerTitle: true,),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                Container(
                  height: 150,
                  width: double.infinity,
                  child: Text(widget.mainContentHeading,textAlign: TextAlign.center,style: GoogleFonts.cinzel(
                    fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white70
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
                SizedBox(height: 20,),
                Text('\"' +widget.mainDiscription +'\"',textAlign: TextAlign.center ,style: GoogleFonts.lato(
                  fontSize: 25,color: Colors.white,wordSpacing: 5,fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 10,),
                Text(widget.mainContent,textAlign: TextAlign.start ,style: GoogleFonts.lato(
                  fontSize: 20,color: Colors.white,wordSpacing: 5,
                ),),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  setState(() {
                    
                  });
                  if(widget.mainContentUrl !=''){
                  _launchUrl();
                  print('url launched');
                  }else{
                    print('Cannot launch Url');
                  }
                },

                child: Text('More Info'))
              ],
          ),
            ),
          ],
        )
      ),
    );
  }
}