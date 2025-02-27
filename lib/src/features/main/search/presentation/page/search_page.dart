import 'package:cinemax/src/config/theme/colors.theme.dart';
import 'package:cinemax/src/config/theme/typography.theme.dart';
import 'package:cinemax/src/core/const/const.dart';
import 'package:cinemax/src/features/main/home/presentation/page/movie_detail.page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> category = [
    'All',
    'Comedy',
    'Documentation',
    'Animation',
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchInput(),
            const SizedBox(
              height: 12.0,
            ),
            CategorySelector(
              categories: category,
              selectedIndex: selectedIndex,
              onCategorySelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            TodayMovie(),
            const SizedBox(
              height: 20.0,
            ),
            CategorySection(),
          ],
        ),
      ),
    ));
  }
}

// Widget SearchInput
class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      padding: WidgetStatePropertyAll(const EdgeInsets.only(left: 20)),
      backgroundColor: WidgetStatePropertyAll(AppColors.soft),
      hintText: 'Type title, categories, years, etc',
      hintStyle: WidgetStatePropertyAll(AppTypography.body(color: Colors.grey)),
      leading: ImageIcon(
        AssetImage(Asset.searchIcon),
        color: Colors.grey,
      ),
    );
  }
}

// Widget Category
class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;
  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.soft.withValues(alpha: 0.2),
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, int index) {
            bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () => onCategorySelected(index),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.soft : Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: AppTypography.heading4(
                      color: isSelected ? Colors.blueAccent : Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

// widget today movie
class TodayMovie extends StatelessWidget {
  const TodayMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Today',
        style: AppTypography.heading3(
          color: Colors.white,
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              child: Image.asset(
                height: 180,
                Asset.detailSpidermanMovie,
              )),
          const SizedBox(
            width: 20.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Premium',
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.heading4(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Spider-Man No Way Home',
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.heading4(color: Colors.white),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '2025',
                      style: AppTypography.body(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse_sharp,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '148 Minutes',
                      style: AppTypography.body(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.video_collection_outlined,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Action',
                      style: AppTypography.body(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: 15,
                      width: 2,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Action',
                      style: AppTypography.body(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title "Most Popular"
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recomended For You',
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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // itemCount: movies.length,
            itemBuilder: (context, index) {
              // final movie = movies[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MovieDetailPage()),
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
                        child: Image.asset(
                          Asset.detailSpidermanMovie,
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
                              'Spiderman',
                              style: AppTypography.heading4(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Action',
                              style: AppTypography.body(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
