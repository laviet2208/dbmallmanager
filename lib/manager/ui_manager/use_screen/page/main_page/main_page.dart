
import 'package:flutter/material.dart';

import 'ingredient/main_page_app_bar.dart';
import 'ingredient/search_box.dart';
import 'ingredient/text_ads.dart';

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: main_page_app_bar(),
      ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 10,),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: search_box(),
            ),

            SizedBox(height: 20,),
            
            text_ads(title: 'Enjoy the ride with up to 40% off', subtitle: 'Get deals on exterior and interior parts, lighting, and more.', backgroundColor: Color.fromARGB(255, 76, 147, 251), textColor: Colors.black,),

            SizedBox(height: 20,),

            text_ads(title: 'Go beyond trends, La', subtitle: "Wear Levi's, Anthropologie and more from our partner sellers.", backgroundColor: Color.fromARGB(255, 1, 60, 102), textColor: Color.fromARGB(255, 211, 239, 253),),

          ],
        ),
      ),
    );
  }
}
