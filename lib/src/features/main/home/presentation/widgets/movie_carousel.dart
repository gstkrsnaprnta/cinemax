import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemax/src/features/main/home/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/img5.jpeg',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 2),
        enableInfiniteScroll: true,
      ),
      items: imgList.map((imagePath) {
        return MovieCard(imagePath: imagePath);
      }).toList(),
    );
  }
}
