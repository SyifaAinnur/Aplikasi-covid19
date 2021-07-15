import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:covid19/color.dart';
import 'package:covid19/network.dart';
import 'artikel.dart';

class CoronaVirusApp extends StatefulWidget {
  @override
  _CoronaVirusAppState createState() => _CoronaVirusAppState();
}

class _CoronaVirusAppState extends State<CoronaVirusApp> {
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
                                Text('Data Terkini Covid 19 Indonesia',
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
                                  height: 130,
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
                                  child: FutureBuilder(
                                    future: data,
                                    builder: (context, AsyncSnapshot snapshot) {
                                      List<Widget> children;
                                      if (snapshot.hasData) {
                                        children = <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              '${snapshot.data[0]["positif"]}',
                                              style: TextStyle(
                                                  fontSize: 55,
                                                  fontWeight: FontWeight.bold,
                                                  color: c7),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text("Terkonfirmasi",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black)),
                                          )
                                        ];
                                      } else {
                                        children = const <Widget>[
                                          SizedBox(
                                            child: CircularProgressIndicator(),
                                            width: 60,
                                            height: 60,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 16),
                                            child: Text('Tunggu Sebentar'),
                                          )
                                        ];
                                      }
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: children,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  width: 350,
                                  height: 130,
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
                                  child: FutureBuilder(
                                    future: data,
                                    builder: (context, AsyncSnapshot snapshot) {
                                      List<Widget> children;
                                      if (snapshot.hasData) {
                                        children = <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              '${snapshot.data[0]["sembuh"]}',
                                              style: TextStyle(
                                                  fontSize: 55,
                                                  fontWeight: FontWeight.bold,
                                                  color: c8),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text("Sembuh",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black)),
                                          )
                                        ];
                                      } else {
                                        children = const <Widget>[
                                          SizedBox(
                                            child: CircularProgressIndicator(),
                                            width: 60,
                                            height: 60,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 16),
                                            child: Text('Tunggu Sebentar'),
                                          )
                                        ];
                                      }
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: children,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  width: 350,
                                  height: 130,
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
                                  child: FutureBuilder(
                                    future: data,
                                    builder: (context, AsyncSnapshot snapshot) {
                                      List<Widget> children;
                                      if (snapshot.hasData) {
                                        children = <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              '${snapshot.data[0]["dirawat"]}',
                                              style: TextStyle(
                                                  fontSize: 55,
                                                  fontWeight: FontWeight.bold,
                                                  color: c9),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text("Dalam Perawatan",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black)),
                                          )
                                        ];
                                      } else {
                                        children = const <Widget>[
                                          SizedBox(
                                            child: CircularProgressIndicator(),
                                            width: 60,
                                            height: 60,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 16),
                                            child: Text('Tunggu Sebentar'),
                                          )
                                        ];
                                      }
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: children,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  width: 350,
                                  height: 130,
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
                                  child: FutureBuilder(
                                    future: data,
                                    builder: (context, AsyncSnapshot snapshot) {
                                      List<Widget> children;
                                      if (snapshot.hasData) {
                                        children = <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text(
                                              '${snapshot.data[0]["meninggal"]}',
                                              style: TextStyle(
                                                  fontSize: 55,
                                                  fontWeight: FontWeight.bold,
                                                  color: c10),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text("Meninggal",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black)),
                                          )
                                        ];
                                      } else {
                                        children = const <Widget>[
                                          SizedBox(
                                            child: CircularProgressIndicator(),
                                            width: 60,
                                            height: 60,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 16),
                                            child: Text('Tunggu Sebentar'),
                                          )
                                        ];
                                      }
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: children,
                                        ),
                                      );
                                    },
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
