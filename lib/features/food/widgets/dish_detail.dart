import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/config/constants/app_fonts.dart';
import 'package:food_app/config/theme/app_theme.dart';
import 'package:food_app/features/food/models/dish.dart';
import 'package:food_app/features/food/models/topping.dart';
import 'package:food_app/features/food/widgets/topping_item.dart';

class DishDetail extends ConsumerWidget {
  const DishDetail({
    super.key,
    required this.dish,
  });
  final Dish dish;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;
    double height = MediaQuery.of(context).size.height;

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
            bottomSheet: _BottomSheet(safeAreaPadding: safeAreaPadding),
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
                                  borderRadius: BorderRadius.circular(14),
                                  color: AppColors.neutral0,
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 16,
                                      spreadRadius: 0,
                                      color: Color.fromRGBO(20, 37, 63, 0.06),
                                    ),
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 10,
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
                                            TextLeadingDistribution.even,
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
                            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                              TextLeadingDistribution.even,
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
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: 58,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColors.neutral0,
                                ),
                                child: CustomScrollView(
                                  scrollDirection: Axis.horizontal,
                                  slivers: [
                                    SliverFillRemaining(
                                      child: Row(
                                        children: [
                                          ...nutritionalInformation.entries
                                              .map((entry) {
                                            return Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    entry.key,
                                                    style: AppTheme
                                                        .cardsDetailsLarge(
                                                      color:
                                                          AppColors.primary700,
                                                    ),
                                                  ),
                                                  Text(
                                                    entry.value
                                                        .toStringAsFixed(0),
                                                    style: AppTheme
                                                        .cardsDetailsSmall(
                                                      color:
                                                          AppColors.neutral600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }).toList(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Add toppings',
                                style: AppTheme.subtitle2(
                                  color: AppColors.neutral600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        sliver: SliverList.separated(
                          itemBuilder: (context, index) {
                            final topping = toppings[index];

                            return ToppingItem(topping: topping);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                          itemCount: toppings.length,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 30,
                            left: 24,
                            right: 24,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add a request',
                                style: AppTheme.subtitle2(
                                  color: AppColors.neutral600,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                height: 82,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.neutral150,
                                  ),
                                  color: AppColors.neutral0,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Ex: Don’t add onion',
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                    hintStyle: AppTheme.inputPlaceholderDefault(
                                      color: AppColors.neutral500,
                                    ),
                                  ),
                                  style: AppTheme.inputPlaceholderDefault(
                                    color: AppColors.neutral700,
                                  ),
                                  maxLines: null,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 24,
                        ),
                      )
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
  }
}

class _BottomSheet extends ConsumerWidget {
  const _BottomSheet({
    required this.safeAreaPadding,
  });

  final EdgeInsets safeAreaPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Container(
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
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.neutral100,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/minus.svg',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 14,
                ),
                Text(
                  '2',
                  style: TextStyle(
                    fontFamily: AppFonts.mulish,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode
                        ? AppColors.neutral500
                        : AppColors.neutral500,
                    height: 22 / 14,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                SvgPicture.asset(
                  'assets/icons/plus.svg',
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.primary600,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          )
        ],
      ),
    );
  }
}

const Map<String, double> nutritionalInformation = {
  'Kcal': 400,
  'grams': 510,
  'proteins': 30,
  'carbs': 56,
  'fats': 24,
};

List<Topping> toppings = [
  Topping(name: 'Extra eggs', price: 4.2),
  Topping(name: 'Extra spinach', price: 2.8),
  Topping(name: 'Extra avocado', price: 5.4),
  Topping(name: 'Extra bread', price: 1.8),
  Topping(name: 'Extra tomato', price: 2.1),
  Topping(name: 'Extra cucumber', price: 1.6),
  Topping(name: 'Extra olives', price: 3.5),
  Topping(name: 'Extra pepper', price: 1.5),
];
