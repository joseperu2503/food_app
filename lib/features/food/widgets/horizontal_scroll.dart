import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/config/theme/app_theme.dart';
import 'package:food_app/features/food/data/dishes.dart';
import 'package:food_app/features/food/models/dish.dart';
import 'package:food_app/features/food/widgets/dish_card.dart';

class HorizontalScroll extends ConsumerWidget {
  const HorizontalScroll({
    super.key,
    required this.label,
    required this.category,
  });

  final String label;
  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    final filteredDishes = dishes
        .where(
          (dish) => dish.category == category,
        )
        .toList();
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text(
                label,
                style: AppTheme.subtitle2(
                  color:
                      isDarkMode ? AppColors.neutral200 : AppColors.neutral600,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 174,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final dish = filteredDishes[index];

                  return DishCard(dish: dish);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
                itemCount: filteredDishes.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
