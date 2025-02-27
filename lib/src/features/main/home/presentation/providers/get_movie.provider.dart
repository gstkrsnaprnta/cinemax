import 'dart:io';
import 'package:cinemax/injection_container.dart';
import 'package:cinemax/src/core/resources/data_state.dart';
import 'package:cinemax/src/features/main/home/domain/entities/get_movie.entity.dart';
import 'package:cinemax/src/features/main/home/domain/usecase/get_movie.usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movie.provider.g.dart';

@riverpod
Future<DataState<List<GetMovieEntity>>> getMovies(Ref ref) async {
  final GetMovieUseCase getMoviesUsecase = sl<GetMovieUseCase>();

  final dataState = await getMoviesUsecase();

  if (dataState is DataSuccess) {
    return DataSuccess(dataState.data!);
  } else if (dataState is DataFailed) {
    return DataFailed(dataState.error!);
  } else {
    throw const HttpException("Unknown Error");
  }
}
