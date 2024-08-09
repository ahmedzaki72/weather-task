

import 'package:weathertask/modules/result/models/city_models/city_models.dart';

abstract class CitySearchStates {}

class CitySearchInitialStates extends CitySearchStates {}

class CitySearchLoadingStates extends CitySearchStates {}

class CitySearchSuccessStates extends CitySearchStates {
  final CityModels? cityModels;

  CitySearchSuccessStates({
    this.cityModels,
  });
}

class CitySearchErrorStates extends CitySearchStates {
  final String? error;
  CitySearchErrorStates({
    this.error,
  });
}
