import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:mobile_app/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Initialize flutter_screenutil
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return AnimatedSplashScreen(
      nextScreen: const DrawerMenu(),
      splashTransition: SplashTransition.scaleTransition,
      duration: 300,
      splashIconSize: screenWidth * 0.8, // Adjust based on screen width
      curve: Curves.easeInOut, // Set the scaling curve
      animationDuration: const Duration(milliseconds: 1200), // Set the scaling duration
      splash: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Image.asset('images/logo.png'),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.2), // Adjust based on screen height
                Text(
                  'Black Sigatoka Detector',
                  style: TextStyle(
                    fontSize: screenWidth * 0.08, // Adjust based on screen width
                    fontWeight: FontWeight.bold,
                    wordSpacing: 1.5,
                    letterSpacing: 1.15,
                    fontFamily: 'GrenzeGotisch'
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}