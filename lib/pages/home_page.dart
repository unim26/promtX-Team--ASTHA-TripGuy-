import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripguy/data/location_data.dart';

import 'package:tripguy/models/location_model.dart';
import 'package:tripguy/pages/chatbot_chat_page.dart';
import 'package:tripguy/pages/hotel_booking_page.dart';
import 'package:tripguy/pages/plan_with_ai_page.dart';
import 'package:tripguy/pages/transport_booking_page.dart';
import 'package:tripguy/widgets/app_header.dart';
import 'package:tripguy/widgets/location_card_widget.dart';
import 'package:tripguy/widgets/my_home_option_widget.dart';
import 'package:tripguy/widgets/my_search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List locationData = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        locationData = await LocationData().getLocation();
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double sHeight = MediaQuery.sizeOf(context).height;
    final double sWidth = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              //app header
              appHeader(context, sHeight, sWidth),

              //search bar
              mySearchWidget(sHeight),

              //space
              SizedBox(
                height: sHeight * .03,
              ),

              //origanize with ai button
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanWithAiPage(),
                    )),
                child: Container(
                  width: double.infinity,
                  height: sHeight * .07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.shade400,
                  ),
                  child: Row(
                    children: [
                      //space
                      SizedBox(
                        width: sWidth * .03,
                      ),

                      //image ai
                      Image.asset(
                        "assets/images/appAssets/Ai.png",
                        height: sHeight * .14,
                        width: sWidth * .15,
                        color: Colors.black,
                      ),

                      //space
                      SizedBox(
                        width: sWidth * .03,
                      ),

                      //text
                      Text(
                        "Plan your trip with AI",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              fontFamily: GoogleFonts.robotoMono().fontFamily,
                              color: Colors.white,
                            ),
                      )
                    ],
                  ),
                ),
              ),

              //space
              SizedBox(
                height: sHeight * .03,
              ),

              //otions (grid of option)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //transport option
                  myHomeOptionWidget(
                    context,
                    sHeight,
                    sWidth,
                    "assets/images/appAssets/book_transport.jpeg",
                    "Book Transport",
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransportBookingPage(),
                      ),
                    ),
                  ),

                  //hotel option
                  myHomeOptionWidget(
                    context,
                    sHeight,
                    sWidth,
                    "assets/images/appAssets/book_hotel.png",
                    "Book Hotel",
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HotelBookingPage(),
                      ),
                    ),
                  ),
                ],
              ),

              //space
              SizedBox(
                height: sHeight * .03,
              ),

              //recomendation
              //recommendation title
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Recommendation",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                        ),
                  ),
                ],
              ),
              //recommendation card

              Expanded(
                child: ListView.builder(
                  itemCount: locationData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: locationCardWidget(context, sHeight,locationData[index]),
                    );
                  },
                ),
              )
            ],
          ),
        ),

        //chatbot icon
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatbotChatPage(),
            ),
          ),
          child: Image.asset("assets/images/appAssets/chatbot.png"),
        ),
      ),
    );
  }
}
