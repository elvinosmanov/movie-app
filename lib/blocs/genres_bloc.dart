import 'package:movie_app/models/genre_model.dart';
import 'package:movie_app/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class GenresBloc {
  final repository = Repository();
  final genreFetcher = PublishSubject<GenreModel>();
  Stream<GenreModel> get allGenres => genreFetcher.stream;
  Future<void> fetchAllGenres() async {
    GenreModel genreModel = await repository.fetchAllGenres();
    genreFetcher.sink.add(genreModel);
  }

  dispose() {
    genreFetcher.close();
  }
}

final blocGenres = GenresBloc();
