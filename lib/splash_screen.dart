import 'package:flutter/material.dart';
import 'package:ready_structure/core/di/locator.dart';
import 'package:ready_structure/core/services/navigation.dart';
import 'package:ready_structure/core/shared_prefs/app_shared_prefs.dart';
import 'package:ready_structure/core/theming/styles/fonts.dart';
import 'package:ready_structure/features/auth/presentation/screen/register_screen.dart';
import 'package:ready_structure/features/products/presentation/screen/products_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (locator<AppSharedPrefs>().isRememberMe) {
        locator<NavigationService>().pushAndRemoveUntil(const ProductsScreen());
      } else {
        locator<NavigationService>().pushAndRemoveUntil(const RegisterScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              "Welcome to splash screen",
              style: Styles.font14PrimaryColorWeight500(
                  color: Colors.black, fontSize: AppFontSize.fontSize_16),
            ),
          ],
        ),
      ),
    );
  }
}
