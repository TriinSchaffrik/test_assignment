import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yolo_test_assignment/constants.dart';
import 'package:yolo_test_assignment/movies/models/movie.dart';
import 'loader.dart';

class MovieImage extends StatelessWidget {
  const MovieImage(
      {required this.movie, this.height = 150, this.padding = 9, super.key});

  final Movie movie;
  final double height;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: movie.image != null
            ? CachedNetworkImage(
                imageUrl: '$imageUrl${movie.image}',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                        width: height * 0.65,
                        child: const Loader(
                          size: 5,
                        )),
                errorWidget: (context, url, error) => _errorWidget(),
                height: height,
              )
            : _errorWidget(),
      ),
    );
  }

  Widget _errorWidget() {
    return Icon(
      Icons.movie_filter_rounded,
      size: height * 0.7,
    );
  }
}
