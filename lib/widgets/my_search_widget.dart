import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

Widget mySearchWidget(double sHeight) {
  return Container(
    width: double.infinity,
    height: sHeight * .07,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
    ),
    child: TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(FontAwesomeIcons.searchengin),
        hintText: "search your dream destination",
      ),
    ),
  );
}
