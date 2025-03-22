import 'package:flutter/material.dart';
import 'package:tripguy/data/get_train_data.dart';
import 'package:tripguy/widgets/my_trasport_card_widget.dart';

class TransportBookingPage extends StatefulWidget {
  const TransportBookingPage({super.key});

  @override
  State<TransportBookingPage> createState() => _TransportBookingPageState();
}

class _TransportBookingPageState extends State<TransportBookingPage> {
  List availableTransport = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        availableTransport = await getTrainData();
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.sizeOf(context).height;
    final sWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //tetx
              Text(
                "Avaialable Transports",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              //sizbo
              SizedBox(
                height: 5,
              ),

              //transports
              Expanded(
                child: ListView.builder(
                  itemCount: availableTransport.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: sHeight * .26,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/appAssets/train.jpeg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: Offset(1, 1),
                          ),
                        ],
                        color: Colors.red,
                      ),
                      child: Stack(
                        children: [
                          //
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
