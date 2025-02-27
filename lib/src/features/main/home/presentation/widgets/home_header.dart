import 'package:flutter/material.dart';
import 'package:cinemax/src/config/theme/colors.theme.dart';
import 'package:cinemax/src/config/theme/typography.theme.dart';
import 'package:cinemax/src/core/const/const.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Asset.avatar, height: 55),
        const SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Smith',
              style: AppTypography.heading4(color: Colors.white),
            ),
            Text(
              'Let’s stream your favorite movie',
              style: AppTypography.body(
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: AppColors.soft,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(Asset.heartIcon, height: 24),
          ),
        ),
      ],
    );
  }
}
