import 'package:flutter_basico/models/movie_model.dart';
import 'package:flutter_basico/repositories/movies_repository.dart';
import 'package:flutter_basico/service/dio_service.dart';
import 'package:flutter_basico/utils/api.utils.dart';

class MoviesRepositoryImp implements MoviesRepository {
  final DioService _dioService;

  MoviesRepositoryImp({required DioService dioService})
    : _dioService = dioService;

  @override
  Future<MoviePage?> getMovies() async {
    await Future.delayed(Duration(seconds: 3));
    try {
      var resultDio = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
      return MoviePage.fromJson(resultDio.data);
    } catch (e) {
      return null;
    }
  }
}
