import 'dart:convert';

import 'package:netflix_clone/constants/constants.dart';
import 'package:netflix_clone/model/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const trendingUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";

  static const nowPlaying =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}";

  static const upComingMovies =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";

      static const Top10 = "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";

     
  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happended');
    }
  }

  Future<List<Movie>> getPopularMovie() async {
    final nowPlayingResponse = await http.get(Uri.parse(nowPlaying));
    if (nowPlayingResponse.statusCode == 200) {
      final decodeData =
          json.decode(nowPlayingResponse.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happened');
    }
  }

  Future<List<Movie>> getUpComingMovies() async {
    final Upcomingresponse = await http.get(Uri.parse(upComingMovies));
    if (Upcomingresponse.statusCode == 200) {
      final decodeData = json.decode(Upcomingresponse.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happened');
    }
  }
    Future<List<Movie>> getTop10Movies() async {
    final top10response = await http.get(Uri.parse(Top10));
    if (top10response.statusCode == 200) {
      final decodeData = json.decode(top10response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something happened');
    }
  }
  
}
