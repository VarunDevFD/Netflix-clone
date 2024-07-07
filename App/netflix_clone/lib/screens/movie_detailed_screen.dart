import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie_details_model.dart';
import 'package:netflix_clone/models/movie_recommendation_model.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/untils/api_until.dart';
import 'package:netflix_clone/untils/app_colors.dart';

class MovieDetailedSn extends StatefulWidget {
  final int movieId;
  const MovieDetailedSn({super.key, required this.movieId});

  @override
  State<MovieDetailedSn> createState() => _MovieDetailedSnState();
}

class _MovieDetailedSnState extends State<MovieDetailedSn> {
  ApiService apiServices = ApiService();
  late Future<MovieDetailModel> movieDetail;
  late Future<MovieRecommendationsModel> movieRecommendation;

  @override
  void initState() {
    super.initState();
    fetchInitialData();
  }

  fetchInitialData() {
    movieDetail = apiServices.getMovieDetails(widget.movieId);
    movieRecommendation = apiServices.getMoviesRecommendation(widget.movieId);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(widget.movieId);
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: movieDetail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final movie = snapshot.data;
                String genreText =
                    movie!.genres.map((gen) => gen.name).join(',');

                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: size.height * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    '$imageUrl${movie.posterPath}'),
                                fit: BoxFit.cover),
                          ),
                          child: SafeArea(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ]),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                movie.releaseDate.year.toString(),
                                style: const TextStyle(
                                    color: AppColors.grey, fontSize: 18),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                genreText,
                                style: const TextStyle(
                                    color: AppColors.grey, fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            movie.overview,
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.grey,
                            ),
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    FutureBuilder(
                      future: movieRecommendation,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final movieR = snapshot.data;
                          return movieR!.results.isEmpty
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    const Text("More like this"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    GridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: movieR.results.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 5,
                                        childAspectRatio: 1.5 / 2,
                                      ),
                                      itemBuilder: (context, index) {
                                        // CachedNetworkImage(
                                        //     imageUrl:
                                        //         "$imageUrl${movieR.results[index].posterPath}");
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MovieDetailedSn(
                                                        movieId: movieR
                                                            .results[index].id),
                                              ),
                                            );
                                          },
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                "$imageUrl${movieR.results[index].posterPath}",
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                        }
                        return const Text("Something went wrong");
                      },
                    ),
                  ],
                );
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }
}
