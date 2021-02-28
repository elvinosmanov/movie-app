import 'genre_model.dart';

class ItemModel {
  int page;
  int totalPage;
  int totalResults;
  List<Result> results = [];
  ItemModel.fromJson(Map<String, dynamic> map, GenreModel genreModel) {
    page = map['page'];
    totalPage = map['total_page'];
    totalResults = map['total_results'];
    for (var i = 0; i < map['results'].length; i++) {
      results.add(Result(map['results'][i], genreModel));
    }
  }
}

class Result {
  String voteCount;
  int id;
  bool video;
  var voteAverage;
  String title;
  double popularity;
  String posterPath;
  String backdropPath;
  List<Genre> genres = [];
  String genresString = '';
  bool adult;
  String overview;
  String releaseDate;
  Result(Map<String, dynamic> map, GenreModel genreModel) {
    String _seperator = '';
    if (genreModel != null) {
      for (var genre in genreModel.genres) {
        for (var i = 0; i < map['genre_ids'].length; i++) {
          if (genre.id == map['genre_ids'][i]) {
            genresString = genresString + _seperator + genre.name;
            _seperator = ", ";
            genres.add(genre);
          }
        }
      }
    }
    voteCount = map["vote_count"].toString();
    id = map['id'];
    video = map['video'];
    voteAverage = map['vote_average'];
    title = map['title'].toString();
    popularity = map['popularity'];
    posterPath = map['poster_path'].toString();
    backdropPath = map['backdrop_path'];
    adult = map['adult'];
    overview = map['overview'].toString();
    releaseDate = map['release_date'].toString();
  }
}
