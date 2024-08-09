// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_unit_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherUnitModels _$CurrentWeatherUnitModelsFromJson(
        Map<String, dynamic> json) =>
    CurrentWeatherUnitModels(
      interval: json['interval'] as String?,
      is_day: json['is_day'] as String?,
      temperature: json['temperature'] as String?,
      time: json['time'] as String?,
      weathercode: json['weathercode'] as String?,
      winddirection: json['winddirection'] as String?,
      windspeed: json['windspeed'] as String?,
    );

Map<String, dynamic> _$CurrentWeatherUnitModelsToJson(
        CurrentWeatherUnitModels instance) =>
    <String, dynamic>{
      'time': instance.time,
      'interval': instance.interval,
      'temperature': instance.temperature,
      'windspeed': instance.windspeed,
      'winddirection': instance.winddirection,
      'is_day': instance.is_day,
      'weathercode': instance.weathercode,
    };
