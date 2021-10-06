import 'package:flutter/material.dart';
import 'package:my_app/themes/colors.dart';

class AlbumArt extends StatelessWidget {
  const AlbumArt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset("assets/images/sample.jpeg",fit: BoxFit.fill,)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyColor.primaryColor,
        boxShadow: [
          BoxShadow(color: MyColor.primaryDarkColor,
            offset: Offset(20,8),
            spreadRadius: 3,
            blurRadius: 20),
            BoxShadow(color: Colors.white.withOpacity(0.7),
            offset: Offset(-3,-4),
            spreadRadius: -2,
            blurRadius: 20)
        ]
      ),
    );
  }
}