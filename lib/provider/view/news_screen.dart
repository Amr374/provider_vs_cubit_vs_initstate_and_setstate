import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../custom_screens/custom_article_screen.dart';
import '../view_model/news_provider.dart';

class NewsScreen extends StatelessWidget {
  final String category;
  const NewsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(category),
      ),
      body : Provider.of<NewsProvider>(context,listen: true).articles != null ? ListView.builder(
          itemCount: Provider.of<NewsProvider>(context,listen: true).articles!.articles!.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${Provider.of<NewsProvider>(context,listen: true).articles!.articles![i].imageUrl}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: 150,
                  ),
                  Text('${Provider.of<NewsProvider>(context,listen: true).articles!.articles![i].title??''}'),
                  // Text(authors[i].description),
                ],

              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => NewsDetails(Provider.of<NewsProvider>(context,listen: true).articles!.articles![i])));
              },
            );
          }
      ): Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}