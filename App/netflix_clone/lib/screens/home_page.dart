import 'package:flutter/material.dart';
import 'package:netflix_clone/models/now_playing_movie_model.dart';
import 'package:netflix_clone/models/popular_movie_model.dart';
import 'package:netflix_clone/models/top_rated_movie_model.dart';
import 'package:netflix_clone/models/upcoming_movie_model.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/widgets/nowplaying_movie_widget.dart';
import 'package:netflix_clone/widgets/popular_movie_widget.dart';
import 'package:netflix_clone/widgets/top_rated_movie_widget.dart';
import 'package:netflix_clone/widgets/upcoming_movie_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late Future<NowplayingMovieModel> nowPlayingFuture;
  late Future<PopularMovieModel> popularFuture;
  late Future<UpcomingMovieModel> upcomingFuture;
  late Future<TopRatedMovieModel> topRatedFuture;
  ApiService apiServices = ApiService();

  @override
  void initState() {
    super.initState();

    nowPlayingFuture = apiServices.getNowPlayingMovies();
    popularFuture = apiServices.getPopularMovies();
    upcomingFuture = apiServices.getUpcomingMovies();
    topRatedFuture = apiServices.getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 260,
            child: NowPlayingMovieCard(
              future: nowPlayingFuture,
              headLineText: "Now Playing",
            ),
          ),
          SizedBox(
            height: 260,
            child: PopularMovieCard(
              future: popularFuture,
              headLineText: "Popular movies",
            ),
          ),
          SizedBox(
            height: 260,
            child: UpcomingMovieCard(
              future: upcomingFuture,
              headLineText: "Upcoming movies",
            ),
          ),
          SizedBox(
            height: 260,
            child: TopRatedMovieCard(
              future: topRatedFuture,
              headLineText: "Top Rated movies",
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:netflix_clone/models/item.dart';
// import 'package:netflix_clone/services/api_service.dart';
// import 'package:netflix_clone/untils/app_colors.dart';

// class HomePageScreen extends StatefulWidget {
//   const HomePageScreen({super.key});

//   @override
//   _HomePageScreenState createState() => _HomePageScreenState();
// }

// class _HomePageScreenState extends State<HomePageScreen> {
//   final ApiService _apiService = ApiService();
//   late Future<NowPlaying> _nowPlayingMovies;

//   @override
//   void initState() {
//     super.initState();
//     _nowPlayingMovies = _apiService.getNowPlayingMovies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: ListView(
//         padding: const EdgeInsets.symmetric(vertical: 10.0),
//         children: [
//           _buildSection(title: 'Now Playing', futureMovies: _nowPlayingMovies),
//           _buildSection(title: 'Made in India', futureMovies: _nowPlayingMovies),
//           _buildSection(title: 'TV Comedies', futureMovies: _nowPlayingMovies),
//           _buildSection(title: 'US TV Shows', futureMovies: _nowPlayingMovies),
//           _buildSection(title: 'TV Dramas', futureMovies: _nowPlayingMovies),
//         ],
//       ),
//     );
//   }

//   Widget _buildSection({
//     required String title,
//     required Future<NowPlaying> futureMovies,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: Text(
//             title,
//             style: const TextStyle(
//               color: AppColors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 200,
//           child: FutureBuilder<NowPlaying>(
//             future: futureMovies,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 print('Error fetching data: ${snapshot.error}');
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else if (!snapshot.hasData || snapshot.data!.results.isEmpty) {
//                 return const Center(child: Text('No data available'));
//               }

//               final movies = snapshot.data!.results;

//               return ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: movies.length,
//                 itemBuilder: (context, index) {
//                   final movie = movies[index];
//                   return Container(
//                     width: 160,
//                     margin: const EdgeInsets.symmetric(horizontal: 8.0),
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage(
//                           'https://image.tmdb.org/t/p/w500${movie.posterPath}',
//                         ),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }



