import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/config/constants/app_colors.dart';
import 'package:food_app/features/auth/widgets/input_email.dart';
import 'package:food_app/features/auth/widgets/input_password.dart';
import 'package:food_app/features/shared/inputs/email.dart';
import 'package:food_app/features/shared/inputs/password.dart';
import 'package:food_app/features/shared/widgets/checkbox.dart';
import 'package:food_app/features/shared/widgets/custom_button_2.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    EdgeInsets safeAreaPadding = MediaQuery.of(context).padding;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: AppColors.darkBlue,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/elipse.svg',
                          width: 177,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 118 + safeAreaPadding.top,
                            bottom: 50,
                          ),
                          width: double.infinity,
                          color: Colors.transparent,
                          child: const Column(
                            children: [
                              Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                  height: 36 / 30,
                                  leadingDistribution:
                                      TextLeadingDistribution.even,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Please sign in to your existing account',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                  height: 26 / 16,
                                  leadingDistribution:
                                      TextLeadingDistribution.even,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          color: AppColors.darkBlue,
                          height: 40,
                        ),
                        Container(
                          height: double.infinity,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            top: 24,
                            right: 24,
                            left: 24,
                            bottom: 39,
                          ),
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'EMAIL',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.text1,
                                  height: 16 / 13,
                                  leadingDistribution:
                                      TextLeadingDistribution.even,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              InputEmail(
                                value: const Email.pure(''),
                                onChanged: (value) {},
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              const Text(
                                'PASSWORD',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.text1,
                                  height: 16 / 13,
                                  leadingDistribution:
                                      TextLeadingDistribution.even,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              InputPassword(
                                value: const Password.pure(''),
                                onChanged: (value) {},
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomCheckbox(
                                    value: true,
                                    onChanged: (value) {},
                                    label: 'Remember me ',
                                  ),
                                  const Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryOrange,
                                      height: 17 / 14,
                                      leadingDistribution:
                                          TextLeadingDistribution.even,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 29,
                              ),
                              CustomButton2(
                                child: const Text(
                                  'LOG IN',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                    height: 17 / 14,
                                    leadingDistribution:
                                        TextLeadingDistribution.even,
                                  ),
                                ),
                                onPressed: () {
                                  context.push('/dashboard');
                                },
                              ),
                              const SizedBox(
                                height: 38,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don’t have an account?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.text2,
                                      height: 24 / 16,
                                      leadingDistribution:
                                          TextLeadingDistribution.even,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.primaryOrange,
                                      height: 17 / 14,
                                      leadingDistribution:
                                          TextLeadingDistribution.even,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 27,
                              ),
                              const Center(
                                child: Text(
                                  'Or',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.text2,
                                    height: 24 / 16,
                                    leadingDistribution:
                                        TextLeadingDistribution.even,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/facebook.svg',
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/twitter.svg',
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/apple.svg',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
