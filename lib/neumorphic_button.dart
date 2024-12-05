import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildNeumorphicButton(String imagePath, bool isPressed, double iconSize, VoidCallback onPressed) {
  return Neumorphic(
    padding: const EdgeInsets.all(16),
    style: NeumorphicStyle(
      shape: NeumorphicShape.convex,
      color: Colors.grey.shade300,
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(40.w)),
      depth: isPressed ? -8 : 8,
    ),
    child: InkWell(
      onTap: onPressed,
      child: Container(
        width: 50.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.w),
          color: Colors.grey.shade300,
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            color: isPressed ? Colors.grey[400] : Colors.grey[700],
            width: iconSize,
            height: iconSize,
          ),
        ),
      ),
    ),
  );
}