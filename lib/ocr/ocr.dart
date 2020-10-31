import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:navft/questionnaire/screens/home_screen.dart';

class OCRPage extends StatefulWidget {
  @override
  _OCRPageState createState() => _OCRPageState();
}

class _OCRPageState extends State<OCRPage> {
  int _ocrCamera = FlutterMobileVision.CAMERA_BACK;
  String _text = "NUMBER WILL APPEAR HERE";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Capture Vehicle Number Plate'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  _text,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: _read,
                  child: Text(
                    'Scanning',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    createCollection(_text, context);
                  },
                  child: Text(
                    'Submit New Vehicle',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createCollection(String reg, BuildContext context) async {
    final databaseReference = Firestore.instance;
    DocumentReference ref = await databaseReference.collection(reg).add({
      "location": GeoPoint(80, 80),
      "time": Timestamp(100, 100),
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                  regNo: reg,
                  docID: ref.documentID,
                )));
  }

  Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        camera: _ocrCamera,
        waitTap: true,
      );
      setState(() {
        _text = texts[0].value;
      });
    } on Exception {
      texts.add(OcrText('Failed to recognize text'));
    }
  }
}
