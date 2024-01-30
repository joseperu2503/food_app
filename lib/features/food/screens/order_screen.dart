import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/config/theme/app_theme.dart';
import 'package:food_app/features/food/data/dishes.dart';
import 'package:food_app/features/food/widgets/order_item.dart';
import 'package:food_app/features/shared/widgets/custom_button.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: safeAreaPadding.top + 20,
        ),
        child: Column(
          children: [
            Text(
              'My Order',
              style: AppTheme.heading2(
                color: isDarkMode ? AppColors.neutral0 : AppColors.neutral800,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                itemBuilder: (context, index) {
                  final dish = dishes[index];
                  return OrderItem(dish: dish);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: 6,
              ),
            ),
            CustomButton(
              textMedium: 'Send order',
              withArrow: true,
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
