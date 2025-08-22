import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/movies/data/model/movie_model.dart';
import 'package:movie_app/movies/data/model/recommendation_model.dart';
import 'package:movie_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendation_usecase.dart';
import '../../../core/network/error_message_model.dart';
import '../model/movie_details_model.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
  Future<List<MovieModel>>  getNowPlayingMovies()async{
    final response = await Dio().get(Constants.nowPlayingMoviePath);
    if(response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List).map((e)=>MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies()async {
   final response = await Dio().get(Constants.popularMoviePath);
   if(response.statusCode == 200){
     return List<MovieModel>.from((response.data['results'] as List).map((e)=>MovieModel.fromJson(e)));
   }else{
     throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
   }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(Constants.topRatedMoviePath);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List).map((e)=>MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async {
    final response = await Dio().get(
        Constants.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
     return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async{
    final response = await Dio().get(Constants.movieRecommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results']as List).map((e)=>RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}