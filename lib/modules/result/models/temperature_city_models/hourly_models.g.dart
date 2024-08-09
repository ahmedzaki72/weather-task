// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyModels _$HourlyModelsFromJson(Map<String, dynamic> json) => HourlyModels(
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      temperature_2m: (json['temperature_2m'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      weather_code: (json['weather_code'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$HourlyModelsToJson(HourlyModels instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature_2m,
      'weather_code': instance.weather_code,
    };
