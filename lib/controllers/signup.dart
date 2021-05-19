import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/Account.dart';
import 'package:shop_app/server_config.dart';

Server server;

Future<String> sendUserAccount(String email, String password, String name, String birthday) async {
  final res = await http.post(
    Uri.http('192.168.1.191:3000' , 'user/signup'),
    headers: <String, String> {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String> {
      'email': email,
      'password': password,
      'name': name,
      'birthday': birthday,
    }),
  ).timeout(const Duration(seconds: 5));

  print(res.body);
  if (res.body == 'added') {
    return 'ok';
  } else {
    return res.body;
  }
}

Future<String> Signin(String email, String password) async {
  try {
    final res = await http.post(
      Uri.http('192.168.1.191:3000', 'user/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    print(res.body);
    if (res.body == 'INVALID') {
      return 'INVALID';
    } else {
      return res.body;
    }
  } on TimeoutException catch (_) {
    print('timeout');
    return 'Timeout';
  }
}