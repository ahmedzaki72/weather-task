import 'package:equatable/equatable.dart';
import 'package:weathertask/modules/result_details/models/forecast_daily_models/daily_models.dart';
import 'package:weathertask/modules/result_details/models/forecast_daily_models/daily_unit_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_daily_models.g.dart';

@JsonSerializable()
class ForecastDailyModels extends Equatable {
  final double? latitude;
  final double? longitude;
  final double? generationtime_ms;
  final int? utc_offset_seconds;
  final String? timezone;
  final String? timezone_abbreviation;
  final int? elevation;
  final String? reason;
  final bool? error;
  final DailyUnitModels? daily_units;
  final DailyModels? daily;

  const ForecastDailyModels({
    this.longitude,
    this.latitude,
    this.timezone_abbreviation,
    this.timezone,
    this.generationtime_ms,
    this.elevation,
    this.utc_offset_seconds,
    this.daily_units,
    this.daily,
    this.reason,
    this.error,
  });

  factory ForecastDailyModels.fromJson(Map<String, dynamic> json) {
    return _$ForecastDailyModelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForecastDailyModelsToJson(this);

  @override
  List<Object?> get props => [
        longitude,
        latitude,
        timezone_abbreviation,
        timezone,
        generationtime_ms,
        elevation,
        utc_offset_seconds,
        daily_units,
        daily,
        reason,
        error,
      ];
}
