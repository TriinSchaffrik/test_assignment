final class Movie {
  const Movie(
      {required this.id,
      required this.title,
      required this.image,
      this.overView,
      required this.releaseDate,
      this.rating});

  final int id;
  final String title;
  final String? image;
  final String? overView;
  final DateTime releaseDate;
  final double? rating;

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        title = json['title'] as String,
        image = json['poster_path'] as String?,
        overView = json['overview'] as String?,
        releaseDate = DateTime.parse(json['release_date']),
        rating = json['vote_average'];
}
