import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/main_screen_item.dart';
import '../providers/corona_data.dart';


class HomeScreen extends StatelessWidget {

  Future<void> _pullToRefresh(BuildContext context) async {
       final data = Provider.of<Data>(context,listen: false);
         await data.fetchData();
            data.worldData;
    }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      body: RefreshIndicator(
        displacement: 26,
        onRefresh: () => _pullToRefresh(context),
        child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              SizedBox(height:MediaQuery.of(context).size.height*0.04),
              ListTile(
                leading: const Text('Corona Tracker',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),

              ),
                SizedBox(height:MediaQuery.of(context).size.height*0.025),
                Container(
                  width: mq.size.width,
                  child: Column(
                    children: <Widget>[
                      const Text('Covid-19 Global cases',style:TextStyle(fontSize: 20)),
                      SizedBox(height:MediaQuery.of(context).size.height*0.03),
                      PieChartSample(),
                    ],
                  ),
                ),
                SizedBox(height:MediaQuery.of(context).size.height*0.015),
                ShowNumbers(),
                SizedBox(height:MediaQuery.of(context).size.height*0.02),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child:Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text('STAY IN STAY SAFE!',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                              const SizedBox(height:6),
                              const Text('#Let\'s fight this together',style:TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                        Container(
                          child: Image.asset('assets/images/corona.png',width: mq.size.width*0.36,height: 180,),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
        ),
      ),
    ),
    );
  }
}