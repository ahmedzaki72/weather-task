import 'package:weathertask/config/config_base.dart';
import 'package:weathertask/config/global_variable.dart';
import 'package:weathertask/helper/network_serviecs.dart';
import 'package:weathertask/modules/result/models/city_models/city_models.dart';
import 'package:weathertask/modules/result/models/city_models/city_result_models.dart';
import 'package:weathertask/modules/result/repo/temperature_city_repo.dart';

class CitySearchRepo {
  final _dio = NetworkService();
  final _temperatureRepo = TemperatureCityRepo();

  Future<CityModels> repo({
    String? cityName,
  }) async {
    try {
      final request = await _dio.getWithoutBaseUrl(
        url:
            "${ConfigBase.baseUrlGeo}search?name=$cityName&count=10&language=$langCode&format=json",
      );
      if (request.statusCode == 200) {
        CityModels? cityModels;
        cityModels = CityModels.fromJson(request!.data);
        await getCityModelsData(result: cityModels.results);
        cityModels.success = true;
        cityModels.message = "success to fetching data";
        return cityModels;
      } else {
        CityModels? cityModels;
        cityModels = CityModels.fromJson(request.data);
        return cityModels;
      }
    } catch (e) {
      print(e.toString());
      return CityModels(reason: e.toString());
    }
  }

  Future<void> getCityModelsData({List<CityResultModels>? result}) async {
    if (result != null) {
      for (var e in result) {
        var data =
            await _temperatureRepo.repo(lat: e.latitude, long: e.longitude);
        e.weatherData = data;
      }
    }
  }
}
