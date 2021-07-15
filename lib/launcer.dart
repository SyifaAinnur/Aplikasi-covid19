import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import './pages/covid19.dart';

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => new _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }
  startLaunching() async {
    var duration = const Duration(seconds: 5);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        return new CoronaVirusApp() ;
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            image: DecorationImage(
              image: AssetImage('assets/image/bg.png'),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Center(
              child: Text(
              'Covid 19 \nTracker',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
              ),
          ],
        ),
      ),
    );
  }
}