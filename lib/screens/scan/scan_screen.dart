import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:shop_app/screens/map/map_screen.dart';


class ScanScreen extends StatefulWidget {
  static String routeName = "/scan";
  @override
  _OCRPageState createState() => _OCRPageState();
}
class _OCRPageState extends State<ScanScreen> {
  int _ocrCamera = FlutterMobileVision.CAMERA_BACK;
  String _text = "TEXT";
  @override
  Widget build(BuildContext context) {
    // _read();
    // Navigator.pushReplacementNamed(context, MapScreen.routeName);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('OCR In Flutter'),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(_text,style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              ),
              Center(
                child: RaisedButton(
                  onPressed: _read,
                  child: Text('Scanning',
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
  Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        camera: _ocrCamera,
        waitTap: true,
        showText: false,
        preview: Size(640, 480),
      );setState(() {
        _text = texts[0].value;
      });
    } on Exception {
      texts.add( OcrText('Failed to recognize text'));
    }
    // Navigator.pushNamed(context, mapScreen.routeName);
  }
}