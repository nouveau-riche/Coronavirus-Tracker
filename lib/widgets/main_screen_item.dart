import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import '../providers/corona_data.dart';
import '../models/indicator.dart';


class PieChartSample extends StatefulWidget {
  @override
  PieChartSampleState createState() => PieChartSampleState();
}

class PieChartSampleState extends State<PieChartSample> {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {

    return AspectRatio(
      aspectRatio: 380/200,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 26),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width:MediaQuery.of(context).size.width*0.55,
                child: PieChart(
                      PieChartData(
                          pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                            setState(() {
                              if (pieTouchResponse.touchInput is FlLongPressEnd ||
                                  pieTouchResponse.touchInput is FlPanEnd) {
                                touchedIndex = -1;
                              } else {
                                touchedIndex = pieTouchResponse.touchedSectionIndex;
                              }
                            });
                          }),
                          startDegreeOffset: 180,
                          borderData: FlBorderData(
                            show: false,
                          ),
                         sectionsSpace: 10,
                          centerSpaceRadius: 0,
                          sections: showingSections()),
                    ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Indicator(
                  color: const Color(0xff0293ee),
                  text: 'Confirmed',
                  size: touchedIndex == 0 ? 18 : 16,
                 textColor: touchedIndex == 0 ? Colors.black : Colors.grey,
                ),
                  Indicator(
                    color: const Color(0xfff8b250),
                    text: 'Recovered',
                    size: touchedIndex == 1 ? 18 : 16,
                    textColor: touchedIndex == 1 ? Colors.black : Colors.grey,
                  ),
                  Indicator(
                    color: const Color(0xff845bef),
                    text: 'Death',
                    size: touchedIndex == 2 ? 18 : 16,
                    textColor: touchedIndex == 2 ? Colors.black : Colors.grey,
                  ),
                  Indicator(
                    color: const Color(0xff13d38e),
                    text: 'Ongoing',
                    size: touchedIndex == 3 ? 18 : 16,
                    textColor: touchedIndex == 3 ? Colors.black : Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }

  List<PieChartSectionData> showingSections() {
    final wholeData = Provider.of<Data>(context);
    wholeData.fetchData();
    return List.generate(
      4,
          (i) {
        final isTouched = i == touchedIndex;
        final double opacity = isTouched ? 1 : 0.6;
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: const Color(0xff0293ee).withOpacity(opacity),
              value: 1837785,
              title: '',
              radius: 80,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff044d7c)),
              titlePositionPercentageOffset: 0.55,
            );
          case 1:
            return PieChartSectionData(
              color: const Color(0xfff8b250).withOpacity(opacity),
              value: 421515,
              title: '',
              radius: 80,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff90672d)),
              titlePositionPercentageOffset: 0.55,
            );
          case 2:
            return PieChartSectionData(
              color: const Color(0xff845bef).withOpacity(opacity),
              value: 113312,
              title: '',
              radius: 80,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
            );
          case 3:
            return PieChartSectionData(
              color: const Color(0xff13d38e).withOpacity(opacity),
              value: 1302958,
              title: '',
              radius: 80,
              titleStyle: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xff0c7f55)),
              titlePositionPercentageOffset: 0.55,
            );
          default:
            return null;
        }
      },
    );
  }
}

class ShowNumbers extends StatelessWidget{

  Widget buildContainer(BuildContext context,Color color,String title, List wholeData,int i){
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [color,color.withOpacity(0.6)],
            begin:Alignment.topLeft,
            end:Alignment.bottomRight,
          ),
        ),
        width: MediaQuery.of(context).size.width*0.4,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Text(title,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height:20),
              Text(wholeData.length !=0 ? wholeData[i].toString() : 0.toString() ,
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900),),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context){

    final wholeData = Provider.of<Data>(context);
    wholeData.fetchData();
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildContainer(context,Colors.blue,'Confirmed', wholeData.worldData ,0),
                buildContainer(context,Colors.orangeAccent,'Recovered', wholeData.worldData ,2),
              ],
            ),
            SizedBox(height:10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                  Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                       gradient: LinearGradient(
                      colors: [Colors.greenAccent,Colors.greenAccent.withOpacity(0.6)],
                      begin:Alignment.topLeft,
                      end:Alignment.bottomRight,
                           ),
                         ),
                        width: MediaQuery.of(context).size.width*0.4,
                        height: 100,
                         child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Text('Ongoing',textAlign: TextAlign.center,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                              SizedBox(height:20),
                             Text(wholeData.worldData.length != 0 ? '${wholeData.worldData[0]-wholeData.worldData[1]-wholeData.worldData[2]}': 0.toString(),
                               style: TextStyle(fontSize: 16,fontWeight: FontWeight.w900),),
                           ],
                         ),
                        ),
                      ),
                   ),
                buildContainer(context,Colors.deepPurpleAccent,'Death', wholeData.worldData ,1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



