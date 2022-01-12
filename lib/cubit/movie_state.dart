part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  final List<MovieModel> movies;

  const MovieSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieFailed extends MovieState {
  final String error;

  const MovieFailed(this.error);

  @override
  List<Object> get props => [error];
}
