import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/screens/home/components/section_title.dart';

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/map/map_screen.dart';

import '../../../size_config.dart';

class TimerSection extends StatefulWidget {

  @override
  _TimerSectionState createState() => _TimerSectionState();
}
class _TimerSectionState extends State<TimerSection> {

  int second = 0;
  int minute = 10;
  bool isStart = false;
  bool isFinish = false;
  void _startTimer() {
    final timeout = const Duration(seconds: 1);
    if(!isStart) {
      Timer.periodic(timeout, (timer) async {
        print('---- in timer ----');
        print(second.toString());
        print(' : ' + minute.toString());
        if ((second > 0 || minute > 0)) {
          isStart = true;
          if (second == 0) {
            minute --;
            second = 60;
          }
          second --;
        }
        else {
          timer.cancel();
          timer = null;
          await Fluttertoast.showToast(msg: '取貨時間過期');
          Navigator.pop(context);
          isFinish = true;
          // setState(() {
          // });
        }
        setState(() {
        });
      });
    }
  }

  Future<void> _showMyDialog() async {
    print('in show');
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // Countdown countdown;
    // countdown._start();

    // if(isFinish) {
    //   _showMyDialog();
    // }
    _startTimer();
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text('pause'),
            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
              child: SectionTitle(title: "剩餘取貨時間"),
            ),
            Text(
              '${minute} : ${second}',
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            ),
          ],
    );
  }
}