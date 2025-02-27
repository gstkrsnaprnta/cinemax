import 'package:cinemax/src/features/main/home/data/data_sources/remote/get_movie.service.dart';
import 'package:cinemax/src/features/main/home/data/repository/get_movie.repository.impl.dart';
import 'package:cinemax/src/features/main/home/domain/repositories/get_movie.repositories.dart';
import 'package:cinemax/src/features/main/home/domain/usecase/get_movie.usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerLazySingleton<http.Client>(() => http.Client());

  sl.registerLazySingleton<GetMovieService>(
      () => GetMovieService(sl<http.Client>()));

  sl.registerLazySingleton<GetMovieRepository>(
      () => GetMovieRepositoryImpl(sl<GetMovieService>()));

  sl.registerLazySingleton<GetMovieUseCase>(
      () => GetMovieUseCase(sl<GetMovieRepository>()));
}
