import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/styles/colormanager.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnTitle;
  final double? fontSize;
  final Color? btnColor;
  final FontWeight? fontWeight;
  final Color? background;
  final Widget? icon;
  const CustomTextButton({super.key,
    required this.onPressed,required this.btnTitle
    ,this.fontWeight,this.fontSize,this.btnColor,this.background,this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          foregroundColor: btnColor ?? Colors.white,
          backgroundColor: background ?? ColorManager.primarycolor,
          textStyle: TextStyle(
            fontSize: fontSize ?? 16,
            fontWeight: fontWeight ?? FontWeight.w500,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child:Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 10),
            ],
            Text(btnTitle),
          ],
        ),
      ),
    );
  }
}
