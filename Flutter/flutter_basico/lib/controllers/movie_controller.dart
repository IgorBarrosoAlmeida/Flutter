import 'package:flutter/foundation.dart';
import 'package:flutter_basico/models/movie_model.dart';
import 'package:flutter_basico/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository movieRepository;
  ValueNotifier<MoviePage?> movies = ValueNotifier<MoviePage?>(null);
  MoviePage? _cachedMovies;

  void searchMovies(String query) {
    List<Movie> search =
        _cachedMovies!.movieList
            .where(
              (e) => e.toString().toLowerCase().contains((query.toLowerCase())),
            )
            .toList();

    movies.value = movies.value!.copyWith(movieList: search);
  }

  MovieController(this.movieRepository) {
    fetch();
  }

  fetch() async {
    movies.value = await movieRepository.getMovies();
    _cachedMovies = movies.value;
  }
}
