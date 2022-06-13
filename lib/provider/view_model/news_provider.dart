import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:statecomparing/models/news_model.dart';

class NewsProvider extends ChangeNotifier{
  static String apiKey = '37e1a337f92e41ad87460949c5e3d193';
  Articles? articles ;
  void fetchData(String category)async{
    String url = 'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey';
    try{
      http.Response response = await http.get(Uri.parse(url));

      if(response.statusCode == 200){
        articles = Articles.fromJson(jsonDecode(response.body));
        print(articles!.articles!.length);
        notifyListeners();

      }else {
        print('status code = ${response.statusCode}');
      }
    }
    catch (ex) {
      print(ex);
    }
    notifyListeners();
  }
}