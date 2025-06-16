import 'package:either_dart/either.dart';

import '../../../../infrastructures/commons/repository_url.dart';
import '../../../../infrastructures/utils/dio_handler.dart';
import '../models/dto/add_athlete_dto.dart';

class AddAthleteRepository {
  final DioHandler _dioHandler = DioHandler();

  Future<Either<String, dynamic>> addAthlete({
    required AddAthleteDto dto,
  }) async {
    final response = await _dioHandler.post(
      RepositoryUrls.addAthlete,
      data: dto.toJson(),
    );

    return response.fold(
      (left) => Left(response.left),
      (right) => Right(response.right),
    );
  }
}
