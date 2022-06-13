import 'package:flutter/material.dart';
import 'package:statecomparing/custom_screens/custom_home_screen.dart';

import 'news_screen.dart';


class WithOutHomeScreen extends StatelessWidget {
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreenA(categories[index])));
              },
            );
          }
      ),
    );
  }
}
