// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_daily_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDailyModels _$ForecastDailyModelsFromJson(Map<String, dynamic> json) =>
    ForecastDailyModels(
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      timezone_abbreviation: json['timezone_abbreviation'] as String?,
      timezone: json['timezone'] as String?,
      generationtime_ms: (json['generationtime_ms'] as num?)?.toDouble(),
      elevation: (json['elevation'] as num?)?.toInt(),
      utc_offset_seconds: (json['utc_offset_seconds'] as num?)?.toInt(),
      daily_units: json['daily_units'] == null
          ? null
          : DailyUnitModels.fromJson(
              json['daily_units'] as Map<String, dynamic>),
      daily: json['daily'] == null
          ? null
          : DailyModels.fromJson(json['daily'] as Map<String, dynamic>),
      reason: json['reason'] as String?,
      error: json['error'] as bool?,
    );

Map<String, dynamic> _$ForecastDailyModelsToJson(
        ForecastDailyModels instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.generationtime_ms,
      'utc_offset_seconds': instance.utc_offset_seconds,
      'timezone': instance.timezone,
      'timezone_abbreviation': instance.timezone_abbreviation,
      'elevation': instance.elevation,
      'reason': instance.reason,
      'error': instance.error,
      'daily_units': instance.daily_units,
      'daily': instance.daily,
    };
