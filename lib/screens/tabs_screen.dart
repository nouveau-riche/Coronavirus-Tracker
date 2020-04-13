import 'package:flutter/material.dart';

import './precaution_screen.dart';
import './home_screen.dart';

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Map<String, Object>> pages = [
    {'page': HomeScreen(),},
    {'page': PrecautionScreen(),},
    //{'page': FAQScreen(),}
  ];

  int pageIndex =0 ;

  void selectPage(int index){
    setState(() {
      pageIndex = index;
    });
  }

  Widget build(BuildContext context){
    return Scaffold(
      body:pages[pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: pageIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            title:Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('Precautions'),
            icon: Icon(Icons.local_hospital),
          ),
//          BottomNavigationBarItem(
//            title:Text('FAQ'),
//            icon:Icon(Icons.question_answer),
//          ),
        ],
      ),
    );
  }
}