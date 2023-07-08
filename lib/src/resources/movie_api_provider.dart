import 'package:async/async.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'c6aeee577586ba38e487b74dfede5deb';

  Future<ItemModel> fetchMovieList() async {
    print('entered');
    var url = Uri.parse('http://api.themoviedb.org/3/tv/popular?api_key=c6aeee577586ba38e487b74dfede5deb');
    final response = await client.get(url);
    print(response.body.toString());
    if (response.statusCode == 200) {
return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}