import 'package:flutter/material.dart';
import 'package:know_solar/screens/home_screen.dart';
import 'package:know_solar/screens/login_screen.dart';
import 'package:on_boarding_ui/model/slider.dart' as slide;
import 'package:on_boarding_ui/on_boarding_ui.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
    theme: ThemeData(
      primaryColor: Colors.green,
      appBarTheme: AppBarTheme(color: Colors.white,actionsIconTheme: IconThemeData(
        color: Colors.green,
      ),
        iconTheme: IconThemeData(color: Colors.green)
      )
    ),
  ));
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("Know Solar"),
        //   centerTitle: true,
        // ),

        body: OnBoardingUi(
          slides: [
          slide.Slider(
            sliderHeading: "Why should you use solar".toUpperCase(),
            sliderSubHeading: "Slide Sub Heading 1",
            sliderImageUrl: "images/solar_panal.png"
          ),
          slide.Slider(
              sliderHeading: "Slide 2",
              sliderSubHeading: "Slide Sub Heading 1",
              sliderImageUrl: "images/test_image.jpg"
          ),
          slide.Slider(
              sliderHeading: "Slide 3",
              sliderSubHeading: "Slide Sub Heading 1",
              sliderImageUrl: "images/test_image.jpg",
          ),
        ],

          onFinish: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
        },

        )
      )
    );
  }





}

