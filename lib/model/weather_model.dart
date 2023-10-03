
import 'dart:convert';

List<WeatherModel> weatherModelFromJson(String str) => List<WeatherModel>.from(json.decode(str).map((x) => WeatherModel.fromJson(x)));

String weatherModelToJson(List<WeatherModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeatherModel {
    final DateTime jamCuaca;
    final String kodeCuaca;
    final String cuaca;
    final String humidity;
    final String tempC;
    final String tempF;

    WeatherModel({
        required this.jamCuaca,
        required this.kodeCuaca,
        required this.cuaca,
        required this.humidity,
        required this.tempC,
        required this.tempF,
    });

    WeatherModel copyWith({
        DateTime? jamCuaca,
        String? kodeCuaca,
        String? cuaca,
        String? humidity,
        String? tempC,
        String? tempF,
    }) => 
        WeatherModel(
            jamCuaca: jamCuaca ?? this.jamCuaca,
            kodeCuaca: kodeCuaca ?? this.kodeCuaca,
            cuaca: cuaca ?? this.cuaca,
            humidity: humidity ?? this.humidity,
            tempC: tempC ?? this.tempC,
            tempF: tempF ?? this.tempF,
        );

    factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        jamCuaca: DateTime.parse(json["jamCuaca"]),
        kodeCuaca: json["kodeCuaca"],
        cuaca: json["cuaca"],
        humidity: json["humidity"],
        tempC: json["tempC"],
        tempF: json["tempF"],
    );

    Map<String, dynamic> toJson() => {
        "jamCuaca": jamCuaca.toIso8601String(),
        "kodeCuaca": kodeCuaca,
        "cuaca": cuaca,
        "humidity": humidity,
        "tempC": tempC,
        "tempF": tempF,
    };
}
