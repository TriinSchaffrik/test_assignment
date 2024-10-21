import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yolo_test_assignment/constants.dart';
import 'package:yolo_test_assignment/movies/models/movie.dart';
import 'movie_image.dart';

class MovieDetailsBottomsheet extends StatelessWidget {
  const MovieDetailsBottomsheet({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          (movie.image != null ? 0.85 : 0.5),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              movie.image != null
                  ? MovieImage(movie: movie, height: 300, padding: 30)
                  : const SizedBox(),
              Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movie.title,
                    style: textTheme.displayMedium,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              Flexible(
                flex: 8,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      child: Text(
                        movie.overView ?? '',
                        style: textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                    '${AppStrings.bottomSheetRelease}: ${DateFormat.yMMMd().format(movie.releaseDate)}',
                    style: textTheme.bodySmall),
              ),
              Flexible(
                  flex: 1,
                  child: Text(
                      '${AppStrings.bottomSheetRating}: ${movie.rating}',
                      style: textTheme.bodySmall)),
              Flexible(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(_titleSnackBar(movie));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).indicatorColor,
                      elevation: 2,
                    ),
                    child: Text(
                      AppStrings.bottomSheetPlay,
                      style: textTheme.displaySmall,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SnackBar _titleSnackBar(Movie movie) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      content: Text(movie.title),
    );
  }
}
