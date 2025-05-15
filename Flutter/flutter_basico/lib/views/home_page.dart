import 'package:flutter/material.dart';
import 'package:flutter_basico/controllers/movie_controller.dart';
import 'package:flutter_basico/models/movie_model.dart';
import 'package:flutter_basico/repositories/movies_repository_imp.dart';

import '../service/dio_service_imp.dart' show DioServiceImp;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _movieController = MovieController(
    MoviesRepositoryImp(dioService: DioServiceImp()),
  );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<MoviePage?>(
      valueListenable: _movieController.movies,
      builder: (_, movies, __) {
        if (movies != null) {
          return Scaffold(
            body: ListView.builder(
              itemCount: movies.movieList.length,
              itemBuilder: (_, index) {
                return Text(movies.movieList[index].title);
              },
            ),
          );
        } else {
          return Text("teste");
        }
      },
    );
  }
}
