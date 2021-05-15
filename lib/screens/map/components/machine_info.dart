import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'machine.dart';
import 'package:http/http.dart' as http;

class MachineInfo {
  static const List<Machine> machines = [
    Machine(
      id: '1',
      latLng: LatLng(23.901795565147076, 121.5409220354607),
      name: '1_NDHU',
      description: 'No 1 machine'
    ),
    Machine(
        id: '2',
        latLng: LatLng(23.892946073360573, 121.53660884449597),
        name: '2_NDHU',
        description: 'No 2 machine'
    ),
  ];
}


Future<List<Machine>> fetchMachineInfo() async {
  // List<Machine> machines
  final response = await http.get(Uri.http('192.168.1.193:3000', 'mobile/location'));
  if (response.statusCode == 200) {
    print(response.body);
    // return Machine.fromJson(jsonDecode(response.body.dart));
    return (jsonDecode(response.body) as List).map((m) => Machine.fromJson(m)).toList();
  } else {
    throw Exception('Fail to load Machine information');
  }
}