import 'package:flutter/foundation.dart';
import 'package:flutter_basico/models/movie_model.dart';
import 'package:flutter_basico/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository movieRepository;
  ValueNotifier<MoviePage?> movies = ValueNotifier<MoviePage?>(null);

  MovieController(this.movieRepository) {
    fetch();
  }

  fetch() async {
    movies.value = await movieRepository.getMovies();
  }
}
