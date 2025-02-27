import 'package:cinemax/src/config/theme/colors.theme.dart';
import 'package:cinemax/src/config/theme/typography.theme.dart';
import 'package:cinemax/src/core/const/const.dart';
import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Asset.detailSpidermanMovie),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.soft.withOpacity(0.5),
                  Colors.black.withOpacity(1),
                ],
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 50.0),
                    _buildMoviePoster(),
                    const SizedBox(height: 30.0),
                    _buildMovieInfo(),
                    const SizedBox(height: 20.0),
                    _buildRating(),
                    const SizedBox(height: 20.0),
                    _buildActionButtons(),
                    const SizedBox(height: 20.0),
                    _buildStoryLine(),
                    const SizedBox(height: 20.0),
                    _castAndCrew(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon:
              const Icon(Icons.arrow_back_ios, size: 25.0, color: Colors.white),
        ),
        Text(
          'Spider-Man No Way...',
          style: AppTypography.heading2(color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(Asset.heartIcon, height: 24),
        ),
      ],
    );
  }

  Widget _buildMoviePoster() {
    return Container(
      height: 350,
      width: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Asset.detailSpidermanMovie),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildMovieInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconText(Icons.calendar_month, '2021'),
        const SizedBox(width: 20.0),
        _buildIconText(Icons.timer, '148 Minutes'),
        const SizedBox(width: 20.0),
        _buildIconText(Icons.movie, 'Action'),
      ],
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 8.0),
        Text(text, style: AppTypography.body(color: Colors.white)),
      ],
    );
  }

  Widget _buildRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Colors.yellow),
        const SizedBox(width: 8.0),
        Text('4.5',
            style: AppTypography.body(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildActionButton(Icons.play_arrow, 'Play', Colors.orange),
        const SizedBox(width: 12.0),
        _buildIconActionButton(Icons.download),
        const SizedBox(width: 12.0),
        _buildIconActionButton(Icons.share),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(50.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24, color: Colors.white),
            Text(label, style: AppTypography.heading4(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildIconActionButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.soft, borderRadius: BorderRadius.circular(30)),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, size: 30, color: Colors.white),
      ),
    );
  }

  Widget _buildStoryLine() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Story Line', style: AppTypography.heading3(color: Colors.white)),
        const SizedBox(height: 10.0),
        Center(
          child: Text(
            'For the first time in the cinematic history of Spider-Man, our friendly neighborhood heros identity is revealed, bringing his Super Hero responsibilities into conflict with his normal life and putting those he cares about most at risk. More',
            style: AppTypography.body(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  Widget _castAndCrew() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cast and Crew',
            style: AppTypography.heading3(color: Colors.white)),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Asset.avatar,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jon Watts',
                          style: AppTypography.heading3(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Directors',
                          style: AppTypography.heading4(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                  ],
                );
              }),
        )
      ],
    );
  }
}
