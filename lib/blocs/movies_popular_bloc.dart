import 'package:movie_app/models/item_model.dart';
import 'package:movie_app/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesPopularBloc {
  final repository = Repository();
  final movieFetcher = PublishSubject<ItemModel>();
  Stream<ItemModel> get allPopularMovies => movieFetcher.stream;
  Future<void> fetchAllPopularMovies() async {
    ItemModel itemModel = await repository.fetchAllPopularMovies();
    movieFetcher.sink.add(itemModel);
  }

  dispose() {
    movieFetcher.close();
  }
}

final blocPopular = MoviesPopularBloc();
