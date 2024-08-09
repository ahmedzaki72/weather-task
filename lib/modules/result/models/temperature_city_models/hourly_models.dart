import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'hourly_models.g.dart';

@JsonSerializable()
class HourlyModels extends Equatable {
  final List<String>? time;
  final List<double>? temperature_2m;
  final List<int>? weather_code;

  const HourlyModels({
    this.time,
    this.temperature_2m,
    this.weather_code,
  });

  factory HourlyModels.fromJson(Map<String, dynamic> json) {
    return _$HourlyModelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HourlyModelsToJson(this);

  @override
  List<Object?> get props => [
        time,
        temperature_2m,
        weather_code,
      ];
}
