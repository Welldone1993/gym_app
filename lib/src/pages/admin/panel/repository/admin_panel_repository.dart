import 'package:either_dart/either.dart';

import '../../../../infrastructures/commons/repository_url.dart';
import '../../../../infrastructures/utils/dio_handler.dart';
import '../models/dto/add_period_dto.dart';
import '../models/view_model/period_list_view_model.dart';

class AdminPanelRepository {
  final DioHandler _dioHandler = DioHandler();

  Future<Either<String, dynamic>> addPeriod({required AddPeriodDto dto}) async {
    final response = await _dioHandler.post(
      RepositoryUrls.addPeriod,
      data: dto.toJson(),
    );

    return response.fold(
      (left) => Left(response.left),
      (right) => Right(response.right),
    );
  }

  Future<Either<String, PeriodListViewModel>> getAllPeriod() async {
    final response = await _dioHandler.get(RepositoryUrls.getAllPeriod);

    return response.fold(
      (left) => Left(response.left),
      (right) => Right(PeriodListViewModel.fromJson(right.data)),
    );
  }
}
