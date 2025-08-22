import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import '../../../core/usecases/base_usecase.dart';
import '../entities/recommendation.dart';
import '../repo/base_movies_repo.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepo baseMoviesRepo;

  GetRecommendationUseCase(this.baseMoviesRepo);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async{
    return await baseMoviesRepo.getRecommendation(parameters);
  }

}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({required this.id});
  @override
  List<Object?> get props => [id];
}