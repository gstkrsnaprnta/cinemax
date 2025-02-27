import 'package:cinemax/src/core/resources/data_state.dart';
import 'package:cinemax/src/features/main/home/domain/entities/get_movie.entity.dart';
import 'package:cinemax/src/features/main/home/presentation/page/movie_detail.page.dart';
import 'package:cinemax/src/features/main/home/presentation/providers/get_movie.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemax/src/config/theme/colors.theme.dart';
import 'package:cinemax/src/config/theme/typography.theme.dart';

class CategorySection extends ConsumerStatefulWidget {
  const CategorySection({super.key});

  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends ConsumerState<CategorySection> {
  final List<String> categories = ["All", "Comedy", "Animation", "Documentary"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final moviesState = ref.watch(getMoviesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category',
          style: AppTypography.heading3(color: Colors.white),
        ),
        const SizedBox(height: 10),
        // Kategori Film
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.soft.withOpacity(0.3),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              bool isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.soft : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: AppTypography.body(
                        color: isSelected ? Colors.blueAccent : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        // Title "Most Popular"
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Most Popular',
              style: AppTypography.heading3(color: Colors.white),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'See All',
                style: AppTypography.body(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: 365,
          child: moviesState.when(
            data: (dataState) {
              if (dataState is DataSuccess) {
                final movies = dataState.data!;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailPage()),
                        );
                      },
                      child: Container(
                        width: 200,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                height: 280,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title ?? '',
                                    style: AppTypography.heading4(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Action',
                                    style:
                                        AppTypography.body(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text("Failed to load movies",
                      style: TextStyle(color: Colors.white)),
                );
              }
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Text("Error: $error",
                  style: const TextStyle(color: Colors.red)),
            ),
          ),
        ),
      ],
    );
  }
}
