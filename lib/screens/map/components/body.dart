import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/machine/machine_screen.dart';
import 'locations.dart' as locations;
import 'machine_info.dart';


class Body extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

// void _pushProductScreen(locations.Office office) {
//   assert(office != null);
//
//   Navigator.push<void>(
//     context,
//
//   )
// }

class _MapState extends State<Body> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final machines = MachineInfo.machines;
    print(machines);
    //final machines_info = await getMachineInfo();
    // final machines_info = await fetchMachineInfo();
    // print(machines_info);
    setState(() {
      _markers.clear();
      for (final machine in machines) {
        final marker = Marker(
          markerId: MarkerId(machine.id),
          position: LatLng(machine.latitude, machine.longitude),
          infoWindow: InfoWindow(
            title: machine.name,
            snippet: machine.description,
            onTap: () => Navigator.pushNamed(context, MachineScreen.routeName, arguments: {'id': machine.id})
          ),
        );
        _markers[machine.name] = marker;
      }
    });
  }

  /*
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();

    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        log(office.name);
        log(office.lat.toString());
        log(office.lng.toString());
        log(office.address);
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
            onTap: () => Navigator.pushNamed(context, HomeScreen.routeName)
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }
   */


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('選擇地點'),
          backgroundColor: Colors.blueGrey,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            // TODO: set initialCameraPosition to users current location
            target: const LatLng(23.892946073360573, 121.53660884449597),
            zoom: 15,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );

  }
}
