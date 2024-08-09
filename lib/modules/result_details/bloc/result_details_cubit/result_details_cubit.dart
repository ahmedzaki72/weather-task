import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:weathertask/main.dart';
import 'package:weathertask/modules/result_details/bloc/result_details_cubit/result_details_states.dart';
import 'package:weathertask/modules/result_details/repo/result_details_repo.dart';

ResultDetailsCubit get resultDetailsCubit =>
    ResultDetailsCubit.get(navigationKey.currentContext!);

class ResultDetailsCubit extends Cubit<ResultDetailsStates> {
  final _resultDetailsRepo = ResultDetailsRepo();
  ResultDetailsCubit() : super(ResultDetailsInitialStates());
  static ResultDetailsCubit get(context) => BlocProvider.of(context);

  Future<void> resultDetails({
    double? lat,
    double? long,
  }) async {
    emit(ResultDetailsLoadingStates());
    try {
      final response = await _resultDetailsRepo.repo(
        lat: lat,
        long: long,
      );
      if (response.latitude != null) {
        // Logger().wtf(response);
        emit(
          ResultDetailsSuccessStates(forecastDailyModels: response),
        );
      } else {
        emit(
          ResultDetailsErrorStates(
            error: "Not Found",
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      emit(
        ResultDetailsErrorStates(
          error: e.toString(),
        ),
      );
    }
  }
}
