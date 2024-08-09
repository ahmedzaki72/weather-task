import 'package:logger/logger.dart';
import 'package:weathertask/config/config_base.dart';
import 'package:weathertask/helper/network_serviecs.dart';
import 'package:weathertask/modules/result_details/models/forecast_daily_models/forecast_daily_models.dart';

class ResultDetailsRepo {
  final _dio = NetworkService();

  Future<ForecastDailyModels> repo({
    double? lat,
    double? long,
  }) async {
    try {
      final request = await _dio.get(
        url:
        "${ConfigBase.temperature}?latitude=$lat&longitude=$long&daily=temperature_2m_max,temperature_2m_min,weather_code&timezone=auto",
      );
      ForecastDailyModels? forecastDailyModels;
      if (request.statusCode == 200) {
        forecastDailyModels = ForecastDailyModels.fromJson(request.data);
      } else {
        forecastDailyModels = ForecastDailyModels.fromJson(request.data);
      }
      return forecastDailyModels;
    } catch (e) {
      print(e.toString());
      return ForecastDailyModels();
    }
  }
}