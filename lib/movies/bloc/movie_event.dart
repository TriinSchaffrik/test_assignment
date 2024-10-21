part of 'movie_bloc.dart';

sealed class MovieEvent {}

final class MoviesFetched extends MovieEvent {}

final class MoviesFailed extends MovieEvent {}
