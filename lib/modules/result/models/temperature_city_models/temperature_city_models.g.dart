// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_city_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureCityModels _$TemperatureCityModelsFromJson(
        Map<String, dynamic> json) =>
    TemperatureCityModels(
      elevation: (json['elevation'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      generationtime_ms: (json['generationtime_ms'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      timezone_abbreviation: json['timezone_abbreviation'] as String?,
      utc_offset_seconds: (json['utc_offset_seconds'] as num?)?.toInt(),
      current_weather: json['current_weather'] == null
          ? null
          : CurrentWeatherModels.fromJson(
              json['current_weather'] as Map<String, dynamic>),
      current_weather_units: json['current_weather_units'] == null
          ? null
          : CurrentWeatherUnitModels.fromJson(
              json['current_weather_units'] as Map<String, dynamic>),
      hourly: json['hourly'] == null
          ? null
          : HourlyModels.fromJson(json['hourly'] as Map<String, dynamic>),
      hourly_units: json['hourly_units'] == null
          ? null
          : HourlyUnitsModels.fromJson(
              json['hourly_units'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemperatureCityModelsToJson(
        TemperatureCityModels instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.generationtime_ms,
      'utc_offset_seconds': instance.utc_offset_seconds,
      'timezone': instance.timezone,
      'timezone_abbreviation': instance.timezone_abbreviation,
      'elevation': instance.elevation,
      'current_weather_units': instance.current_weather_units,
      'current_weather': instance.current_weather,
      'hourly': instance.hourly,
      'hourly_units': instance.hourly_units,
    };
