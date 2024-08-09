import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hourly_units_models.g.dart';

@JsonSerializable()
class HourlyUnitsModels extends Equatable {
  final String? time;
  final String? temperature_2m;
  final String? weather_code;

  const HourlyUnitsModels({
    this.time,
    this.temperature_2m,
    this.weather_code,
  });

  factory HourlyUnitsModels.fromJson(Map<String, dynamic> json) {
    return _$HourlyUnitsModelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HourlyUnitsModelsToJson(this);

  @override
  List<Object?> get props => [
        time,
        temperature_2m,
        weather_code,
      ];
}
