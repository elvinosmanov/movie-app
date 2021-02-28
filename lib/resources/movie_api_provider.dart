import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' show Client;
import 'package:movie_app/models/genre_model.dart';
import 'package:movie_app/models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final baseUrl = 'https://api.themoviedb.org/3';
  final apiKey = "26c73d3cab5131896fdad5be40d01bd3";

  Future<ItemModel> fetchMovieList() async {
    final response =
        await client.get('$baseUrl/movie/now_playing?api_key=$apiKey');
    if (response.statusCode == 200) {
      ItemModel itemModel = ItemModel.fromJson(jsonDecode(response.body), null);
      itemModel.results.sort((a, b) {
        return DateTime.parse(b.releaseDate)
            .compareTo(DateTime.parse(a.releaseDate));
      });
      return itemModel;
    } else {
      throw Exception("Failed to load post");
    }
  }

  Future<ItemModel> fetchMoviePopularList() async {
    final response = await client.get('$baseUrl/movie/popular?api_key=$apiKey');
    GenreModel genreModel = await fetchGenreList();
    if (response.statusCode == 200) {
      ItemModel itemModel =
          ItemModel.fromJson(jsonDecode(response.body), genreModel);

      return itemModel;
    } else {
      throw Exception("Failed to load post");
    }
  }

  Future<GenreModel> fetchGenreList() async {
    final response =
        await client.get('$baseUrl/genre/movie/list?api_key=$apiKey');
    if (response.statusCode == 200) {
      GenreModel genreModel = GenreModel.fromMap(jsonDecode(response.body));
      return genreModel;
    } else {
      throw Exception("Failed to load post");
    }
  }
}
