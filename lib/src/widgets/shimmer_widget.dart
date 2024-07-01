import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  const ShimmerWidget({Key? key, this.height = 60, this.width = 80})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      enabled: true,
      baseColor: Colors.black,
      highlightColor: Colors.grey,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }
}
