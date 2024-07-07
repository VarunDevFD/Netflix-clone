import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/coming_soon_movie_widget.dart';

class NewandHotPage extends StatelessWidget {
  const NewandHotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                    overview:
                        'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                    logoUrl:
                        "https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg",
                    month: "Jun",
                    day: "19",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
                    overview:
                        'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
                    logoUrl:
                        "https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg",
                    month: "Mar",
                    day: "07",
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  ComingSoonMovieWidget(
                    imageUrl:
                        'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                    overview:
                        'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                    logoUrl:
                        "https://logowik.com/content/uploads/images/stranger-things4286.jpg",
                    month: "Feb",
                    day: "20",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
