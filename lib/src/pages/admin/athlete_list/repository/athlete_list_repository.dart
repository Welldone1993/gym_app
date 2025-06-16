import 'package:either_dart/either.dart';

import '../../../../infrastructures/commons/repository_url.dart';
import '../../../../infrastructures/utils/dio_handler.dart';
import '../models/view_model/athlete_list_view_model.dart';

class AddAthleteRepository {
  final DioHandler _dioHandler = DioHandler();

  Future<Either<String, List<AthleteListViewModel>>> getAllAthletes() async {
    final response = await _dioHandler.get(RepositoryUrls.getAllUsers);

    return response.fold(
      (left) => Left(response.left),
      (right) => Right(
        (right.data['elements'] as List)
            .map((e) => AthleteListViewModel.fromJson(e))
            .toList(),
      ),
    );
  }
}
