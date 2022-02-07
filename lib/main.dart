import 'package:flutter/material.dart';
import 'package:mawaqit_android_tv/view_model/on_boarding_view_model.dart';
import 'package:mawaqit_android_tv/views/on_boarding_screen.dart';
import 'view_model/on_boarding_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnBoardingViewModel>(
      create: (context)=>OnBoardingViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF42039D),
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 24.0,color: Color(0xFF42039D).withOpacity(0.6),fontWeight: FontWeight.w400),
            headline6: TextStyle(fontSize: 40.0,fontWeight: FontWeight.w700,color: Color(0xFF42039D)),
          ),
        ),
        home: OnBoardingScreen(

        ),
      ),
    );
  }
}
