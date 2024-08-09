import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weathertask/modules/result/models/city_models/city_result_models.dart';

part 'city_models.g.dart';

@JsonSerializable()
class CityModels extends Equatable {
  bool success;
  String message;
  final String? reason;
  final bool? error;
  final double? generationtime_ms;
  final List<CityResultModels>? results;

  CityModels({
    this.message = "error ot get Result data",
    this.success = false,
    this.results,
    this.generationtime_ms,
    this.error,
    this.reason,
  });

  factory CityModels.fromJson(Map<String, dynamic> json) {
    return _$CityModelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CityModelsToJson(this);

  @override
  List<Object?> get props => [
        message,
        success,
        results,
        generationtime_ms,
        error,
        reason,
      ];
}
