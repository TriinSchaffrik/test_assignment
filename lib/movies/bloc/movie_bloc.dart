import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

import 'package:yolo_test_assignment/constants.dart';
import 'package:yolo_test_assignment/movies/models/movie.dart';

part 'movie_event.dart';

part 'movie_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({required this.httpClient}) : super(const MovieState()) {
    on<MoviesFetched>(
      _onFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<MoviesFailed>(
      _onFailed,
    );
  }

  final http.Client httpClient;

  Future<void> _onFetched(
    MoviesFetched event,
    Emitter<MovieState> emit,
  ) async {
    if (state.hasReachedMax) return;

    try {
      final movies = await _fetchMovies(page: state.page);

      if (movies.isEmpty) {
        return emit(state.copyWith(hasReachedMax: true));
      }

      emit(
        state.copyWith(
          status: MovieStatus.success,
          movies: [...state.movies, ...movies],
          page: state.page + 1,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }

  Future<List<Movie>> _fetchMovies({required int page}) async {
    final response = await httpClient.get(
        Uri.https(
          rootUrl,
          nowPlayingPath,
          <String, String>{'page': '$page'},
        ),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'accept': 'application/json',
        });
    if (response.statusCode == 200) {
      final body = json.decode(response.body)['results'] as List;
      return body.map((dynamic json) {
        return Movie.fromJson(json);
      }).toList();
    }
    throw Exception('error fetching movies');
  }

  Future<void> _onFailed(
    MoviesFailed event,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(status: MovieStatus.initial));
  }
}
