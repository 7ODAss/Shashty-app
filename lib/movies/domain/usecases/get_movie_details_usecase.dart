import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie_detail.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';

import '../../../core/usecases/base_usecase.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail,MovieDetailsParameters>{
  final BaseMoviesRepo baseMoviesRepo;

  GetMovieDetailsUseCase(this.baseMoviesRepo);
  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameters) async{
    return await baseMoviesRepo.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});
  @override
  List<Object?> get props => [movieId];
}