import 'package:flutter/material.dart';

class CustomPngImage extends StatelessWidget {
  final String imageName;
  final double height;
  final double width;
  final BoxFit fit;
  const CustomPngImage(this.imageName,
      {this.height = 60, this.width = 60, this.fit = BoxFit.contain});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$imageName.png',
      height: height,
      width: width,
      fit: fit,
    );
  }
}

// class CustomSvgImage extends StatelessWidget {
//   final String imageName;
//   final double height;
//   final double width;
//   final Color color;
//   const CustomSvgImage(this.imageName,
//       {this.height = 22, this.width = 22, this.color = Colors.transparent});
//   @override
//   Widget build(BuildContext context) {
//     return SvgPicture.asset(
//       'assets/icons/$imageName.svg',
//       height: height,
//       width: width,
//       color: color,
//       fit: BoxFit.contain,
//     );
//   }
// }

// class CustomGifImage extends StatelessWidget {
//   final String imageName;
//   final double height;
//   final double width;
//   final BoxFit fit;
//   const CustomGifImage(this.imageName,
//       {this.height = 22, this.width = 22, this.fit = BoxFit.contain});
//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       'assets/gif/$imageName.gif',
//       height: height,
//       width: width,
//       fit: fit,
//     );
//   }
// }
