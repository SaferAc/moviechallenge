class Constants {
  static const defaultUrl = "https://api.themoviedb.org/3/movie/";
  static const nowPlayingString = "now_playing?language=en-US";
  static const popularString = "popular?language=en-US";
  static const pageString = "&page=";
  static const apiKey =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzc3ZWVkNTUwYzdhNjQ0NTU4MTkzMzc2MmY0NTE2NyIsInN1YiI6IjY1OWYxMjcyZDY1OTBiMDA5NDlkNzI1ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.os4OeykF8X6AMVeKvezWJj4IKBBDY4m8lBwnSrS30aE";
  static const header = 'Authorization';
  static const Map<String, String> defaultHeaders = {
    Constants.header: Constants.apiKey
  };
}
