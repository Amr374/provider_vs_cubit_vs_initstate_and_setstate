import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statecomparing/states.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/news_model.dart';

class NewsCubit extends Cubit<ArticlesStates> {
  NewsCubit() : super(GetArticlesInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  static String apiKey = '37e1a337f92e41ad87460949c5e3d193';
  Articles? articles ;
  void fetchData(String category)async{
    emit(GetArticlesLoadingState());

    String url = 'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey';
    try{
      http.Response response = await http.get(Uri.parse(url));

      if(response.statusCode == 200){
        articles = Articles.fromJson(jsonDecode(response.body));
        print(articles!.articles!.length);
        emit(GetArticlesSuccessState());

      }else {
        print('status code = ${response.statusCode}');
      }
    }
    catch (error) {
      print(error);
      emit(GetArticlesErrorState('${error}'));

    }

  }

}