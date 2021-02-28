class GenreModel {
  List<Genre> genres = [];
  GenreModel.fromMap(Map<String, dynamic> map) {
    for (var i = 0; i < map['genres'].length; i++) {
      Genre genre = Genre(map['genres'][i]);
      genres.add(genre);
    }
  }
}

class Genre {
  int id;
  String name;
  Genre(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}
