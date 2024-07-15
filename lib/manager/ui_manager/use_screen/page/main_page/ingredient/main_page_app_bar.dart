import 'package:flutter/material.dart';

class main_page_app_bar extends StatelessWidget {
  const main_page_app_bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20 * (649/113),
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image/dbtext.png'),
              )
          ),
        ),

        Expanded(child: Container()),

        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Center(
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
