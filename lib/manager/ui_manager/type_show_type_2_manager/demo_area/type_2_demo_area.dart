import 'package:dbmallmanager/manager/ui_manager/type_show_type_2_manager/demo_area/item_demo_type_2.dart';
import 'package:flutter/material.dart';

import '../../../../data/product/ProductType.dart';

class type_2_demo_area extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<ProductType> typeList;
  const type_2_demo_area({super.key, required this.title, required this.subtitle, required this.typeList});

  @override
  Widget build(BuildContext context) {
    double width = 392.72727272727275;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 252, 242, 189),
      ),
      alignment: Alignment.centerLeft,
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
                  color: Color.fromARGB(255, 90, 46, 19),
                  fontWeight: FontWeight.bold,
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
                  color: Color.fromARGB(255, 90, 46, 19),
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
                    backgroundColor: WidgetStatePropertyAll<Color>(Color.fromARGB(255, 90, 46, 19)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
                    child: Text(
                      'Turn in',
                      style: TextStyle(
                          fontFamily: 'muli',
                          fontSize: width/24,
                          color: Color.fromARGB(255, 252, 242, 189),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10,),

          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 120,
              child: ListView.builder(
                itemCount: typeList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: item_demo_type_2(type: typeList[index]),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
