import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.onTap,
      required this.text,
      required this.color,
      this.width,
      this.height = 50,
      this.borderColor,
      this.radius = 20,
      this.fontWeight,
      this.fontSize,
      this.fontColor,
     });

  final VoidCallback? onTap;
  final String text;
  final Color color;
  final double? width;
  final Color? borderColor;
  final double radius;
  final double height;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? color),
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        width: width,
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child:
                Text(text , style: TextStyle(color: fontColor),),

              ),
          ],
        ),
      ),
    );
  }
}
