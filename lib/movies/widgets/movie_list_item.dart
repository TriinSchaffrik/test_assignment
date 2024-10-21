import 'package:flutter/material.dart';
import 'package:yolo_test_assignment/movies/models/movie.dart';
import 'package:yolo_test_assignment/movies/widgets/movie_details_bottomsheet.dart';
import 'package:yolo_test_assignment/movies/widgets/movie_image.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return MovieDetailsBottomsheet(movie: movie);
              }),
          child: Card(
            elevation: 3,
            child: Row(
              children: [
                MovieImage(movie: movie),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: textTheme.displaySmall,
                        ),
                        Text(movie.releaseDate.year.toString(),
                            style: textTheme.bodySmall),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
