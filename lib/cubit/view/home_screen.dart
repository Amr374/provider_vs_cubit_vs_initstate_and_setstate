import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statecomparing/custom_screens/custom_home_screen.dart';
import 'package:statecomparing/provider/view_model/news_provider.dart';

import '../view_model/articles_cubit.dart';
import 'news_screen.dart';


class CubitHomeScreen extends StatelessWidget {
  List<String> categories = ['sports','business','health','technology'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text('News App'),
        centerTitle: true,
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: CustomHomeScreen(categories[index]),
              onTap: () {
                // Provider.of<NewsProvider>(context,listen: false).articles!.articles!.clear();
                NewsCubit.get(context).fetchData(categories[index]);
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen(categories[index])));
              },
            );
          }
      ),
    );
  }
}