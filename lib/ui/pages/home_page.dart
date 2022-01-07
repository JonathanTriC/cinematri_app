import 'package:cinematri_app/shared/theme.dart';
import 'package:cinematri_app/ui/widget/movie_card.dart';
import 'package:cinematri_app/ui/widget/movie_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 30,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo,\nJonathan Tri',
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'What you wanna watch today?',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_profile.png',
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget popularMovies() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              MovieCard(
                imageUrl: 'assets/image_movie1.png',
                name: 'Spider-Man: No Way Home',
                genre: 'Action',
                rating: 4.8,
              ),
              MovieCard(
                imageUrl: 'assets/image_movie2.png',
                name: 'Dune',
                genre: 'Fiction',
                rating: 4.5,
              ),
              MovieCard(
                imageUrl: 'assets/image_movie3.png',
                name: 'Eternals',
                genre: 'Action',
                rating: 4.7,
              ),
              MovieCard(
                imageUrl: 'assets/image_movie4.png',
                name: 'Encanto',
                genre: 'Family',
                rating: 4.5,
              ),
              MovieCard(
                imageUrl: 'assets/image_movie5.png',
                name: 'Free Guy',
                genre: 'Action',
                rating: 4.8,
              ),
            ],
          ),
        ),
      );
    }

    Widget newMovies() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            const MovieTile(
              imageUrl: 'assets/image_movie1.png',
              name: 'Spiderman-Man: No Way Home',
              genre: 'Action',
              rating: 4.8,
            ),
            const MovieTile(
              imageUrl: 'assets/image_movie2.png',
              name: 'Dune',
              genre: 'Fiction',
              rating: 4.5,
            ),
            const MovieTile(
              imageUrl: 'assets/image_movie3.png',
              name: 'Eternals',
              genre: 'Action',
              rating: 4.7,
            ),
            const MovieTile(
              imageUrl: 'assets/image_movie4.png',
              name: 'Encanto',
              genre: 'Family',
              rating: 4.5,
            ),
            const MovieTile(
              imageUrl: 'assets/image_movie5.png',
              name: 'Free Guy',
              genre: 'Action',
              rating: 4.8,
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        popularMovies(),
        newMovies(),
      ],
    );
  }
}
