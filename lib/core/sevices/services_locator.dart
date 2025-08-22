import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repo/movie_repo.dart';
import 'package:movie_app/movies/domain/repo/base_movies_repo.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movie_details_bloc.dart';

import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/domain/usecases/get_recommendation_usecase.dart';


final getIt = GetIt.instance;

class ServicesLocator {
  void init(){

    // registerFactory : new object with every call
    // registerLazySingleton :  same object with every call

    //Bloc
    getIt.registerFactory(() => MovieBloc(getIt(),getIt(),getIt()),); // new object with every call
    getIt.registerFactory(() => MovieDetailsBloc(getIt(),getIt())); // new object with every call

    //Data Sources
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource(),); // same object with every call
    //Repository
    getIt.registerLazySingleton<BaseMoviesRepo>(() => MovieRepo(getIt()),); // same object with every call
    //UseCases
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUseCase(getIt()),); // same object with every call
    getIt.registerLazySingleton(() => GetPopularMoviesUseCase(getIt()),); // same object with every call
    getIt.registerLazySingleton(() => GetTopRatedMoviesUseCase(getIt()),); // same object with every call
    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()),); // same object with every call
    getIt.registerLazySingleton(() => GetRecommendationUseCase(getIt()),); // same object with every call
  }
}