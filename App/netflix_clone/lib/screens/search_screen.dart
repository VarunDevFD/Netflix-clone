import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/search_model.dart';
import 'package:netflix_clone/services/api_service.dart';
import 'package:netflix_clone/untils/api_until.dart';
import 'package:netflix_clone/untils/app_colors.dart';

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
                onPressed: () {},
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
              height: 70.0, // Adjust the height as needed
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
            searchModel == null
                ? const SizedBox.shrink()
                : GridView.builder(
                    shrinkWrap: true,
                    itemCount: searchModel?.results.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1.2 / 2,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "$imageUrl${searchModel!.results[index].backdropPath}",
                            height: 180,
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
