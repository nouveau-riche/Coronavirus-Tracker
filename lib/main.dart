import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/corona_data.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return ChangeNotifierProvider.value(
      value: Data(),
      child: MaterialApp(
        title: 'Covid-19 Tracker',
        theme:ThemeData(
          primarySwatch: Colors.green,
          canvasColor: Color.fromRGBO(230, 230, 230, 1),
        ),
        home: MyHomePage(),
      ),
    );
  }
}
