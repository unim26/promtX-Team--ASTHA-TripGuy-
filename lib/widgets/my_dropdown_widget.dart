import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget myDropDownWidget(double sHeight,String source,void Function(String?)? onChanged,List<String> optionList,) {
  return Container(
    width: double.infinity,
    height: sHeight * .07,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 2,
          spreadRadius: 1,
          offset: Offset(1, 1),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ).copyWith(top: 10),
      child: Expanded(
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(10),
          value: source,
          hint: Text("Select an option"),
          isExpanded: true,
          items: optionList.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    ),
  );
}
