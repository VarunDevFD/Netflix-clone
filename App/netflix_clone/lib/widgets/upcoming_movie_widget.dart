import 'package:flutter/material.dart';
import 'package:netflix_clone/models/upcoming_movie_model.dart';
import 'package:netflix_clone/untils/api_until.dart';
import 'package:netflix_clone/untils/app_colors.dart';

class UpcomingMovieCard extends StatelessWidget {
  final Future<UpcomingMovieModel> future;
  final String headLineText;
  const UpcomingMovieCard(
      {super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print('Error fetching data: ${snapshot.error}');
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
              child: Text(
                headLineText,
                style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child:
                            Image.network("$imageUrl${data[index].posterPath}"),
                      ),
                    );
                  }),
            )
          ],
        );
      },
    );
  }
}
