import 'package:http/http.dart' as http;
import 'package:moviechallenge/app/models/movie_list_model.dart';
import 'package:moviechallenge/app/models/movie_model.dart';
import 'package:moviechallenge/app/utils/contants.dart';

class MovieProvider {
  String _buildUrl(String endpoint, int page) {
    return "${Constants.defaultUrl}$endpoint${Constants.pageString}$page";
  }

  Future<List<MovieModel>> getPopularMovies(int page) async {
    final url = _buildUrl(Constants.popularString, page);
    final response =
        await http.get(Uri.parse(url), headers: Constants.defaultHeaders);

    return handleResult(response);
  }

  Future<List<MovieModel>> getNowPlayingMovies(int page) async {
    final url = _buildUrl(Constants.nowPlayingString, page);
    final response =
        await http.get(Uri.parse(url), headers: Constants.defaultHeaders);

    return handleResult(response);
  }

  List<MovieModel> handleResult(http.Response response) {
    if (response.statusCode == 200) {
      final movieResponse = movieListFromJson(response.body);
      final movieList = movieResponse.results;
      return movieList ?? [];
    } else {
      throw Exception(Constants.errorMessage);
    }
  }
}
