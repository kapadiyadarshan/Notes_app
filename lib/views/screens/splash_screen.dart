import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:final_exam/utils/color_utils.dart';
import 'package:final_exam/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

bool selected = false;

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    selected = !selected;

    Timer.periodic(const Duration(seconds: 4), (timer) {
      Navigator.of(context).pushReplacementNamed(MyRoutes.homePage);
      timer.cancel();
    });
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          height: selected ? 400 : 280,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColor.theme3,
          ),
          alignment: Alignment.center,
          child: SizedBox(
            width: 230.0,
            child: DefaultTextStyle(
              style: GoogleFonts.philosopher(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: MyColor.theme4),
              textAlign: TextAlign.center,
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText("NotesApp"),
                ],
                isRepeatingAnimation: false,
                onTap: () {},
              ),
            ),
          ),
        ),
      ),
      backgroundColor: MyColor.theme4,
    );
  }
}
