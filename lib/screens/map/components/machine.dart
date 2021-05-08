import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Machine {
  final String id;
  final LatLng latLng;
  final String name;
  final String description;

  // ignore: sort_constructors_first
  const Machine({
    @required this.id,
    @required this.latLng,
    @required this.name,
    this.description
  })  :   assert(id != null),
          assert(latLng != null),
          assert(name != null);

  double get latitude => latLng.latitude;
  double get longitude => latLng.longitude;

  Machine copyWith({
    String id,
    LatLng latLng,
    String name,
    String description,
  }) {
      return Machine(
        id: id ?? this.id,
        latLng: latLng ?? this.latLng,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  }

  factory Machine.fromJson(Map<String, dynamic> json) {
    // LatLng json_latlng = ();
    return Machine(
      id: json['id'],
      latLng: LatLng.fromJson(json['latlng']),
      name: json['name'],
      description: json['description']
    );
  }
}