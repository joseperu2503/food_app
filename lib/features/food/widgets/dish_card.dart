import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/config/constants/app_fonts.dart';
import 'package:food_app/config/theme/app_theme.dart';
import 'package:food_app/features/food/models/dish.dart';

class DishCard extends StatelessWidget {
  const DishCard({
    super.key,
    required this.dish,
  });

  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 142,
          padding: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.neutral0,
            boxShadow: AppColors.shadowCard,
          ),
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  dish.image,
                ),
              ),
              Text(
                dish.name,
                style: AppTheme.subtitle3(
                  color: AppColors.neutral800,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '\$',
                    style: TextStyle(
                      fontFamily: AppFonts.mulish,
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: AppColors.tertiary200,
                      height: 15 / 8,
                      leadingDistribution: TextLeadingDistribution.even,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    dish.price.toStringAsFixed(2),
                    style: AppTheme.priceSmall(
                      color: AppColors.tertiary700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            width: 42,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.neutral0,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 8.265),
                  blurRadius: 13.224,
                  spreadRadius: 0,
                  color: Color.fromRGBO(20, 37, 63, 0.06),
                ),
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 8.265,
                  spreadRadius: 0,
                  color: Color.fromRGBO(12, 26, 75, 0.05),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/star.svg',
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  dish.ranking.toStringAsFixed(1),
                  style: const TextStyle(
                    fontFamily: AppFonts.mulish,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.neutral500,
                    height: 10 / 11,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
