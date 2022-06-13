import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statecomparing/cubit/view_model/articles_cubit.dart';
import 'package:statecomparing/states.dart';
import '../../custom_screens/custom_article_screen.dart';
import '../../custom_screens/custom_articles_screen.dart';

class NewsScreen extends StatelessWidget {
  final String category;
  const NewsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, ArticlesStates>(
        listener: (context, state) {

    },
    builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Text(category),
        ),
        body: state is GetArticlesLoadingState ?  Center(
          child: CircularProgressIndicator()):ListView.builder(
            itemCount: NewsCubit.get(context).articles!.articles!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: CustomArticles(NewsCubit.get(context).articles!.articles![index]),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) => NewsDetails(NewsCubit.get(context).articles!.articles![index])));
                },
              );
            }
        ),
      );
    }
      );
    }
}