import 'package:cinemax/src/core/resources/data_state.dart';
import 'package:cinemax/src/core/resources/usecase.dart';
import 'package:cinemax/src/features/main/home/domain/entities/get_movie.entity.dart';
import 'package:cinemax/src/features/main/home/domain/repositories/get_movie.repositories.dart';

class GetMovieUseCase
    implements UseCase<DataState<List<GetMovieEntity>>, void> {
  final GetMovieRepository _getMovieRepository;

  GetMovieUseCase(this._getMovieRepository);

  @override
  Future<DataState<List<GetMovieEntity>>> call({void params}) {
    return _getMovieRepository.getMovie();
  }
}
