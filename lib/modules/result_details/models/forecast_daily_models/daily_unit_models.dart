import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';


part 'daily_unit_models.g.dart';

@JsonSerializable()
class DailyUnitModels extends Equatable {
  final String? time;
  final String? temperature_2m_max;
  final String? temperature_2m_min;
  final String? weather_code;

  const DailyUnitModels({
    this.weather_code,
    this.time,
    this.temperature_2m_max,
    this.temperature_2m_min,
  });


  factory DailyUnitModels.fromJson(Map<String, dynamic> json) {
    return _$DailyUnitModelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DailyUnitModelsToJson(this);


  @override
  List<Object?> get props => [
        weather_code,
        time,
        temperature_2m_max,
        temperature_2m_min,
      ];
}
