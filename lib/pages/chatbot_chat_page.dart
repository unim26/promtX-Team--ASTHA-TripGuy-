import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatbotChatPage extends StatelessWidget {
  const ChatbotChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double sHeight = MediaQuery.sizeOf(context).height;
    final double sWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ChatBot",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontFamily: GoogleFonts.robotoMono().fontFamily,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            //message
            Row(
              children: [
                //chtabot icon
                Image.asset(
                  "assets/images/appAssets/chatbot.png",
                  height: sHeight * .17,
                  width: sWidth * .12,
                  color: Colors.black,
                ),

                //message
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20).copyWith(
                      bottomLeft: Radius.circular(0),
                    ),
                    color: Colors.blue.shade200,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 2,
                        spreadRadius: 1,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    "How can I help you?",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),

            //space
            Spacer(),

            //text box
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "please type your query",
                  suffixIcon: Icon(Icons.send),
                ),
              ),
            ),

            //space
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
