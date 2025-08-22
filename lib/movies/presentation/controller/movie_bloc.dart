import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movie_app/core/usecases/base_usecase.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(MovieState()) {
    on<GetNowPlayingMoviesEvent>(getNowPlayingMovies);

    on<GetPopularMoviesEvent>(getPopularMovies);

    on<GetTopRatedMoviesEvent>(getTopRatedMovies);
  }

  Future<void> getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MovieState> emit) async{
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
          (l) => emit(
          state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: l.message,
          )
      ),
          (r) => emit(
          state.copyWith(
            nowPlayingState: RequestState.success,
            nowPlayingMovie: r,
          )
      ),
    );
  }

  Future<void> getPopularMovies(GetPopularMoviesEvent event, Emitter<MovieState> emit) async{
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold(
          (l) => emit(
          state.copyWith(
            popularState: RequestState.error,
            popularMessage: l.message,
          )
      ),
          (r) => emit(
          state.copyWith(
            popularState: RequestState.success,
            popularMovie: r,
          )
      ),
    );
  }

  Future<void> getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MovieState> emit) async{
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold(
          (l) => emit(
          state.copyWith(
            topRatedState: RequestState.error,
            topRatedMessage: l.message,
          )
      ),
          (r) => emit(
          state.copyWith(
            topRatedState: RequestState.success,
            topRatedMovie: r,
          )
      ),
    );
  }
}
