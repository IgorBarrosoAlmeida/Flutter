import 'package:flutter/material.dart';
import 'package:flutter_basico/controllers/movie_controller.dart';
import 'package:flutter_basico/models/movie_model.dart';
import 'package:flutter_basico/repositories/movies_repository_imp.dart';
import 'package:flutter_basico/widgets/movie_card_widget.dart';
import 'package:lottie/lottie.dart';

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SingleChildScrollView(
          child: ValueListenableBuilder<MoviePage?>(
            valueListenable: _movieController.movies,
            builder: (_, movies, __) {
              if (movies != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Movies",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    TextField(onChanged: _movieController.searchMovies),
                    SizedBox(height: 20),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (_, __) => SizedBox(height: 30),
                      itemCount: movies.movieList.length,
                      itemBuilder: (_, index) {
                        return MovieCardWidget(movie: movies.movieList[index]);
                      },
                    ),
                  ],
                );
              } else {
                return Lottie.asset('assets/lottieAnimation.json');
              }
            },
          ),
        ),
      ),
    );
  }
}
