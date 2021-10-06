import 'package:flutter/material.dart';
import 'package:my_app/provider/myaudio.dart';
import 'package:my_app/themes/colors.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:velocity_x/velocity_x.dart';
class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavBar(icon: Icons.arrow_back_ios_new,),
          Consumer<MyAudio>(
            builder:(_,myAudioModel,child)=>
            Text(myAudioModel.audioState,
            style: TextStyle(color: MyColor.primaryDarkColor,fontWeight: FontWeight.bold,
            fontSize: 30,
            ),).shimmer(
              secondaryColor: MyColor.primaryDarkColor
            ),
          ),
          NavBar(icon: Icons.list),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {

  final IconData icon;

  const NavBar({Key? key, required this.icon}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: MyColor.primaryDarkColor,
            offset: Offset(5,10),
            spreadRadius: 3,
            blurRadius: 10),
            BoxShadow(color: Colors.white.withOpacity(0.8),
            offset: Offset(-3,-4),
            spreadRadius: -2,
            blurRadius: 20)
          ],
          color: MyColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon,color: MyColor.primaryDarkColor,size: 24,).shimmer(
              secondaryColor: MyColor.primaryDarkColor
            ),
      ),
    );
  }
}
