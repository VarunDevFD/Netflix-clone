import 'dart:async';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movie_recommendation_model.dart';
import 'package:netflix_clone/models/search_model.dart';
import 'package:netflix_clone/screens/movie_detailed_screen.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/untils/api_until.dart';
import 'package:netflix_clone/untils/app_colors.dart';
import 'package:netflix_clone/untils/app_routes.dart';

class SearchScreen extends StatefulWidget {
  final String selectedImage;
  final String userName;

  const SearchScreen({
    super.key,
    required this.selectedImage,
    required this.userName,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  ApiService apiServices = ApiService();
  late Future<MovieRecommendationsModel> popularMovies;
  Timer? _debounce;
  SearchModel? searchModel;

  void search(String query) {
    apiServices.getSearchedMovies(query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        search(query);
      }
    });
  }

  @override
  void initState() {
    popularMovies = apiServices.getPopularMovies();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 60.0),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 0.0,
          ),
          color: AppColors.red,
          child: SafeArea(
              child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(widget.selectedImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 70.0,
              child: CupertinoSearchTextField(
                controller: searchController,
                padding: const EdgeInsets.all(8.0),
                itemSize: 30,
                itemColor: AppColors.darkWhite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.gray,
                ),
                style: const TextStyle(color: AppColors.white),
                onChanged: (value) {
                  if (value.isEmpty) {
                  } else {
                    search(searchController.text);
                  }
                },
              ),
            ),
            searchController.text.isEmpty
                ? FutureBuilder(
                    future: popularMovies,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        log('Error fetching data: ${snapshot.error}');
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData ||
                          snapshot.data?.results == null ||
                          snapshot.data!.results.isEmpty) {
                        return const Center(child: Text('No data available'));
                      }
                      var data = snapshot.data!.results;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 10.0),
                            child: Text(
                              "Top Searches",
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ListView.builder(
                              padding: const EdgeInsets.all(10),
                              itemCount: data.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        AppRoutes.detailSn,
                                        arguments: MovieDetailedSn(
                                          movieId: data[index].id,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            "$imageUrl${data[index].posterPath}",
                                            fit: BoxFit.fitHeight,
                                          ),
                                          const SizedBox(width: 20),
                                          Text(
                                            data[index].title,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                color: AppColors.text),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                        ],
                      );
                    },
                  )
                : searchModel == null
                    ? const SizedBox.shrink()
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: searchModel?.results.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 6,
                          childAspectRatio: 1.2 / 2,
                        ),
                        itemBuilder: (context, index) {
                          return searchModel!.results[index].backdropPath ==
                                  null
                              ? Column(
                                  children: [
                                    Image.asset("assets/logo/logo.png",
                                        height: 170),
                                    Text(
                                      searchModel!.results[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: AppColors.text,
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.detailSn,
                                          arguments: MovieDetailedSn(
                                            movieId:
                                                searchModel!.results[index].id,
                                          ),
                                        );
                                      },
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '$imageUrl${searchModel?.results[index].backdropPath}',
                                        height: 170,
                                      ),
                                    ),
                                    Text(
                                        searchModel!.results[index].title,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                  ],
                                );
                        },
                      ),
          ],
        ),
      ),
    );
  }
}
