import 'package:app_doa/pages/hadis_page.dart';
import 'package:app_doa/pages/haji_page.dart';
import 'package:app_doa/pages/quran_page.dart';
import 'package:app_doa/pages/harian_page.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../tema.dart';

class BerandaPage extends StatefulWidget {
  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange[50],
        title: Text(
          "APLIKASI DOA MUSLIM",
          style: popinsTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: Colors.blue[900]),
        ),
        actions: [
          TextButton(
            onPressed: () => exit(0),
            child: Text(
              "Exit",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.blue[100],
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HarianPage(),
                )),
                splashColor: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/doa.jpg',
                      width: 150,
                      height: 100,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "DOA SEHARI-HARI",
                      style: oswaldTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => QuranPage(),
                )),
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        'assets/quran.jpg',
                        width: 150,
                        height: 100,
                      ),
                      Text(
                        "DOA DARI AL-QURAN",
                        style: oswaldTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const HadisPage(),
                )),
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        'assets/hadits.jpg',
                        width: 150,
                        height: 100,
                      ),
                      Text(
                        "DOA DARI HADITS",
                        style: oswaldTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const HajiPage(),
                )),
                splashColor: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        'assets/haji.jpg',
                        width: 150,
                        height: 100,
                      ),
                      Text(
                        "DOA HAJI/UMROH",
                        style: oswaldTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
