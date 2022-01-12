import 'package:bloc/bloc.dart';
import 'package:cinematri_app/models/movie_model.dart';
import 'package:cinematri_app/services/movie_service.dart';
import 'package:equatable/equatable.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  void fetchMovies() async {
    try {
      emit(MovieLoading());

      List<MovieModel> movies = await MovieService().fetchMovies();

      emit(MovieSuccess(movies));
    } catch (e) {
      emit(MovieFailed(e.toString()));
    }
  }
}
