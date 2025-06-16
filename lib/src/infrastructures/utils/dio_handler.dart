import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:logger/logger.dart';

import '../app_controller/app_controller.dart';

class DioHandler {
  // TODO: make this better for handle logs and try catches
  final Dio _dio;
  final Logger _logger = Logger();
  final String _baseUrl = AppController().fullBaseUrl;

  DioHandler({
    final Map<String, dynamic>? headers,
    final bool isLoggedIn = true,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: AppController().fullBaseUrl,
           headers:
               headers == null && isLoggedIn
                   ? {'Authorization': 'Bearer ${AppController().userToken}'}
                   : headers,
           connectTimeout: const Duration(seconds: 10),
         ),
       ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (isLoggedIn) {
            options.headers['Authorization'] =
                'Bearer ${AppController().userToken}';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401 && isLoggedIn) {
            _logger.w('Token expired, attempting to refresh...');

            final success = await _refreshToken();

            if (success) {
              final requestOptions = error.requestOptions;
              requestOptions.headers['Authorization'] =
                  'Bearer ${AppController().userToken}';
              try {
                final response = await _dio.fetch(requestOptions);
                return handler.resolve(response);
              } catch (e) {
                _logger.e('Retry failed after refresh: $e');
                return handler.reject(error);
              }
            } else {
              _logger.e('Refresh token failed');
            }
          }

          return handler.next(error);
        },
      ),
    );
  }

  /// Example refresh token request (adjust URL and response structure)
  Future<bool> _refreshToken() async {
    try {
      final response = await Dio().post(
        '${AppController().fullBaseUrl}/auth/refresh',
        data: {'refresh_token': AppController().refreshToken},
      );

      final newToken = response.data['access_token'];
      final newRefreshToken = response.data['refresh_token'];

      AppController().setTokens(newToken, newRefreshToken);

      _logger.i('Token refreshed successfully');
      return true;
    } catch (e) {
      _logger.e('Token refresh error: $e');
      return false;
    }
  }

  Future<Either<String, T>> post<T>(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    final path = '$_baseUrl$url';

    try {
      _logger.f('$path\n$data');

      final response = await _dio.post<T>(
        path,
        queryParameters: queryParameters,
        data: data,
      );

      _logger.d(response.statusCode);

      _logger.i((response.data as Map<String, dynamic>));

      return Right((response.data as Map<String, dynamic>) as T);
    } catch (e) {
      _logger.e(e);

      return Left('$e');
    }
  }

  Future<Either<String, T>> get<T>(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    final path = '$_baseUrl$url';

    try {
      _logger.f(path);

      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        data: data,
      );

      _logger.d(response.statusCode);

      _logger.i((response.data as Map<String, dynamic>)['data']);

      return Right((response.data as Map<String, dynamic>)['data'] as T);
    } catch (e) {
      _logger.e(e);

      return Left('$e');
    }
  }

  Future<Either<String, T>> patch<T>(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    final path = '$_baseUrl$url';

    try {
      _logger.f('$path\n$data');

      final response = await _dio.patch<T>(
        path,
        queryParameters: queryParameters,
        data: data,
      );

      _logger.d(response.statusCode);

      _logger.i((response.data as Map<String, dynamic>)['data']);

      return Right((response.data as Map<String, dynamic>)['data'] as T);
    } catch (e) {
      _logger.e(e);

      return Left('$e');
    }
  }

  Future<Either<String, T>> put<T>(
    final String url, {
    final Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    final path = '$_baseUrl$url';

    try {
      _logger.f('$path\n$data');

      final response = await _dio.put<T>(
        path,
        queryParameters: queryParameters,
        data: data,
      );

      _logger.d(response.statusCode);

      _logger.i((response.data as Map<String, dynamic>)['data']);

      return Right((response.data as Map<String, dynamic>)['data'] as T);
    } catch (e) {
      _logger.e(e);

      return Left('$e');
    }
  }

  Future<Either<String, T>> optionRequest<T>(final String url) async {
    final path = '$_baseUrl$url';

    try {
      _logger.f(path);

      final response = await _dio.request<T>(
        path,
        options: Options(method: 'OPTIONS'),
      );

      _logger.d(response.statusCode);

      _logger.i(response.data as T);

      return Right(response.data as T);
    } catch (e) {
      _logger.e(e);

      return Left('$e');
    }
  }
}
