import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class Data with ChangeNotifier{

  List<dynamic> _worldData = [] ;

  Future<void> fetchData() async {
    const url = 'https://coronavirus-19-api.herokuapp.com/all';
    final response = await http.get(url);
    final data = json.decode(response.body) as Map<String, dynamic>;
    print(data);
    final List<dynamic> globalData = [];
    data.forEach((key,value){
      globalData.add(value);
    });
    _worldData = globalData;
    notifyListeners();
  }

  List<dynamic> get worldData{
    return [..._worldData];
  }

}

