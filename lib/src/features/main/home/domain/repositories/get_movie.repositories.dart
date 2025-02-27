import 'package:cinemax/src/core/resources/data_state.dart';
import 'package:cinemax/src/features/main/home/domain/entities/get_movie.entity.dart';

abstract class GetMovieRepository {
  Future<DataState<List<GetMovieEntity>>> getMovie();
}
