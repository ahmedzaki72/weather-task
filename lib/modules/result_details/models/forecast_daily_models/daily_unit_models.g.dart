// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_unit_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyUnitModels _$DailyUnitModelsFromJson(Map<String, dynamic> json) =>
    DailyUnitModels(
      weather_code: json['weather_code'] as String?,
      time: json['time'] as String?,
      temperature_2m_max: json['temperature_2m_max'] as String?,
      temperature_2m_min: json['temperature_2m_min'] as String?,
    );

Map<String, dynamic> _$DailyUnitModelsToJson(DailyUnitModels instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m_max': instance.temperature_2m_max,
      'temperature_2m_min': instance.temperature_2m_min,
      'weather_code': instance.weather_code,
    };
