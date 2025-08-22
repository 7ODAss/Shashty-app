import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/entities/movie_detail.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/recommendation.dart';

abstract class BaseMoviesRepo {
  Future<Either<Failure,List<Movie>>> getNowPlaying();
  Future<Either<Failure,List<Movie>>> getPopularPlaying();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetail>> getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure,List<Recommendation>>> getRecommendation(RecommendationParameters parameters);

}