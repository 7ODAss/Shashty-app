import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  final int id;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;
  final List<Genres> genres;

  const MovieDetail({
    required this.id,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.genres,
  });

  @override
  List<Object?> get props => [
    id,
    backdropPath,
    overview,
    releaseDate,
    runtime,
    title,
    voteAverage,
    genres,
  ];
}

class Genres extends Equatable {
  final int id;
  final String name;

  const Genres({required this.id, required this.name});
  @override
  List<Object?> get props => [id, name];
}