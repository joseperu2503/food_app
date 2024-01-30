import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/config/theme/app_theme.dart';

enum ButtonSize { medium, small }

enum ButtonType { primary, secondary }

List<ButtonTypeStyle> buttonTypes = [
  ButtonTypeStyle(
    buttonType: ButtonType.primary,
    color: AppColors.primary600,
    colorDark: AppColors.primary600,
    textColor: AppColors.neutral0,
    textColorDark: AppColors.neutral0,
  ),
];

class CustomButton extends ConsumerWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.width = double.infinity,
    this.size = ButtonSize.medium,
    this.type = ButtonType.primary,
    this.textMedium,
    this.textSemibold,
    this.withArrow = false,
  });

  final void Function()? onPressed;
  final double width;

  final ButtonSize size;
  final ButtonType type;
  final String? textMedium;
  final String? textSemibold;
  final bool withArrow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonTypeStyle = buttonTypes.firstWhere((b) => b.buttonType == type);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Container(
      height: size == ButtonSize.medium ? 54 : 46,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 20,
          foregroundColor: isDarkMode
              ? buttonTypeStyle.textColorDark
              : buttonTypeStyle.textColor,
          backgroundColor:
              isDarkMode ? buttonTypeStyle.colorDark : buttonTypeStyle.color,
        ),
        onPressed: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Wrap(
          spacing: 8,
          children: [
            if (textMedium != null)
              Text(
                textMedium!,
                style: AppTheme.mediumButton(),
              ),
            if (textSemibold != null)
              Text(
                textSemibold!,
                style: AppTheme.extraButton(),
              ),
            if (withArrow)
              SvgPicture.asset(
                'assets/icons/arrow-right.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  isDarkMode
                      ? buttonTypeStyle.textColorDark
                      : buttonTypeStyle.textColor,
                  BlendMode.srcIn,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ButtonTypeStyle {
  final ButtonType buttonType;
  final Color color;
  final Color colorDark;
  final Color textColor;
  final Color textColorDark;

  ButtonTypeStyle({
    required this.buttonType,
    required this.color,
    required this.colorDark,
    required this.textColor,
    required this.textColorDark,
  });
}
