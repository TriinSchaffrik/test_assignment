import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yolo_test_assignment/constants.dart';

import 'package:yolo_test_assignment/movies/bloc/movie_bloc.dart';
import 'package:yolo_test_assignment/movies/widgets/loader.dart';
import 'package:yolo_test_assignment/movies/widgets/movie_list_item.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        switch (state.status) {
          case MovieStatus.failure:
            Future.delayed(const Duration(milliseconds: 10), () {
              context.mounted
                  ? ScaffoldMessenger.of(context).showSnackBar(_errorSnackBar())
                  : null;
            });
            return Center(
                child: IconButton(
                    onPressed: () {
                      context.read<MovieBloc>()..add(MoviesFailed())..add(MoviesFetched());
                    },
                    icon: const Icon(
                      Icons.refresh,
                      size: 100,
                    )));
          case MovieStatus.success:
            if (state.movies.isEmpty) {
              return const Center(child: Text(AppStrings.noMovies));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.movies.length
                    ? const Loader()
                    : MovieListItem(movie: state.movies[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.movies.length
                  : state.movies.length + 1,
              controller: _scrollController,
            );
          case MovieStatus.initial:
            return const Loader(
              size: 8,
            );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<MovieBloc>().add(MoviesFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  SnackBar _errorSnackBar() {
    return const SnackBar(
      content: Text(AppStrings.failedFetch),
      showCloseIcon: true,
      duration: Duration(seconds: 2),
    );
  }
}
