// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherModels _$CurrentWeatherModelsFromJson(
        Map<String, dynamic> json) =>
    CurrentWeatherModels(
      interval: (json['interval'] as num?)?.toInt(),
      is_day: (json['is_day'] as num?)?.toInt(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      time: json['time'] as String?,
      weathercode: (json['weathercode'] as num?)?.toInt(),
      winddirection: (json['winddirection'] as num?)?.toInt(),
      windspeed: (json['windspeed'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrentWeatherModelsToJson(
        CurrentWeatherModels instance) =>
    <String, dynamic>{
      'time': instance.time,
      'interval': instance.interval,
      'temperature': instance.temperature,
      'windspeed': instance.windspeed,
      'winddirection': instance.winddirection,
      'is_day': instance.is_day,
      'weathercode': instance.weathercode,
    };
