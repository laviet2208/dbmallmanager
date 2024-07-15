import 'package:flutter/material.dart';

class text_ads extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color textColor;
  const text_ads({super.key, required this.title, required this.subtitle, required this.backgroundColor, required this.textColor});

  @override
  Widget build(BuildContext context) {
    double width = 392.72727272727275;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'muli',
                    fontSize: width/20,
                    color: textColor,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),

          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                subtitle,
                maxLines: 2,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'muli',
                  fontSize: width/26,
                  color: textColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),

          SizedBox(height: 10,),

          Container(
            height: 60,
            child: Row(
              children: [
                SizedBox(width: 10,),

                TextButton(
                  onPressed: () {

                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(textColor),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                    child: Text(
                      'View now',
                      style: TextStyle(
                        fontFamily: 'muli',
                        fontSize: width/24,
                        color: backgroundColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
