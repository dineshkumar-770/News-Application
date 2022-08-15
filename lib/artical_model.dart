// To parse this JSON data, do
//
//     final newsResponse = newsResponseFromJson(jsonString);

import 'dart:convert';
import 'source_model.dart';


class Article {
       Source? source;
       String? author;
       String? title;
       String? description;
       String? url;
       String? urlToImage;
       String? publishedAt;
       String? content;

      Article({
        this.author,
        this.content,
        this.description,
        this.publishedAt,
        this.source,
        this.title,
        this.url,
        this.urlToImage
      });

    factory Article.fromJson(Map<String, dynamic> json) {
      print(json);
    return Article(
      //source: Source.fromJson(json['source']),
      author: json['author']== null?'Unknown':json['author'] as String,
      title: json['title'] == null?'Not Title available':json['title'] as String,
      description: json['description'] == null?'':json['description'] as String,
      url: json['url']==null?'':json['url'] as String,
      urlToImage: json['urlToImage']==null?'https://i0.wp.com/www.cssscript.com/wp-content/uploads/2015/11/ispinner.jpg?fit=400%2C298&ssl=1':json['urlToImage'] as String,
      publishedAt: json['publishedAt']==null?'Unknown':json['publishedAt'] as String,
      content: json['content'] == null?'Content Not Available':json['content'] as String,
    );
  }
  
}


