import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviechallenge/app/models/movie_genre_list.dart';
import 'package:moviechallenge/app/utils/contants.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 1)
class MovieModel {
  @HiveField(0)
  bool? adult;
  @HiveField(1)
  String? backdropPath;
  @HiveField(2)
  List<int>? genreIds;
  @HiveField(3)
  @HiveField(4)
  int? id;
  @HiveField(5)
  String? originalLanguage;
  @HiveField(6)
  String? originalTitle;
  @HiveField(7)
  String? overview;
  @HiveField(8)
  double? popularity;
  @HiveField(9)
  String? posterPath;
  @HiveField(10)
  DateTime? releaseDate;
  @HiveField(11)
  String? title;
  @HiveField(12)
  bool? video;
  @HiveField(13)
  double? voteAverage;
  @HiveField(14)
  int? voteCount;
  List<String>? genreNames;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.genreNames,
  }) {
    _loadGenreNames();
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: "${Constants.posterPathUrl}${json["poster_path"]}",
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };

  Future<void> _loadGenreNames() async {
    await GenreList.init();
    if (genreIds != null) {
      genreNames = GenreList().getGenreNamesByIds(genreIds!);
    }
  }
}
