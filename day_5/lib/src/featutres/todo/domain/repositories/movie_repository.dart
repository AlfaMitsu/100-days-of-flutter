import '../entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getTrendingMoview();
  Future<List<Movie>> searchMovies();
  Future<List<Movie>> getPopularMovies();
}