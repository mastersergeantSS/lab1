import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

final items = List<String>.generate(1000000, (i) => '${i+1}');

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Just a list',
      debugShowCheckedModeBanner: false,
      home: SplashScreen.navigate(
        name: 'assets/splash1.flr',
        next: (context) => BuildList(),
        backgroundColor: Colors.white70,
        until: () => Future.delayed(Duration(seconds: 3)),
        loopAnimation: 'splash',
      ),
    );
  }
}

class BuildList extends StatefulWidget {
  @override
  _BuildListState createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {

  @override 
  Widget build(BuildContext context) {
   return 
    Scaffold(
        appBar: AppBar(
          title: Text('Just a list'),
          backgroundColor: Colors.yellow,
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(6.0),
          itemCount: items.length,
          itemBuilder: (context, i) {
          return Container (
            decoration: BoxDecoration(color: (i.isOdd) ? Color(0xFFCCCCCC): Color(0xFFFFFFFF)),
            child: ListTile(
              title: Text('${items[i]}',
              textScaleFactor: 2.0,),
              trailing: Icon(Icons.directions_bike),
            )
          );
        } 
        )
      );
  }
}



