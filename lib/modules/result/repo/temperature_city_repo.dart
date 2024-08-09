import 'package:weathertask/config/config_base.dart';
import 'package:weathertask/helper/network_serviecs.dart';
import 'package:weathertask/modules/result/models/temperature_city_models/temperature_city_models.dart';

class TemperatureCityRepo {
  final _dio = NetworkService();

  Future<TemperatureCityModels> repo({
    double? lat,
    double? long,
  }) async {
    try {
      final request = await _dio.get(
        url:
            "${ConfigBase.temperature}?latitude=$lat&longitude=$long&current_weather=true",
      );
      // Logger().wtf(request.data);
      TemperatureCityModels? temperatureCityModels;
      if (request.statusCode == 200) {
        temperatureCityModels = TemperatureCityModels.fromJson(request.data);
      } else {
        temperatureCityModels = TemperatureCityModels.fromJson(request.data);
      }
      return temperatureCityModels;
    } catch (e) {
      print(e.toString());
      return TemperatureCityModels();
    }
  }
}
