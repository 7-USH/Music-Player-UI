import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/provider/myaudio.dart';
import 'package:my_app/themes/colors.dart';
import 'package:my_app/widgets/playcontrols.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:velocity_x/velocity_x.dart';
import 'widgets/albumart.dart';
import 'widgets/navigationbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(
      textTheme: GoogleFonts.latoTextTheme(),
    ),
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider(create: (_) => MyAudio(), child: HomePage()),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sliderValue = 2;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyColor.primaryColor,
      body: Column(
        children: [
          NavigationBar(),
          SizedBox(
            height: 10,
            width: 20,
          ),
          Container(
            height: height / 2,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return AlbumArt();
              },
            ),
          ),
          Text(
            "Be Together",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ).shimmer(
              secondaryColor: MyColor.primaryDarkColor,
              primaryColor: Vx.coolGray500),
          Text(
            "Major Lazer",
            style: TextStyle(
                color: MyColor.primaryDarkColor.withOpacity(0.3),
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          SliderTheme(
            data: SliderThemeData(
                trackHeight: 3,
                thumbColor: MyColor.primaryDarkColor,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7)),
            child: Consumer<MyAudio>(
              builder: (_, myAudioModel, child) => Slider(
                // ignore: unnecessary_null_comparison
                value: myAudioModel.position == null
                    ? 0
                    : myAudioModel.position.inMilliseconds.toDouble(),
                activeColor: MyColor.primaryDarkColor,
                inactiveColor: MyColor.primaryDarkColor.withOpacity(0.2),
                onChanged: (value) {
                  myAudioModel.seekAudio(Duration(milliseconds: value.toInt()));
                },
                min: 0,
                // ignore: unnecessary_null_comparison
                max: myAudioModel.totalDuration == null
                    ? 20
                    : myAudioModel.totalDuration.inMilliseconds.toDouble(),
              ),
            ),
          ),
          PlayerController(),
        ],
      ),
    );
  }
}
