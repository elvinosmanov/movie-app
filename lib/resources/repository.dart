import 'package:movie_app/models/genre_model.dart';
import 'package:movie_app/models/item_model.dart';
import 'package:movie_app/resources/movie_api_provider.dart';

class Repository {
  final movieApiProvider = MovieApiProvider();
  Future<ItemModel> fetchAllMovies() {
    return movieApiProvider.fetchMovieList();
  }

  Future<ItemModel> fetchAllPopularMovies() {
    return movieApiProvider.fetchMoviePopularList();
  }

  Future<GenreModel> fetchAllGenres() {
    return movieApiProvider.fetchGenreList();
  }
}
