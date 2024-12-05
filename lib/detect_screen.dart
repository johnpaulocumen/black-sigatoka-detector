import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mobile_app/detect_splash.dart';

class DetectScreen extends StatefulWidget {
  final File image;
  final String outputLabel;

  const DetectScreen({
    Key? key,
    required this.image,
    required this.outputLabel,
  }) : super(key: key);

  @override
  DetectScreenState createState() => DetectScreenState();
}

class DetectScreenState extends State<DetectScreen> {

  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    // Initialize flutter_screenutil for DetectScreen
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return Scaffold(
      backgroundColor: const Color(0xFF21985F),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: 0.w,
              bottom: ScreenUtil().setHeight(5),
              child: Container(
                width: ScreenUtil().setWidth(360),
                height: ScreenUtil().setHeight(690),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(50)),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: ScreenUtil().setWidth(3),
                      offset: Offset(0, ScreenUtil().setHeight(1)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: ScreenUtil().setWidth(340),
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.file(
                      widget.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Swipeable buttons at the bottom of the Scaffold
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SwipeableButtonView(
              buttonText: 'ANALYZE IMAGE',
              buttontextstyle: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Colors.white,
                fontFamily: 'Lekton',
                fontWeight: FontWeight.w600,
                letterSpacing: ScreenUtil().setWidth(7),
              ),
              buttonWidget: const Icon(Icons.search, color: Colors.black),
              activeColor: const Color(0xFF092A1A),
              onWaitingProcess: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: DetectSplash(widget.image, widget.outputLabel),
                  ),
                );
              },
              onFinish: () async {},
            ),
            const SizedBox(height: 16), // Adjusted spacing
            SwipeableButtonView(
              buttonText: 'CANCEL',
              buttontextstyle: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Colors.white,
                fontFamily: 'Lekton',
                fontWeight: FontWeight.w600,
                letterSpacing: ScreenUtil().setWidth(7),
              ),
              buttonWidget: const Icon(Icons.cancel_outlined, color: Colors.black),
              activeColor: Colors.red,
              onWaitingProcess: () {
                Navigator.pop(context);
              },
              isFinished: false,
              onFinish: () {},
            ),
          ],
        ),
      ),
    );
  }
}
