import 'package:flutter/material.dart';
import 'package:food_app/config/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.child,
    this.width = double.infinity,
    this.height = 62,
  });

  final void Function()? onPressed;
  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.primaryOrange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          foregroundColor: Colors.white60,
        ),
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: child,
      ),
    );
  }
}
