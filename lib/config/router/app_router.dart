import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/features/auth/screens/login_screen.dart';
import 'package:food_app/features/food/screens/dashboard_screen.dart';
import 'package:food_app/features/food/screens/order_screen.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    // Auth Routes

    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: SvgPicture.asset(
                    'assets/icons/home_outlined.svg',
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/icons/home_solid.svg',
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Order',
                  icon: SvgPicture.asset(
                    'assets/icons/bag_outlined.svg',
                  ),
                  activeIcon: SvgPicture.asset(
                    'assets/icons/bag_solid.svg',
                  ),
                ),
              ],
              currentIndex: navigationShell.currentIndex,
              onTap: (value) {
                navigationShell.goBranch(
                  value,
                  initialLocation: value == navigationShell.currentIndex,
                );
              },
            ),
          );
        },
        branches: [
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/dashboard',
                builder: (BuildContext context, GoRouterState state) =>
                    const DashboardScreen(),
                routes: const <RouteBase>[],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _sectionANavigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/order',
                builder: (BuildContext context, GoRouterState state) =>
                    const OrderScreen(),
                routes: const <RouteBase>[],
              ),
            ],
          ),
        ])
  ],
);
