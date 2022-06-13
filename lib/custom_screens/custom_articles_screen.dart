import 'package:flutter/material.dart';
import 'package:statecomparing/models/news_model.dart';


class CustomArticles extends StatelessWidget {
  final Article? article;
  const CustomArticles(this.article);

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${article!.imageUrl}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    height: 150,
                  ),
                  Text('${article!.title??''}'),
                  // Text(authors[i].description),
                ],

              );

  }
}