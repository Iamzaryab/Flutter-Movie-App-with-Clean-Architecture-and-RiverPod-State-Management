import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Skeleton extends StatelessWidget {
  final double width, height, left, right, top, bottom;

  const Skeleton(
      {Key? key,
      required this.height,
      required this.width,
      required this.left,
      required this.right,
      required this.top,
      required this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: top.sp, bottom: bottom.sp, left: left.sp, right: right.sp),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.sp),
        child: Container(
          height: height.sp,
          width: width.sp,
          color: Colors.grey,
        ),
      ),
    );
  }
}
