// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_units_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyUnitsModels _$HourlyUnitsModelsFromJson(Map<String, dynamic> json) =>
    HourlyUnitsModels(
      time: json['time'] as String?,
      temperature_2m: json['temperature_2m'] as String?,
      weather_code: json['weather_code'] as String?,
    );

Map<String, dynamic> _$HourlyUnitsModelsToJson(HourlyUnitsModels instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature_2m,
      'weather_code': instance.weather_code,
    };
