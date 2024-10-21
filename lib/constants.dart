const imageUrl = 'https://image.tmdb.org/t/p/w342';
const rootUrl = 'api.themoviedb.org';
const nowPlayingPath = '/3/movie/now_playing';
const apiKey =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMDkwMWM4ZTQ4MzMxOGY0NDJhMWI5NzQ3ZjE3MWQwNSIsIm5iZiI6MTcyOTQxMjgxNS4zMDgxMDcsInN1YiI6IjY3MTIzOTE4OGU4NDQ2NTdiN2ZiMGQ2YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Cy9AeLddd3Sy4eO4fbq8lhkG1z-kRqktE_VaAojUx7w';

class AppStrings {
  static const String title = 'Movies';
  static const String failedFetch = 'Failed to fetch movies';
  static const String noMovies = 'No movies';
  static const String bottomSheetRelease = 'Release date';
  static const String bottomSheetRating = 'Rating';
  static const String bottomSheetPlay = 'PLAY';
}
