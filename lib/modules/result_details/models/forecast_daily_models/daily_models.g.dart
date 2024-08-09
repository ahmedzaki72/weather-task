// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyModels _$DailyModelsFromJson(Map<String, dynamic> json) => DailyModels(
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      temperature_2m_max: (json['temperature_2m_max'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      weather_code: (json['weather_code'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      temperature_2m_min: (json['temperature_2m_min'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$DailyModelsToJson(DailyModels instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m_max': instance.temperature_2m_max,
      'temperature_2m_min': instance.temperature_2m_min,
      'weather_code': instance.weather_code,
    };
