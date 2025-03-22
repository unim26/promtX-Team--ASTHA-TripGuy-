import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget appHeader(
  BuildContext context,
  double sHeight,
  double sWidth,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      //app name
      Text(
        "TripGuy",
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),

      //profile image
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 1,
              spreadRadius: .5,
              color: Colors.grey.shade600,
            ),
          ],
        ),
        child: Image.asset(
          "assets/images/appAssets/profile.png",
          height: sHeight * .1,
          width: sWidth * .09,
        ),
      ),
    ],
  );
}
