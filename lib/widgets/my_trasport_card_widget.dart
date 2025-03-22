import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget myTransportCardWidget(BuildContext context,double sHeight,List<dynamic> transData,int index) {
  return Container(
    width: double.infinity,
    height: sHeight * .22,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 2,
          spreadRadius: 2,
          offset: Offset(1, 1),
        )
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //name
        Text(
          transData[index]['name'],
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),

        //space
        SizedBox(
          height: sHeight * .02,
        ),

        //sorce destination
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //source
            Text(
              transData[index]['source'],
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            //destination
            Text(
              transData[index]['destination'],
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),

        //space
        SizedBox(
          height: sHeight * .02,
        ),

        //price
        Text(
          "Rs. ${transData[index]['price']}",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),

        //duration
        Text(
          "Duration : ${transData[index]['duration']}",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    ),
  );
}
