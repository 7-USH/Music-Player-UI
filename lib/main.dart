import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/FirstPage.dart';
import 'pages/SecondPage.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      getPages:[
        GetPage(name: "/",page: ()=>FirstPage()),
        GetPage(name: "/secondPage", page:()=> SecondPage())
      ],
    );
  }
}
