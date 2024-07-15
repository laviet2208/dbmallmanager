import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallmanager/data/product/ProductDirectory.dart';
import 'package:dbmallmanager/manager/ui_manager/main_product_direction_manager/ingredient/item_product_in_directory.dart';
import 'package:flutter/material.dart';

class demo_directory_area extends StatelessWidget {
  final ProductDirectory directory;
  const demo_directory_area({super.key, required this.directory});

  @override
  Widget build(BuildContext context) {
    double width = 392.72727272727275;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 25,
            child: Row(
              children: [
                Container(width: 10,),

                Container(
                  width: width - 80,
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    directory.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 100,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'muli'
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'See all',
                          style: TextStyle(
                            fontFamily: 'muli',
                            color: Colors.black,
                            fontSize: width/30,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: 10,),

          Container(
            height: 240,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListView.builder(
                itemCount: directory.productList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return item_product_in_directory(id: directory.productList[index]);
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

