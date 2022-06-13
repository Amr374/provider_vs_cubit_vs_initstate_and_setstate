import 'package:flutter/material.dart';
import 'package:statecomparing/models/news_model.dart';
import '../../custom_screens/custom_article_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsScreenA extends StatefulWidget {
  final String category;
  const NewsScreenA(this.category);

  @override
  State<NewsScreenA> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreenA> {
  Articles? articles ;
  static String apiKey = '37e1a337f92e41ad87460949c5e3d193';

  @override
  void initState() {
    fetchData(widget.category);
    super.initState();
  }
  void fetchData(String? category)async{

    String url = 'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey';
    try{
      http.Response response = await http.get(Uri.parse(url));

      if(response.statusCode == 200){
        setState(() {
          articles = Articles.fromJson(jsonDecode(response.body));
        });
        print(articles!.articles!.length);
      }else {
        print('status code = ${response.statusCode}');
      }
    }

    catch (ex) {
      print(ex);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(widget.category),
      ),
      body : articles != null ? ListView.builder(
          itemCount: articles!.articles!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${articles!.articles![index].imageUrl}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: 150,
                  ),
                  Text('${articles!.articles![index].title??''}'),
                  // Text(authors[i].description),
                ],

              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) =>
                    NewsDetails(articles!.articles![index])));
              },
            );
          }
      ): Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}