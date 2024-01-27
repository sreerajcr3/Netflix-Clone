
class Movie {
  String title;
  String backdropPath;
  String originalTitle;
  String overview;
  DateTime releaseDate;
  String posterPath;
  double voteAverage;

  Movie(
      {required this.backdropPath,
      required this.originalTitle,
      required this.overview,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        backdropPath: json["backdrop_path"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        releaseDate:  DateTime.tryParse(json['release_date'])!,
        title: json["title"],
        voteAverage: json["vote_average"],
        posterPath: json["poster_path"]);
  }
}
