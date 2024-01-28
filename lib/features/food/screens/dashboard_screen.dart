import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/config/constants/app_fonts.dart';
import 'package:food_app/config/theme/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                children: [
                  Text(
                    'Choose the best dish for you',
                    style: AppTheme.heading2(
                      color: AppColors.neutral800,
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
                      color: AppColors.neutral0,
                      border: Border.all(
                        width: 1,
                        color: AppColors.neutral150,
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
                            color: AppColors.neutral500,
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
                      color: AppColors.neutral900,
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
                                  color: AppColors.neutral400,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Avocado Chicken Salad',
                                style: AppTheme.heading5(
                                  color: AppColors.neutral0,
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
                                      fontWeight: FontWeight.w600,
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
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromRGBO(255, 255, 255, 0.04),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 130,
                                      height: 130,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.06),
                                      ),
                                      child: Image.asset(
                                          'assets/images/dishes/dish1.png'),
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
                  final dish = dishes[index];
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
                            color: index == 0
                                ? AppColors.neutral0
                                : AppColors.neutral600,
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
                itemCount: dishes.length,
              ),
            ),
          ),
          SliverList.separated(
            itemBuilder: (context, index) {
              return Container();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 8,
              );
            },
            itemCount: dishes.length,
          )
        ],
      ),
    );
  }
}

const List<String> dishes = ['All Dishes', 'Most Popular', 'Salad', 'Pasta'];
