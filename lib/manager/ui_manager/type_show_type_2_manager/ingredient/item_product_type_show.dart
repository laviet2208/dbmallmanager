import 'package:dbmallmanager/data/product/ProductType.dart';
import 'package:dbmallmanager/general_ingredient/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../general_ingredient/text_line_in_item.dart';

class item_product_type_show extends StatefulWidget {
  final ProductType type;
  final List<ProductType> listType;
  final int index;
  const item_product_type_show({super.key, required this.type, required this.index, required this.listType});

  @override
  State<item_product_type_show> createState() => _item_product_type_showState();
}

class _item_product_type_showState extends State<item_product_type_show> {
  Future<void> push_new_producttype() async{
    try {
      DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
      await databaseRef.child("UI").child('productType1').child('list').set(widget.listType.map((e) => e.toJson()).toList());
    } catch (error) {
      print('Đã xảy ra lỗi khi đẩy catchOrder: $error');
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20;
    return Container(
      width: width/2,
      height: 50,
      decoration: BoxDecoration(
        color: widget.index % 2 == 0 ? Colors.white : Color.fromARGB(255, 247, 250, 255),
        border: Border.all(
          color: Color.fromARGB(255, 240, 240, 240),
          width: 1.0,
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            width: 49,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: Center(
                child: Text(
                  (widget.index + 1).toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'muli',
                    color: Colors.black,
                    fontWeight: FontWeight.bold, // Để in đậm
                  ),
                ),
              ),
            ),
          ),

          Container(
            width: 1,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240)
            ),
          ),

          Container(
            width: (width/2 - 50)/2-1,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListView(
                children: [
                  Container(height: 10,),

                  text_line_in_item(color: Colors.black,title: '', content: widget.type.name),

                  Container(height: 10,),
                ],
              ),
            ),
          ),

          Container(
            width: 1,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240)
            ),
          ),

          Container(
            width: (width/2 - 50)/2-1,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListView(
                children: [
                  SizedBox(height: 10,),

                  TextButton(onPressed: () async {
                    widget.listType.removeAt(widget.index);
                    await push_new_producttype();
                    toastMessage('Xóa thành công');
                  }, child: Text('Xóa phân loại', style: TextStyle(color: Colors.red,),)),
                ],
              ),
            ),
          ),

          Container(
            width: 1,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240)
            ),
          ),
        ],
      ),
    );
  }
}
