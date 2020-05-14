import 'package:file_management/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        Responsive().init(constraints, orientation);
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(title: 'Flutter Demo Home Page'),
        );
      });
    });

  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  double sizing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
        radius: 7.8 * Responsive.widthMultiplier,
        backgroundColor: Color(0xFF63cb99),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Icon(
            Icons.menu,
            color: Colors.grey[700],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: 1.8 * Responsive.imageSizeMultiplier,
              right: 6 * Responsive.imageSizeMultiplier
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.indigo[100],
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.indigo,
                    width: 0.25 * Responsive.imageSizeMultiplier
                )
              ),
              child: Padding(
                padding: EdgeInsets.all(2.6 * Responsive.imageSizeMultiplier),
                child: Icon(
                  Icons.person,
                  color: Colors.indigo,
                  size: 4.5 * Responsive.imageSizeMultiplier,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 6 * Responsive.imageSizeMultiplier,
                left: 6 * Responsive.imageSizeMultiplier,
                right: 6 * Responsive.imageSizeMultiplier,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    "My Files",
                    style: TextStyle(
                      fontSize: 3.4 * Responsive.textMultiplier,
                      color: Colors.grey[500]
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.more_horiz,
                    size: 6 * Responsive.imageSizeMultiplier,
                    color: Colors.grey[500],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 6 * Responsive.heightMultiplier,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 6 * Responsive.imageSizeMultiplier
              ),
              child: Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      _circleChart(40, 83.33, 56.67, color: Colors.indigo[300]),
                      _circleChart(28, 83.33, 56.67, color: Colors.teal[300]),
                      _circleChart(18, 63.33, 36.67, color: Colors.amber[300]),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 42 * Responsive.widthMultiplier,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _filePercent("Photos", "56%", Colors.indigo),
                        _filePercent("Media", "32%", Colors.teal),
                        _filePercent("Documents", "12%", Colors.amber),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5 * Responsive.widthMultiplier,
            )
          ],
        ),
      ),
    );
  }


  Widget _filePercent(String dataName, String dataPercent, Color color) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(3 * Responsive.imageSizeMultiplier),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: color,
                radius: 1 * Responsive.imageSizeMultiplier,
              )
            ],
          ),
        ),
        Text(
          dataName,
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Text(
          dataPercent,
          style: TextStyle(
            color: Colors.grey[600],
            letterSpacing: 0.25,
            fontWeight: FontWeight.w600
          ),
        )
      ],
    );
  }



  Widget _circleChart(double sizing, double complete, double incomplete, { Color color}) {
    return AnimatedCircularChart(
      size: Size(sizing * Responsive.imageSizeMultiplier, 0.0),
      initialChartData: <CircularStackEntry> [
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
              complete,
              color,
              rankKey: 'completed'
            ),
            new CircularSegmentEntry(
                complete,
                Colors.grey[100],
                rankKey: 'completed'
            ),
          ],
          rankKey: 'progress',
        ),
      ],
      chartType: CircularChartType.Radial,
      edgeStyle: SegmentEdgeStyle.round,
      percentageValues: true,
    );
  }
}
