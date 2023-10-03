import 'dart:convert';

List<LocationModel> locationModelFromJson(String str) =>
    List<LocationModel>.from(
        json.decode(str).map((x) => LocationModel.fromJson(x)));

String locationModelToJson(List<LocationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationModel {
  final String id;
  final String propinsi;
  final String kota;
  final String kecamatan;
  final String lat;
  final String lon;

  LocationModel({
    required this.id,
    required this.propinsi,
    required this.kota,
    required this.kecamatan,
    required this.lat,
    required this.lon,
  });

  LocationModel copyWith({
    String? id,
    String? propinsi,
    String? kota,
    String? kecamatan,
    String? lat,
    String? lon,
  }) =>
      LocationModel(
        id: id ?? this.id,
        propinsi: propinsi ?? this.propinsi,
        kota: kota ?? this.kota,
        kecamatan: kecamatan ?? this.kecamatan,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
      );

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        propinsi: json["propinsi"],
        kota: json["kota"],
        kecamatan: json["kecamatan"],
        lat: json["lat"],
        lon: json["lon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "propinsi": propinsi,
        "kota": kota,
        "kecamatan": kecamatan,
        "lat": lat,
        "lon": lon,
      };
}
