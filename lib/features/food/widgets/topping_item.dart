import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/config/constants/app_fonts.dart';
import 'package:food_app/config/theme/app_theme.dart';
import 'package:food_app/features/food/models/topping.dart';

class ToppingItem extends ConsumerWidget {
  const ToppingItem({
    super.key,
    required this.topping,
  });

  final Topping topping;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.neutral0,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            spreadRadius: -2,
            color: Color.fromRGBO(50, 50, 71, 0.04),
          ),
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 0,
            color: Color.fromRGBO(12, 26, 75, 0.03),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 19,
            width: 19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.5),
              border: Border.all(
                width: 1,
                color: AppColors.neutral300,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            topping.name,
            style: TextStyle(
              fontFamily: AppFonts.mulish,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? AppColors.neutral600 : AppColors.neutral600,
              height: 20 / 14,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          const Spacer(),
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
                topping.price.toStringAsFixed(2),
                style: AppTheme.priceSmall(
                  color: AppColors.tertiary700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
