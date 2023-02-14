import 'package:chat_app_gpt/constant/app_assets.dart';
import 'package:chat_app_gpt/screen/onboardingScreen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(logoWidth: 180,
      logo: Image.asset(AppAssets.splashLogo),
      showLoader: true,
      backgroundImage: const AssetImage(AppAssets.splashBG),
      navigator: OnBoarding(),
      loaderColor: Colors.white,
      durationInSeconds: 3,
    );
  }
}
