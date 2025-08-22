import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(getMovieDetails);
    on<GetMovieRecommendationEvent>(getRecommendation);
  }

  Future<void> getMovieDetails(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieDetailsUseCase(
      MovieDetailsParameters(movieId: event.id),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetailsState: RequestState.success,
          movieDetails: r,
        ),
      ),
    );
  }

  Future<void> getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
    final result = await getRecommendationUseCase(RecommendationParameters(id: event.id));
    result.fold(
          (l) => emit(
        state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.message,
        ),
      ),
          (r) => emit(
        state.copyWith(
          recommendationState: RequestState.success,
          recommendationDetails: r,
        ),
      ),
    );
  }
}
