import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/config/constants/app_fonts.dart';
import 'package:food_app/config/theme/app_theme.dart';
import 'package:food_app/features/food/models/dish.dart';
import 'package:food_app/features/food/widgets/horizontal_scroll.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 44,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location-point.svg',
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Gram Bistro',
                          style: AppTheme.heading5(
                            color: isDarkMode
                                ? AppColors.neutral200
                                : AppColors.neutral500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Choose the best dish for you',
                    style: AppTheme.heading2(
                      color: isDarkMode
                          ? AppColors.neutral0
                          : AppColors.neutral800,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 54,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: isDarkMode
                          ? const Color.fromRGBO(74, 74, 106, 0.3)
                          : AppColors.neutral0,
                      border: Border.all(
                        width: 1,
                        color: isDarkMode
                            ? AppColors.neutral600
                            : AppColors.neutral150,
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/search.svg',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Search',
                          style: AppTheme.inputPlaceholderDefault(
                            color: isDarkMode
                                ? AppColors.neutral200
                                : AppColors.neutral500,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          'assets/icons/filter.svg',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 145,
                    padding: const EdgeInsets.only(left: 22),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? AppColors.neutral150
                          : AppColors.neutral900,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 148,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product of the day',
                                style: AppTheme.caption3(
                                  color: isDarkMode
                                      ? AppColors.neutral500
                                      : AppColors.neutral400,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Avocado Chicken Salad',
                                style: AppTheme.heading5(
                                  color: isDarkMode
                                      ? AppColors.neutral800
                                      : AppColors.neutral0,
                                ),
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '\$',
                                    style: TextStyle(
                                      fontFamily: AppFonts.mulish,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.tertiary200,
                                      height: 15 / 9,
                                      leadingDistribution:
                                          TextLeadingDistribution.even,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '10.40',
                                    style: AppTheme.priceMedium(
                                      color: AppColors.tertiary700,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 141,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: -9,
                                child: Container(
                                  width: 162,
                                  height: 162,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isDarkMode
                                        ? AppColors.neutral800.withOpacity(0.04)
                                        : AppColors.black.withOpacity(0.04),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 130,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isDarkMode
                                            ? AppColors.neutral800
                                                .withOpacity(0.05)
                                            : AppColors.black.withOpacity(0.06),
                                      ),
                                      child: Image.network(
                                        'https://files.joseperezgil.com/images/dishes/dish1.png',
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 44,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final dish = categories[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: index == 0
                            ? AppColors.secondary700
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text(
                          dish,
                          style: TextStyle(
                            fontFamily: AppFonts.mulish,
                            fontSize: 16,
                            fontWeight:
                                index == 0 ? FontWeight.w700 : FontWeight.w500,
                            color: isDarkMode
                                ? (index == 0
                                    ? AppColors.neutral800
                                    : AppColors.neutral100)
                                : (index == 0
                                    ? AppColors.neutral0
                                    : AppColors.neutral600),
                            height: 20 / 16,
                            leadingDistribution: TextLeadingDistribution.even,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 8,
                  );
                },
                itemCount: categories.length,
              ),
            ),
          ),
          const HorizontalScroll(
            category: Category.mostPopular,
            label: 'Most Popular',
          ),
          const HorizontalScroll(
            category: Category.salad,
            label: 'Salad',
          ),
          const HorizontalScroll(
            category: Category.pasta,
            label: 'Pasta',
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: safeAreaPadding.bottom + 10,
            ),
          )
        ],
      ),
    );
  }
}

const List<String> categories = [
  'All Dishes',
  'Most Popular',
  'Salad',
  'Pasta'
];
