import 'dart:convert';
import 'dart:io';
import 'package:cinemax/src/core/resources/data_state.dart';
import 'package:cinemax/src/features/main/home/data/data_sources/remote/get_movie.service.dart';
import 'package:cinemax/src/features/main/home/data/model/get_movie_response.model.dart';
import 'package:cinemax/src/features/main/home/domain/entities/get_movie.entity.dart';
import 'package:cinemax/src/features/main/home/domain/repositories/get_movie.repositories.dart';

class GetMovieRepositoryImpl implements GetMovieRepository {
  final GetMovieService _getMovieService;

  GetMovieRepositoryImpl(this._getMovieService);

  @override
  Future<DataState<List<GetMovieResponseModel>>> getMovie() async {
    try {
      final response = await _getMovieService.getMovie();
      if (response.statusCode == HttpStatus.ok) {
        final jsonData = json.decode(response.body);
        final result = List<GetMovieResponseModel>.from(
            jsonData['results'].map((x) => GetMovieResponseModel.fromJson(x)));
        return DataSuccess(result);
      } else {
        return DataFailed(
          HttpException("Error ${response.statusCode}: ${response.body}"),
        );
      }
    } catch (e) {
      return DataFailed(HttpException("Exception: $e"));
    }
  }
}
