import 'package:flutter/material.dart';

Widget myHomeOptionWidget(
  BuildContext context,
  double sHeight,
  double sWidth,
  String image,
  String title,
  void Function()? onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: sWidth / 2.6,
      height: sHeight * .2,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.shade700,
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(1.5, 1.5),
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: sWidth / 2.6,
              height: sHeight * .2,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: .6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
