import 'dart:async';

import 'package:commerce_app/utils/color.dart';
import 'package:commerce_app/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:commerce_app/views/splash.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String text = "Breakfast";

  Color color = colorPurple;
  Color color_ = colorOrange;

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {

      setState(() {
        text = "Is Ready";
      color = colorPink;
      color_ = colorPurple;
      });
      
    });

    Timer(const Duration(seconds: 7), () {
   
      Navigator.pushReplacement(
          context, (MaterialPageRoute(builder: (context) => const HomePage())));
    });
    return Scaffold(
        body: Column(children: [
      Expanded(
        flex: 3,
        child: Container(
          decoration: BoxDecoration(
            // color: color,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 140),
            child: Container(
              // height: 80,
              // width: 80,
              decoration: BoxDecoration(color: shaderColor3.withOpacity(0.4), 
              borderRadius: BorderRadius.circular(20),
              ), 
              child: Center(
                child: Container(
                  child: SvgPicture.asset("assets/images/coffee-icon.svg", color: color_,)
                  ),
              ),
            ),
          ),
        ),
      ),
      Expanded(
          child: Center(
            child: Text(
                    text,
                    style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
          ))
    ]));
  }
}
