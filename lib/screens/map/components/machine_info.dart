import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'machine.dart';


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