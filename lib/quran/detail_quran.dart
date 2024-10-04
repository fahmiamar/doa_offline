// ignore_for_file: prefer_const_constructors, unnecessary_new, depend_on_referenced_packages, library_private_types_in_public_api

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:app_doa/pages/quran_page.dart';
import 'package:app_doa/tema.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';

class DetailDataQuran extends StatefulWidget {
  final List list;
  final int index;
  const DetailDataQuran({super.key, required this.list, required this.index});

  @override
  _DetailDataQuranState createState() => _DetailDataQuranState();
}

class _DetailDataQuranState extends State<DetailDataQuran> {
  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          "DOA HARIAN",
          style: oswaldTextStyle.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
              builder: (BuildContext context) => new QuranPage(),
            )),
            child: Text(
              "Back",
              style: oswaldTextStyle.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
        backgroundColor: Colors.blue.shade500,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 20, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: new Icon(
                Icons.print,
                color: Colors.white,
              ),
              onPressed: () {
                listPdf();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Padding(
                  padding: new EdgeInsets.only(top: 30.0, bottom: 15.0)),
              Card(
                color: Colors.blue.shade50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 15),
                      Text(
                        widget.list[widget.index].doa,
                        style: oswaldTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: blackColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        widget.list[widget.index].ayat,
                        textAlign: TextAlign.right,
                        style: amiriTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 2,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        widget.list[widget.index].artinya,
                        style: popinsTextStyle.copyWith(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 15.0)),
              new Padding(padding: const EdgeInsets.all(5.0)),
            ],
          ),
        ]),
      ),
    );
  }

  void listPdf() async {
    final oswald = await rootBundle.load("assets/fonts/Oswald-W.ttf");
    final fontOswald = pw.Font.ttf(oswald);
    final poppins = await rootBundle.load("assets/fonts/Poppins-Regular.ttf");
    final fontPoppin = pw.Font.ttf(poppins);
    final amiri = await rootBundle.load("assets/fonts/Amiri-Regular.ttf");
    final fontAmiri = pw.Font.ttf(amiri);
    final pdf = pw.Document();
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a6,
        margin: pw.EdgeInsets.all(0),
        build: (context) {
          return [
            pw.Center(
              child: pw.Column(
                children: [
                  pw.Text(
                    widget.list[widget.index].doa,
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontSize: 17,
                      fontWeight: pw.FontWeight.bold,
                      font: fontOswald,
                    ),
                  ),
                  pw.SizedBox(height: 15),
                  pw.Text(
                    widget.list[widget.index].ayat,
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontSize: 17,
                      fontWeight: pw.FontWeight.bold,
                      font: fontAmiri,
                    ),
                  ),
                  pw.Text(
                    widget.list[widget.index].artinya,
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                      font: fontPoppin,
                    ),
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 20),
          ];
        }));

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/Doa Harian.pdf");

    await file.writeAsBytes(await pdf.save());

    await OpenFile.open(file.path);
  }
}
