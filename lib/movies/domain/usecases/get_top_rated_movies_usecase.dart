import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/base_usecase.dart';
import '../entities/movie.dart';
import '../repo/base_movies_repo.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepo baseMoviesRepo;
  GetTopRatedMoviesUseCase(this.baseMoviesRepo);

   @override
  Future<Either<Failure,List<Movie>>>call(NoParameters parameters) async{
    return await baseMoviesRepo.getTopRatedMovies();
  }
}