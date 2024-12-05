// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_app/output_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetectSplash extends StatefulWidget {
  final File image;
  final String outputLabel;

  const DetectSplash(this.image, this.outputLabel, {Key? key}) : super(key: key);

  @override
  DetectSplashState createState() => DetectSplashState();
}

class DetectSplashState extends State<DetectSplash> {
  @override
  void initState() {
    super.initState();
    _processAndNavigate(context);
  }

  Future<void> _processAndNavigate(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => OutputScreen(widget.outputLabel, widget.image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Material( // Wrap the entire widget tree with Material
      color: Colors.transparent, // Set color to transparent to avoid affecting the appearance
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight * 0.52,
              color: const Color(0xFF21985F),
              child: Stack(
                children: [
                  Positioned(
                    top: screenHeight * 0.07,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth * 1.5,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.white,
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        const Text(
                          'SCANNING IMAGE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'RubikMoonrocks',
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Container(
                          width: screenWidth * 1.5,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.white,
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenHeight * 0.26,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Center(
                  child: SizedBox(
                    height: screenHeight * 0.50,
                    child: Container(
                      width: screenWidth * 0.78,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: screenWidth * 0.005,
                            blurRadius: screenWidth * 0.01,
                            offset: const Offset(0, 3),
                            blurStyle: BlurStyle.inner,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.78,
                            height: screenHeight * 0.36,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: screenHeight * 0),
                                  child: Center(
                                    child: ClipRect(
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center,
                                        child: Image.file(
                                          widget.image,
                                          fit: BoxFit.cover,
                                          width: screenWidth * 0.78,
                                          height: screenHeight * 0.36,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Transform.scale(
                                  scale: 1.25, // Adjust the scale factor as needed
                                  child: Lottie.asset(
                                    'animation/scanner.json',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                            child: Container(
                              height: screenHeight * 0.1,
                              decoration: BoxDecoration(
                                color: const Color(0xFF21985F),
                                borderRadius: BorderRadius.circular(screenWidth * 0.03),
                              ),
                              child: Center(
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    WavyAnimatedText(
                                      'Detecting...',
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.05,
                                        fontFamily: 'Trocchi',
                                        letterSpacing: 8,
                                      ),
                                      speed: const Duration(milliseconds: 300),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
