import 'dart:convert';
import 'dart:developer';

import 'package:netflix_clone/models/now_playing_movie_model.dart';
import 'package:netflix_clone/models/popular_movie_model.dart';
import 'package:netflix_clone/models/search_model.dart';
import 'package:netflix_clone/models/top_rated_movie_model.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/models/upcoming_movie_model.dart';
import 'package:netflix_clone/untils/api_until.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apikey";
late String endPoint;

class ApiService {
  Future<TvSeriesModel> getTopRatedSeries() async {
    endPoint = "tv/top_rated";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("Success");

      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load top rated tvseries");
  }

  Future<NowplayingMovieModel> getNowPlayingMovies() async {
    endPoint = "movie/now_playing";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("Success");

      return NowplayingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load now playing movies");
  }

  Future<PopularMovieModel> getPopularMovies() async {
    endPoint = "movie/popular";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("Success");

      return PopularMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load now playing movies");
  }

  Future<UpcomingMovieModel> getUpcomingMovies() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("Success");

      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load upcoming movies");
  }

  Future<TopRatedMovieModel> getTopRatedMovies() async {
    endPoint = "movie/top_rated";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("Success");

      return TopRatedMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load top_rated movies");
  }

  Future<SearchModel> getSearchedMovies(String searchText) async {
    endPoint = "search/movie?query=$searchText";
    final url = "$baseUrl$endPoint";

    log("Search url is $url");
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjc2MmVjMWQ0MzFkMDQ1ZjA2ZWY2ZDE5OWJhODZiZSIsIm5iZiI6MTcxOTY2MjgxOC4zMjkwMjMsInN1YiI6IjY2N2ZlMTZmMmQ2ODg4NmUyOWVmMjY0ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hABuFp5trCnswWFp_ZOJP67LzAHcPQ6XmoItxqnxsjw"
    });

    if (response.statusCode == 200) {
      log("Success");

      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("Failed to load searched movie");
  }
}
