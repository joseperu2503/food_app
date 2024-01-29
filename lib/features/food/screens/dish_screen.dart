import 'package:flutter/material.dart';
import 'package:food_app/features/food/models/dish.dart';

class DishScreen extends StatelessWidget {
  const DishScreen({super.key, required this.dish});

  final Dish dish;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
