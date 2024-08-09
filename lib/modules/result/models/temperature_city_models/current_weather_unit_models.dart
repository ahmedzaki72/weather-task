import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_weather_unit_models.g.dart';

@JsonSerializable()
class CurrentWeatherUnitModels extends Equatable {
  final String? time;
  final String? interval;
  final String? temperature;
  final String? windspeed;
  final String? winddirection;
  final String? is_day;
  final String? weathercode;

  const CurrentWeatherUnitModels({
    this.interval,
    this.is_day,
    this.temperature,
    this.time,
    this.weathercode,
    this.winddirection,
    this.windspeed,
  });

  factory CurrentWeatherUnitModels.fromJson(Map<String, dynamic> json) {
    return _$CurrentWeatherUnitModelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CurrentWeatherUnitModelsToJson(this);

  @override
  List<Object?> get props => [
        interval,
        is_day,
        temperature,
        time,
        weathercode,
        winddirection,
        windspeed,
      ];
}
