import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid19/color.dart';
import 'package:covid19/network.dart';
import 'covid19.dart';

class CovidDunia extends StatefulWidget {
  @override
  _CovidDuniaAppState createState() => _CovidDuniaAppState();
}

class _CovidDuniaAppState extends State<CovidDunia> {
  Future data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getData();
    data.then((value) => {print(value[0]['name'])});
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      endDrawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage('assets/image/bg.png'),
                    fit: BoxFit.cover),
              ),
              alignment: Alignment.bottomLeft,
              child: Text('Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => CoronaVirusApp(),
                ));
              },
              leading: Icon(
                Icons.home,
                size: 35,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => CovidDunia(),
                ));
              },
              leading: Icon(
                Icons.article,
                size: 35,
              ),
              title: Text(
                "Artikel",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset('assets/image/bg.png'),
          Positioned(
            top: 85,
            right: 0,
            child: Image.asset('assets/image/main.png'),
          ),
          Positioned(
            top: 80,
            left: 20,
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
          ListView(
            children: [
              SizedBox(
                height: 176,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: defaultMargin,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(defaultRadius),
                  ),
                  color: Color(0xffF8F8F8),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Artikel Covid 19',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(height: 4),
                                Text('Terakhir di update : $formattedDate WIB',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(height: 10),
                                Container(
                                  width: 350,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3))
                                      ]),
                                  padding: EdgeInsets.all(25),
                                  child: new RichText(
                                    text: new TextSpan(
                                      children: [
                                        new TextSpan(
                                          text: "Panduan Isolasi Mandiri",
                                          style: new TextStyle(
                                            fontSize: 23,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          recognizer: new TapGestureRecognizer()
                                            ..onTap = () {
                                              launch(
                                                  'https://kawalcovid19.id/content/1933/panduan-isolasi-mandiri');
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  width: 350,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3))
                                      ]),
                                  padding: EdgeInsets.all(25),
                                  child: new RichText(
                                    text: new TextSpan(
                                      children: [
                                        new TextSpan(
                                          text:
                                              "Cara Isolasi Mandiri Yang Benar",
                                          style: new TextStyle(
                                            fontSize: 23,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          recognizer: new TapGestureRecognizer()
                                            ..onTap = () {
                                              launch(
                                                  'https://kawalcovid19.id/content/1931/cara-isolasi-mandiri-yang-benar');
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text('Informasi Terkini',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                SizedBox(height: 4),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  width: 350,
                                  height: 140,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3))
                                      ]),
                                  padding: EdgeInsets.all(25),
                                  child: new RichText(
                                    text: new TextSpan(
                                      children: [
                                        new TextSpan(
                                          text:
                                              "10 Cara Indonesia Tangguh Melawan COVID-19",
                                          style: new TextStyle(
                                            fontSize: 23,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,

                                          ),
                                          recognizer: new TapGestureRecognizer()
                                            ..onTap = () {
                                              launch(
                                                  'https://kawalcovid19.id/content/1964/10-cara-indonesia-tangguh-melawan-covid-19');
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  width: 350,
                                  height: 140,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3))
                                      ]),
                                  padding: EdgeInsets.all(25),
                                  child: new RichText(
                                    text: new TextSpan(
                                      children: [
                                        new TextSpan(
                                          text:
                                              "Vaksin untuk Penyintas COVID-19, Perlu atau Tidak?",
                                          style: new TextStyle(
                                            fontSize: 23,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,

                                          ),
                                          recognizer: new TapGestureRecognizer()
                                            ..onTap = () {
                                              launch(
                                                  'https://kawalcovid19.id/content/1956/vaksin-untuk-penyintas-covid-19-perlu-atau-tidak');
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future getData() async {
    Network network = Network("https://api.kawalcorona.com/indonesia/");
    return network.fetchData();
  }
}
