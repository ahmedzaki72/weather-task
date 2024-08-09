import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathertask/main.dart';
import 'package:weathertask/modules/result/bloc/city_search_cubit/city_search_states.dart';
import 'package:weathertask/modules/result/repo/city_search_repo.dart';

CitySearchCubit get citySearchCubit =>
    CitySearchCubit.get(navigationKey.currentContext!);

class CitySearchCubit extends Cubit<CitySearchStates> {
  final _citySearchRepo = CitySearchRepo();
  CitySearchCubit() : super(CitySearchInitialStates());
  static CitySearchCubit get(context) => BlocProvider.of(context);

  Future<void> citySearch({
    String? cityName,
  }) async {
    emit(CitySearchLoadingStates());
    try {
      final response = await _citySearchRepo.repo(
        cityName: cityName,
      );
      if (response.success == true) {
        emit(
          CitySearchSuccessStates(cityModels: response),
        );
      } else {
        emit(
          CitySearchErrorStates(
            error: response.reason!,
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      emit(
        CitySearchErrorStates(
          error: e.toString(),
        ),
      );
    }
  }
}
