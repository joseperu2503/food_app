import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/config/constants/app_fonts.dart';
import 'package:food_app/config/theme/app_theme.dart';
import 'package:food_app/features/food/models/dish.dart';

class DishCard extends ConsumerWidget {
  const DishCard({
    super.key,
    required this.dish,
  });

  final Dish dish;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          elevation: 0,
          context: context,
          barrierColor: const Color.fromRGBO(50, 50, 77, 0.3),
          builder: (context) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                ),
                height: height - safeAreaPadding.top - 66,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(26),
                    topRight: Radius.circular(26),
                  ),
                  child: Scaffold(
                    bottomSheet: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      height: safeAreaPadding.bottom + 86,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: AppColors.neutral0,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, -10),
                            blurRadius: 20,
                            spreadRadius: 0,
                            color: Color.fromRGBO(220, 220, 228, 0.30),
                          ),
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5,
                            spreadRadius: 0,
                            color: Color.fromRGBO(12, 26, 75, 0.02),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.primary600,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Add to order',
                                  style: AppTheme.mediumButton(
                                    color: AppColors.neutral0,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  ' \$20.00',
                                  style: AppTheme.mediumButton(
                                    color: AppColors.neutral0,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    body: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            top: 21,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                          ),
                          height: 34,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 5,
                                width: 134,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.neutral300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 41,
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                          width: 170,
                                          height: 170,
                                          child: Image.network(
                                            dish.image,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 31,
                                      top: 16,
                                      child: Container(
                                        width: 52,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          color: AppColors.neutral0,
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(0, 10),
                                              blurRadius: 16,
                                              spreadRadius: 0,
                                              color: Color.fromRGBO(
                                                  20, 37, 63, 0.06),
                                            ),
                                            BoxShadow(
                                              offset: Offset(0, 0),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                              color: Color.fromRGBO(
                                                  12, 26, 75, 0.05),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/star.svg',
                                              width: 12,
                                              height: 12,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                              dish.ranking.toStringAsFixed(1),
                                              style: const TextStyle(
                                                fontFamily: AppFonts.mulish,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.neutral500,
                                                height: 12 / 14,
                                                leadingDistribution:
                                                    TextLeadingDistribution
                                                        .even,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 24,
                                    horizontal: 24,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Avocado and \nEgg Toast',
                                            style: TextStyle(
                                              fontFamily: AppFonts.mulish,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: isDarkMode
                                                  ? AppColors.neutral800
                                                  : AppColors.neutral800,
                                              height: 30 / 20,
                                              leadingDistribution:
                                                  TextLeadingDistribution.even,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '\$',
                                                style: TextStyle(
                                                  fontFamily: AppFonts.mulish,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.tertiary200,
                                                  height: 15 / 13,
                                                  leadingDistribution:
                                                      TextLeadingDistribution
                                                          .even,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                dish.price.toStringAsFixed(2),
                                                style: AppTheme.priceLarge(
                                                  color: AppColors.tertiary700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        'You won\'t skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ',
                                        style: AppTheme.body2(
                                          color: AppColors.neutral600,
                                        ),
                                      ),
                                      Text(
                                        'You won\'t skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ',
                                        style: AppTheme.body2(
                                          color: AppColors.neutral600,
                                        ),
                                      ),
                                      Text(
                                        'You won\'t skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ',
                                        style: AppTheme.body2(
                                          color: AppColors.neutral600,
                                        ),
                                      ),
                                      Text(
                                        'You won\'t skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ',
                                        style: AppTheme.body2(
                                          color: AppColors.neutral600,
                                        ),
                                      ),
                                      Text(
                                        'You won\'t skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast. ',
                                        style: AppTheme.body2(
                                          color: AppColors.neutral600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: safeAreaPadding.bottom + 86,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Stack(
        children: [
          Container(
            width: 142,
            padding: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isDarkMode ? AppColors.neutral700 : AppColors.neutral0,
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
                    color:
                        isDarkMode ? AppColors.neutral0 : AppColors.neutral800,
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
                    width: 10,
                    height: 10,
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
      ),
    );
  }
}
