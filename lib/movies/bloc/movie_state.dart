part of 'movie_bloc.dart';

enum MovieStatus { initial, success, failure }

final class MovieState {
  const MovieState({
    this.status = MovieStatus.initial,
    this.movies = const <Movie>[],
    this.hasReachedMax = false,
    this.page = 1,
  });

  final MovieStatus status;
  final List<Movie> movies;
  final bool hasReachedMax;
  final int page;

  MovieState copyWith({
    MovieStatus? status,
    List<Movie>? movies,
    bool? hasReachedMax,
    int? page,
  }) {
    return MovieState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
    );
  }
}
