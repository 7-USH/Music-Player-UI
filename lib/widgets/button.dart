// ignore: unused_import
// import 'package:beta_test/widgets/colors.dart';
// import 'package:flutter/material.dart';

// GestureDetector myButton(double h, double w, var scale, AnimationController x) {
//   double height = h;
//   double width = w;
//   var newScale = scale;
//   return GestureDetector(

//     child: Transform.scale(
//       scale: newScale,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(color: Colors.white, width: 2),
//         ),
//         height: height,
//         width: width,
//         child: Center(
//             child: Text(
//           "Get Started",
//           style: MyColor.secondaryText,
//         )),
//       ),
//     ),
//   );
// }




// myButton(double h, double w, var scale) {
//     double height = h;
//     double width = w;
//     var newScale = scale;
//     return InkWell(
//       onTapDown: onTapDown,
//       onTapUp: onTapUP,
//       onTapCancel: onTapCancel,
//       onTap: (){},
//       child: Transform.scale(
//         scale: newScale,
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: Colors.white, width: 2),
//           ),
//           height: height,
//           width: width,
//           child: Center(
//               child: Text(
//             "Get Started",
//             style: MyColor.secondaryText,
//           )),
//         ),
//       ),
//     );
//   }

//   onTapDown(TapDownDetails details) {
//     _newController.forward();
//   }

//   onTapUP(TapUpDetails details) {
//     _newController.reverse();
//   }
//   onTapCancel() {
//     _newController.reverse();
//   }