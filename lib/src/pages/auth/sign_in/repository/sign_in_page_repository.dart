import 'package:either_dart/either.dart';

import '../../../../infrastructures/commons/repository_url.dart';
import '../../../../infrastructures/utils/dio_handler.dart';
import '../model/sign_in_dto.dart';

class SignInPageRepository {
  final DioHandler _dioHandler = DioHandler(isLoggedIn: false);

  Future<Either<String, dynamic>> signIn({
    required SingInDto dto,
  }) async {
    final response = await _dioHandler.post(
      RepositoryUrls.signIn,
      data: dto.toJson(),
    );

    return response.fold(
      (left) => Left(response.left),
      (right) => Right(response.right),
    );
  }
}
