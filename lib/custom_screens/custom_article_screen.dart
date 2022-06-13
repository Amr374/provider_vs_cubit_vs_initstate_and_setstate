import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/news_model.dart';

class NewsDetails extends StatelessWidget {
  Article? article;
  NewsDetails(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.black26,
          title: Text(''),
        ),
        body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${article!.imageUrl??''}'),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text('${article!.description??''}',style: TextStyle(color: Colors.black, fontSize: 15.0)),
                  height: 200,
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width-100,
                child:
                ElevatedButton(

                    child: Text('شاهد الخبر كاملا',style: TextStyle(color: Colors.white, fontSize: 20.0),),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black54,
                        elevation: 5.0
                    ),
                    onPressed: ()async {
                      if (!await launchUrl(Uri.parse('${article!.articleUrl}'))) throw 'Could not launch ${article!.articleUrl}';
                    }
                ),

              ),
            ]
        )
    );
  }
}
