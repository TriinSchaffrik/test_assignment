import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yolo_test_assignment/constants.dart';
import 'package:yolo_test_assignment/movies/bloc/movie_bloc.dart';
import 'package:http/http.dart' as http;
import 'movies_list.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.title,
          style: textTheme.titleLarge,
        ),
        forceMaterialTransparency: true,
      ),
      body: BlocProvider(
        create: (_) =>
            MovieBloc(httpClient: http.Client())..add(MoviesFetched()),
        child: const MoviesList(),
      ),
    );
  }
}
