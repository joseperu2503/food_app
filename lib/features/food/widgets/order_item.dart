import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/config/constants/app_fonts.dart';
import 'package:food_app/config/theme/app_theme.dart';
import 'package:food_app/features/food/models/dish.dart';

class OrderItem extends ConsumerWidget {
  const OrderItem({
    super.key,
    required this.dish,
  });
  final Dish dish;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: AppColors.secondary700,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.only(
            right: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/icons/trash.svg',
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.neutral0,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
        Dismissible(
          key: const ValueKey(1),
          onDismissed: (direction) {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(50, 50, 71, 0.04),
                  offset: Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: -2,
                ),
                BoxShadow(
                  color: Color.fromRGBO(12, 26, 75, 0.03),
                  offset: Offset(0, 0),
                  blurRadius: 1,
                  spreadRadius: 0,
                ),
              ],
              color: AppColors.neutral0,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    dish.image,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Avocado and Egg Toast',
                        style: AppTheme.subtitle3(
                          color: isDarkMode
                              ? AppColors.neutral0
                              : AppColors.neutral800,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/star.svg',
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            dish.ranking.toStringAsFixed(1),
                            style: const TextStyle(
                              fontFamily: AppFonts.mulish,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.neutral500,
                              height: 16 / 12,
                              leadingDistribution: TextLeadingDistribution.even,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            '(120 reviews)',
                            style: TextStyle(
                              fontFamily: AppFonts.mulish,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.neutral300,
                              height: 16 / 12,
                              leadingDistribution: TextLeadingDistribution.even,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
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
                const SizedBox(
                  width: 12,
                ),
                Column(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.tertiary50,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {},
                        child: SvgPicture.asset(
                          'assets/icons/minus.svg',
                          width: 18,
                          height: 18,
                          colorFilter: const ColorFilter.mode(
                            AppColors.tertiary700,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                        fontFamily: AppFonts.mulish,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode
                            ? AppColors.neutral600
                            : AppColors.neutral600,
                        height: 20 / 14,
                        leadingDistribution: TextLeadingDistribution.even,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.tertiary50,
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {},
                        child: SvgPicture.asset(
                          'assets/icons/plus.svg',
                          width: 18,
                          height: 18,
                          colorFilter: const ColorFilter.mode(
                            AppColors.tertiary700,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
