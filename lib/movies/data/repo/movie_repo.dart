import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/entities/recommendation.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation_usecase.dart';

import '../../domain/entities/movie_detail.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';

class MovieRepo extends BaseMoviesRepo{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MovieRepo(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure,List<Movie>>> getNowPlaying() async{
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    }on ServerException catch(fail){
      return Left(ServerFailure(fail.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure,List<Movie>>> getPopularPlaying() async{
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    }on ServerException catch(fail){
      return Left(ServerFailure(fail.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie>>> getTopRatedMovies() async{
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    }on ServerException catch(fail){
      return Left(ServerFailure(fail.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,MovieDetail>> getMovieDetails(MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    }on ServerException catch(fail){
      return Left(ServerFailure(fail.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{
   final result = await baseMovieRemoteDataSource.getRecommendation(parameters);
   try{
     return Right(result);
   }on ServerException catch(fail){
     return Left(ServerFailure(fail.errorMessageModel.statusMessage));
   }
  }

}