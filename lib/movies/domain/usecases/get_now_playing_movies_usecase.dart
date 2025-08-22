import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecases/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repo/base_movies_repo.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters> {
  final BaseMoviesRepo baseMoviesRepo;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepo);

  @override
  Future<Either<Failure,List<Movie>>> call(NoParameters parameters) async{
    return await baseMoviesRepo.getNowPlaying();
  }
}