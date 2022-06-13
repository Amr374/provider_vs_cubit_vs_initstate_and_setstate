import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:statecomparing/cubit/view_model/articles_cubit.dart';
import 'package:statecomparing/provider/view_model/news_provider.dart';

import 'cubit/view/home_screen.dart';
import 'provider/view/home_screen.dart';
import 'without_state_management/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Provider
    // return  MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider<NewsProvider>(create: (context) => NewsProvider(),),
    //
    //     ],
    //
    // child : MaterialApp(
    //   home: HomeScreen(),
    // )
    // );

    //Cubit
    // return  MultiBlocProvider(
    //     providers: [
    //       BlocProvider(
    //           create: (BuildContext context) => NewsCubit()),
    //
    //     ],
    //
    // child : MaterialApp(
    //   home: CubitHomeScreen(),
    // )
    // );
    return MaterialApp(
      home: WithOutHomeScreen(),
    );
  }
}


