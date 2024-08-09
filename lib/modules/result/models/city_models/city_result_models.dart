import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weathertask/modules/result/models/temperature_city_models/temperature_city_models.dart';

part 'city_result_models.g.dart';

@JsonSerializable()
class CityResultModels extends Equatable {
  final int? id;
  final String? name;
  final double? latitude;
  final double? longitude;
  final int? elevation;
  final String? feature_code;
  final String? country_code;
  final int? admin1_id;
  final int? admin2_id;
  final String? timezone;
  final int? population;
  final List<String>? postcodes;
  final int? country_id;
  final String? country;
  final String? admin1;
  final String? admin2;
  TemperatureCityModels? weatherData;

  CityResultModels({
    this.name,
    this.country_code,
    this.id,
    this.country,
    this.longitude,
    this.latitude,
    this.admin1,
    this.admin1_id,
    this.admin2,
    this.admin2_id,
    this.country_id,
    this.elevation,
    this.feature_code,
    this.population,
    this.postcodes,
    this.timezone,
    this.weatherData,
  });

  factory CityResultModels.fromJson(Map<String, dynamic> json) {
    return _$CityResultModelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CityResultModelsToJson(this);

  @override
  List<Object?> get props => [
        name,
        country_code,
        id,
        country,
        longitude,
        latitude,
        admin1,
        admin1_id,
        admin2,
        admin2_id,
        country_id,
        elevation,
        feature_code,
        population,
        postcodes,
        timezone,
        weatherData,
      ];
}
