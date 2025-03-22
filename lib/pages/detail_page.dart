import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tripguy/widgets/my_trasport_card_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.source, required this.transData});

  final String source;
  final List<dynamic> transData;

  @override
  Widget build(BuildContext context) {
    final double sHeight = MediaQuery.sizeOf(context).height;
    final double sWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Options"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            //space
            SizedBox(
              height: 20,
            ),
            //header
            Row(
              children: [
                //source container
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 2,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        source,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),

                //space
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text("to"),
                ),

                //source container
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 2,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Dehradun",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                )
              ],
            ),

            //space
            SizedBox(
              height: 20,
            ),

            //transport details
            Expanded(
              child: ListView.builder(
                itemCount: transData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: myTransportCardWidget(
                        context, sHeight, transData, index),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
