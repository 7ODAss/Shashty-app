import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import '../../domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingState; //enum
  final String nowPlayingMessage;
  final List<Movie> popularMovie;
  final RequestState popularState; //enum
  final String popularMessage;
  final List<Movie> topRatedMovie;
  final RequestState topRatedState; //enum
  final String topRatedMessage;

  const MovieState({
    this.nowPlayingMovie = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovie = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedMovie = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  MovieState copyWith({
    List<Movie>? nowPlayingMovie,
    RequestState? nowPlayingState, //enum
    String? nowPlayingMessage,
    List<Movie>? popularMovie,
    RequestState? popularState, //enum
    String? popularMessage,
    List<Movie>? topRatedMovie,
    RequestState? topRatedState, //enum
    String? topRatedMessage,
  }) {
    return MovieState(
      nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovie: popularMovie ?? this.popularMovie,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovie: topRatedMovie ?? this.topRatedMovie,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingMovie,
    nowPlayingState,
    nowPlayingMessage,
    popularMovie,
    popularState,
    popularMessage,
    topRatedMovie,
    topRatedState,
    topRatedMessage,
  ];
}
