import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class search_box extends StatelessWidget {
  const search_box({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
          child: Row(
            children: [
              Container(
                width: 40,
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
              ),

              SizedBox(width: 10,),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      'Search on Dubai Mall',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10,),

              Container(
                width: 40,
                child: Icon(
                  Icons.mic_none,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
