import 'package:flutter/material.dart';

Widget locationCardWidget(BuildContext context, double sHeight,dynamic locationdata) {
  return Container(
    width: double.infinity,
    height: sHeight * .25,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          "assets/images/appAssets/haridwar_dummy.jpeg",
        ),
        fit: BoxFit.cover,
      ),
      color: Colors.red,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withValues(alpha: .35),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //location name
              Text(
                locationdata['location_name'],
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),

              //tag line
              Text(
                locationdata['tag_line'],
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
