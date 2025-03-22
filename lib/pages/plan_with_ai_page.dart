import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tripguy/data/plan_with_ai.dart';
import 'package:tripguy/pages/detail_page.dart';
import 'package:tripguy/widgets/my_dropdown_widget.dart';

class PlanWithAiPage extends StatefulWidget {
  const PlanWithAiPage({super.key});

  @override
  State<PlanWithAiPage> createState() => _PlanWithAiPageState();
}

class _PlanWithAiPageState extends State<PlanWithAiPage> {
  String source = "Mumbai";
  final TextEditingController budgetController = TextEditingController();

  final List<String> listOfSourceOption = [
    "Mumbai",
    "Delhi",
    "Lucknow",
    "Howrah",
    "Haridwar",
    "Chandigarh",
    "Amritsar",
  ];
  @override
  Widget build(BuildContext context) {
    final double sHeight = MediaQuery.sizeOf(context).height;
    final double sWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Plan with AI",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            //space
            SizedBox(
              height: sHeight * .03,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Source : ",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
            //source field
            myDropDownWidget(
              sHeight,
              source,
              (value) {
                source = value!;
                setState(() {});
              },
              listOfSourceOption,
            ),

//space
            SizedBox(
              height: sHeight * .03,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Destination : ",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
            //mydrop down
            myDropDownWidget(
              sHeight,
              "Dehradun",
              (value) {},
              ["Select", "Dehradun"],
            ),

            SizedBox(
              height: sHeight * .03,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Budget : ",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),

            //budget field
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: budgetController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your Budget",
                ),
              ),
            ),

            SizedBox(
              height: sHeight * .03,
            ),

            //plan now button
            GestureDetector(
              onTap: () async {
                final response = await PlanWithAi().getCombinationOfTransport(
                    source, int.parse(budgetController.text));

                    

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      source: source,
                      transData: response[0]['transport'],
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: sHeight * .07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.shade400,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Plan Now",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
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
}
