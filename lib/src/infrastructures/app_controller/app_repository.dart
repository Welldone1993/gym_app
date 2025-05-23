import 'package:either_dart/either.dart';
import '../commons/repository_url.dart';
import '../utils/dio_handler.dart';
import 'user_view_model.dart';

class AppRepository {
  final DioHandler _dioHandler = DioHandler();

  // Future<Either<String, dynamic>> logout() async {
  //   final response = await _dioHandler.get(RepositoryUrls.logout);
  //
  //   return response.fold(
  //     (left) => Left(response.left),
  //     (right) => Right(response.right),
  //   );
  // }

  // Future<Either<String, UserViewModel>> getProfileInfo() async {
  //   final response = await _dioHandler.get(RepositoryUrls.getProfileInfo);
  //
  //   return response.fold(
  //     (left) => Left(response.left),
  //     (right) => Right(
  //       UserViewModel.fromJson(response.right['information']),
  //     ),
  //   );
  // }
}
