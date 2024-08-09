// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModels _$CityModelsFromJson(Map<String, dynamic> json) => CityModels(
      message: json['message'] as String? ?? "error ot get Result data",
      success: json['success'] as bool? ?? false,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => CityResultModels.fromJson(e as Map<String, dynamic>))
          .toList(),
      generationtime_ms: (json['generationtime_ms'] as num?)?.toDouble(),
      error: json['error'] as bool?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$CityModelsToJson(CityModels instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'reason': instance.reason,
      'error': instance.error,
      'generationtime_ms': instance.generationtime_ms,
      'results': instance.results,
    };
