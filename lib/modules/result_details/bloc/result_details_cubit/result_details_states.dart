import 'package:weathertask/modules/result/models/temperature_city_models/temperature_city_models.dart';
import 'package:weathertask/modules/result_details/models/forecast_daily_models/forecast_daily_models.dart';

abstract class ResultDetailsStates {}

class ResultDetailsInitialStates extends ResultDetailsStates {}

class ResultDetailsLoadingStates extends ResultDetailsStates {}

class ResultDetailsSuccessStates extends ResultDetailsStates {
  final ForecastDailyModels? forecastDailyModels;

  ResultDetailsSuccessStates({
    this.forecastDailyModels,
  });
}

class ResultDetailsErrorStates extends ResultDetailsStates {
  final String? error;
  ResultDetailsErrorStates({
    this.error,
  });
}
