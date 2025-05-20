import 'package:flutter/material.dart';
import 'package:flutter_basico/models/movie_model.dart';
import 'package:flutter_basico/utils/api.utils.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  child: Hero(
                    tag: movie.id,
                    child: Image.network(
                      API.REQUEST_IMG(movie.posterPath),
                      loadingBuilder: (_, child, progress) {
                        if (progress == null) return child;
                        return CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Text(
                movie.overview,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.mic, color: Colors.white),
                  SizedBox(width: 20),
                  Text(movie.originalLanguage, style: TextStyle(fontSize: 16)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.calendar_month, color: Colors.white),
                  SizedBox(width: 20),
                  Text(movie.releaseDate, style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
