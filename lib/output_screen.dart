import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_app/display_container.dart';
import 'package:mobile_app/trivia.dart';

class OutputScreen extends StatelessWidget {
  final String outputText;
  final File image;

  const OutputScreen(this.outputText, this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          SizedBox(
            width: ScreenUtil().setWidth(360),
            height: ScreenUtil().setHeight(360),
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(360),
            height: ScreenUtil().setHeight(360),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(300),
            left: 0,
            right: 0,
            child: Container(
              height: ScreenUtil().setHeight(500),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(25)),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(80),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(25)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(25),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          outputText,
                          style: TextStyle(
                            fontFamily: 'Teko',
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(26),
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(320),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(25),
                      ),
                      // Add content here if necessary
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Container(
                    child: TextContainerBuilder.build(outputText),
                    // Adjust the content based on your requirement
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: ScreenUtil().setWidth(20),
            bottom: ScreenUtil().setHeight(25),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Container(
                width: ScreenUtil().setWidth(60),
                height: ScreenUtil().setHeight(55),
                decoration: BoxDecoration(
                  color: const Color(0xFF21985F),
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(15)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          Positioned(
            left: ScreenUtil().setWidth(100),
            bottom: ScreenUtil().setHeight(25),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Trivia(initialIndex: 1), // Set the index to the Recommendations slide (index 1)
                  ),
                );
              },
              child: Container(
                width: ScreenUtil().setWidth(240),
                height: ScreenUtil().setHeight(55),
                decoration: BoxDecoration(
                  color: const Color(0xFF21985F),
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(15)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Recommendation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 3.5,
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(22),
                      fontFamily: 'Teko',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
