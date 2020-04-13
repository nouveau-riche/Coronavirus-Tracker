import 'package:flutter/material.dart';

class PrecautionScreen extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Precautions'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Image.asset('assets/images/precautions.jpg',fit:BoxFit.fill,height: MediaQuery.of(context).size.height*0.9),
      ),
    );
  }
}