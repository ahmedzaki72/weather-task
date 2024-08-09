// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_result_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResultModels _$CityResultModelsFromJson(Map<String, dynamic> json) =>
    CityResultModels(
      name: json['name'] as String?,
      country_code: json['country_code'] as String?,
      id: (json['id'] as num?)?.toInt(),
      country: json['country'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      admin1: json['admin1'] as String?,
      admin1_id: (json['admin1_id'] as num?)?.toInt(),
      admin2: json['admin2'] as String?,
      admin2_id: (json['admin2_id'] as num?)?.toInt(),
      country_id: (json['country_id'] as num?)?.toInt(),
      elevation: (json['elevation'] as num?)?.toInt(),
      feature_code: json['feature_code'] as String?,
      population: (json['population'] as num?)?.toInt(),
      postcodes: (json['postcodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      timezone: json['timezone'] as String?,
      weatherData: json['weatherData'] == null
          ? null
          : TemperatureCityModels.fromJson(
              json['weatherData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityResultModelsToJson(CityResultModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'elevation': instance.elevation,
      'feature_code': instance.feature_code,
      'country_code': instance.country_code,
      'admin1_id': instance.admin1_id,
      'admin2_id': instance.admin2_id,
      'timezone': instance.timezone,
      'population': instance.population,
      'postcodes': instance.postcodes,
      'country_id': instance.country_id,
      'country': instance.country,
      'admin1': instance.admin1,
      'admin2': instance.admin2,
      'weatherData': instance.weatherData,
    };
