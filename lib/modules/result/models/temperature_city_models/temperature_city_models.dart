import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weathertask/modules/result/models/temperature_city_models/current_weather_models.dart';
import 'package:weathertask/modules/result/models/temperature_city_models/current_weather_unit_models.dart';
import 'package:weathertask/modules/result/models/temperature_city_models/hourly_models.dart';
import 'package:weathertask/modules/result/models/temperature_city_models/hourly_units_models.dart';

part 'temperature_city_models.g.dart';

@JsonSerializable()
class TemperatureCityModels extends Equatable {
  final double? latitude;
  final double? longitude;
  final double? generationtime_ms;
  final int? utc_offset_seconds;
  final String? timezone;
  final String? timezone_abbreviation;
  final int? elevation;
  final CurrentWeatherUnitModels? current_weather_units;
  final CurrentWeatherModels? current_weather;
  final HourlyModels? hourly;
  final HourlyUnitsModels? hourly_units;

  TemperatureCityModels({
    this.elevation,
    this.latitude,
    this.longitude,
    this.generationtime_ms,
    this.timezone,
    this.timezone_abbreviation,
    this.utc_offset_seconds,
    this.current_weather,
    this.current_weather_units,
    this.hourly,
    this.hourly_units,
  });

  factory TemperatureCityModels.fromJson(Map<String, dynamic> json) {
    return _$TemperatureCityModelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TemperatureCityModelsToJson(this);

  @override
  List<Object?> get props => [
        elevation,
        latitude,
        longitude,
        generationtime_ms,
        timezone,
        timezone_abbreviation,
        utc_offset_seconds,
        current_weather,
        current_weather_units,
        hourly,
        hourly_units,
      ];
}
