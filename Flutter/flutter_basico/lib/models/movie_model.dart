class MoviePage {
  double averageRating;
  dynamic backdropPath;
  List<Movie> movieList = [];
  String description;
  int id;
  int itemCount;
  String name;
  int page;
  String posterPath;
  bool public;
  int revenue;
  int runtime;
  String sortBy;
  int totalPages;
  int totalResults;

  MoviePage({
    required this.averageRating,
    required this.backdropPath,
    required movieList,
    required this.description,
    required this.id,
    required this.itemCount,
    required this.name,
    required this.page,
    required this.posterPath,
    required this.public,
    required this.revenue,
    required this.runtime,
    required this.sortBy,
    required this.totalPages,
    required this.totalResults,
  }) {
    for (int i = 0; i < movieList.length; i++) {
      this.movieList.add(Movie.fromJson(movieList[i]));
    }
  }

  factory MoviePage.fromJson(Map<String, dynamic> json) {
    return MoviePage(
      averageRating: json['average_rating'],
      backdropPath: json['backdrop_path'],
      movieList: json['results'],
      description: json['description'],
      id: json['id'],
      itemCount: json['item_count'],
      name: json['name'],
      page: json['page'],
      posterPath: json['poster_path'],
      public: json['public'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      sortBy: json['sort_by'],
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Movie {
  String backdropPath;
  int id;
  String title;
  String originalTitle;
  String overview;
  String posterPath;
  String mediaType;
  bool adult;
  String originalLanguage;
  List<dynamic> genreIds;
  double popularity;
  String releaseDate;
  bool video;
  double voteAverage;
  int voteCount;

  Movie({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      adult: json['adult'],
      originalLanguage: json['original_language'],
      genreIds: json['genre_ids'],
      popularity: json['popularity'],
      releaseDate: json['release_date'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
