import 'package:chat_app_gpt/constant/app_assets.dart';
import 'package:chat_app_gpt/constant/app_styles.dart';
import 'package:chat_app_gpt/screen/home.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentIndex = 0;

  String lastText = "Tiếp";

  final List<String> _backgrounds = [
    AppAssets.slide1,
    AppAssets.slide2,
    AppAssets.slide3,
    AppAssets.empty,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(_backgrounds[_currentIndex]),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 40),
                          maximumSize: const Size(150, 40),
                          foregroundColor: const Color(0xff101010),
                          backgroundColor: const Color(0xffF5F5F5)),
                      onPressed: () {
                        setState(() {
                          _currentIndex =
                              (_currentIndex + 1) % _backgrounds.length;
                        });
                        if (_currentIndex == 2) {
                          lastText = "Đóng";
                        }
                        if (_currentIndex == 3){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          );
                        }
                      },
                      child: Text(lastText, style: AppStyle.h5,),
                    ),
                    Container(
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _backgrounds.length-1,
                          (index) => Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
