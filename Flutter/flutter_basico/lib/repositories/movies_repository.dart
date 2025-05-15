import 'package:flutter_basico/models/movie_model.dart';

abstract class MoviesRepository {
  Future<MoviePage?> getMovies();
}
