import 'package:flutter/material.dart';

class CustomHomeScreen extends StatelessWidget {

  final String? categoryName ;
  const CustomHomeScreen(this.categoryName);


  @override
  Widget build(BuildContext context) {
    return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.black26.withOpacity(.9),
                            Colors.black.withOpacity(.6),
                          ]
                      ),
                      shape: BoxShape.circle,
                      border : Border.all(
                          color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                        )
                      ],
                    ),
                    child: Center(child: Text('${categoryName}', style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal))),
                  ),

                ),
              );
  }
}
