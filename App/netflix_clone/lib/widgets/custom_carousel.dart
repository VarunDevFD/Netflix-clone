import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/untils/api_until.dart';
import 'package:netflix_clone/untils/app_colors.dart';

class CustomCarouselSlider extends StatelessWidget {
  final TvSeriesModel data;
  const CustomCarouselSlider({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
      child: CarouselSlider.builder(
        itemCount: data.results.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          var url = data.results[index].backdropPath.toString();
          return GestureDetector(
            child: Column(
              children: [
                CachedNetworkImage(imageUrl: "$imageUrl$url"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data.results[index].name,
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
          aspectRatio: 16 / 9,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 900),
          enlargeCenterPage: true,
        ),
      ),
    );
  }
}
