import 'package:movie_app/models/item_model.dart';
import 'package:movie_app/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final repository = Repository();
  final movieFetcher = PublishSubject<ItemModel>();
  Stream<ItemModel> get allMovies => movieFetcher.stream;
  Future<void> fetchAllMovies() async {
    ItemModel itemModel = await repository.fetchAllMovies();
    movieFetcher.sink.add(itemModel);
  }

  dispose() {
    movieFetcher.close();
  }
}

final bloc = MoviesBloc();
