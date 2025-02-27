import 'package:flutter/material.dart';
import 'package:cinemax/src/config/theme/colors.theme.dart';
import 'package:cinemax/src/config/theme/typography.theme.dart';
import 'package:cinemax/src/core/const/const.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: SearchBar(
        trailing: [
          Container(width: 1.5, color: Colors.white, height: 20),
          IconButton(
            onPressed: () {},
            icon: Image.asset(Asset.filterIcon, height: 24),
          ),
        ],
        backgroundColor: WidgetStatePropertyAll(AppColors.soft),
        leading: Image.asset(Asset.searchIcon, height: 28),
        hintText: 'Search a title..',
        hintStyle: WidgetStatePropertyAll(
          AppTypography.heading4(color: Colors.grey),
        ),
        textStyle: WidgetStatePropertyAll(
          AppTypography.heading4(color: Colors.white),
        ),
      ),
    );
  }
}
