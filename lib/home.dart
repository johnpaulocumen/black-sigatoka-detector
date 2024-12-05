// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app/home_backend.dart';
import 'package:mobile_app/neumorphic_button.dart';
import 'package:mobile_app/app_state.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/detect_screen.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key,});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  final picker = ImagePicker();
  late File _image;
  bool isPressed1 = false;
  bool isPressed2 = false;
  double iconSize = 40.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late DetectionModel detectionModel;

  @override
  void initState() {
    super.initState();
    detectionModel = DetectionModel(this);
    detectionModel.loadModel();
  }

  Future<void> pickImage(ImageSource source) async {
    final image = await picker.pickImage(source: source);
    if (image == null) return;

    setState(() {
      _image = File(image.path);
    });

    final result = await detectionModel.detectImage(_image);

    if (result != null) {
      Provider.of<AppState>(context, listen: false)
          .updateHistory(DateTime.now(), result);
    }

    Navigator.of(_scaffoldKey.currentContext!).push(
      MaterialPageRoute(
        builder: (context) => DetectScreen(image: _image, outputLabel: result ?? 'N/A'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.grey.shade300,
          body: Stack(
            children: [
              // Container with your design
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(color: Colors.white),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0.w,
                      top: 100.h,
                      child: Container(
                        width: 360.w,
                        height: 690.h,
                        decoration: ShapeDecoration(
                          color: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.w),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 90.w,
                      top: 40.h,
                      child: SizedBox(
                        width: 295.w,
                        height: 60.h,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                            });
                          },
                          child: Text(
                            'BLACK SIGATOKA\nDETECTOR',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp, // Use .sp for font size scaling
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              wordSpacing: 6,
                              letterSpacing: 4,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Lottie Animation
              Positioned(
                left: 0.w,
                top: 150.h,
                child: GestureDetector(
                  onTap: () {
                    // Show AlertDialog when animation is tapped
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Reminder'),
                          content: const Text(
                            'To improve the disease recognition accuracy, please ensure that the image is focused only on the banana leaves.',
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: SizedBox(
                    width: 360.w,
                    height: 360.h,
                    child: Lottie.asset(
                      'animation/animation.json',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              // Buttons wrapped in Neumorphic
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 60.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildNeumorphicButton('images/camera.png', isPressed1, iconSize, () async {
                        setState(() {
                          isPressed1 = !isPressed1;
                        });

                        // Add a bit of delay before going to the camera
                        await Future.delayed(const Duration(milliseconds: 300), () async {
                          await pickImage(ImageSource.camera); // Call the pickImage function
                          // Return the button to its original state
                          setState(() {
                            isPressed1 = !isPressed1;
                          });
                        });
                      }),
                      const SizedBox(width: 60),
                      buildNeumorphicButton('images/gallery.png', isPressed2, iconSize, () async {
                        setState(() {
                          isPressed2 = !isPressed2;
                        });

                        // Add a bit of delay before going to the gallery
                        await Future.delayed(const Duration(milliseconds: 300), () async {
                          await pickImage(ImageSource.gallery); // Call the pickImage function
                          // Return the button to its original state
                          setState(() {
                            isPressed2 = !isPressed2;
                          });
                        });
                      }),

                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
