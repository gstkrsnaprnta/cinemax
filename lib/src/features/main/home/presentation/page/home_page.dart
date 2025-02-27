import 'package:cinemax/src/features/main/home/presentation/widgets/category_section.dart';
import 'package:cinemax/src/features/main/home/presentation/widgets/home_header.dart';
import 'package:cinemax/src/features/main/home/presentation/widgets/movie_carousel.dart';
import 'package:cinemax/src/features/main/home/presentation/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              const SizedBox(height: 20.0),
              SearchBarWidget(),
              const SizedBox(height: 20.0),
              MovieCarousel(),
              CategorySection(),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
