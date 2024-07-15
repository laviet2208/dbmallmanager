import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallmanager/data/product/ProductType.dart';
import 'package:dbmallmanager/general_ingredient/heading_title.dart';
import 'package:dbmallmanager/general_ingredient/utils.dart';
import 'package:dbmallmanager/manager/ui_manager/type_show_manager/actions/add_type_to_ui.dart';
import 'package:dbmallmanager/manager/ui_manager/type_show_manager/ingredient/demo_area.dart';
import 'package:dbmallmanager/manager/ui_manager/type_show_manager/ingredient/item_product_type_show.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class type_show_manager_main extends StatefulWidget {
  const type_show_manager_main({super.key});

  @override
  State<type_show_manager_main> createState() => _type_show_manager_mainState();
}

class _type_show_manager_mainState extends State<type_show_manager_main> {

  List<ProductType> typeList = [];

  void getData() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("UI").child('productType').onValue.listen((event) {
      typeList.clear();
      setState(() {

      });
      final dynamic orders = event.snapshot.value;
      for (final result in orders) {
        ProductType directory = ProductType.fromJson(result);
        typeList.add(directory);
      }
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20;
    double height = MediaQuery.of(context).size.height - 80;
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            child: Container(
              width: width/2,
              child: Stack(

                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: TextButton(
                      onPressed: () {
                        if (typeList.length < 6) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return add_type_to_ui(typeList: typeList);
                            },
                          );
                        } else {
                          toastMessage('Số lượng hiển thị tối đa');
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0), // Đặt border radius ở đây
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Thêm phân loại hiển thị',
                          style: TextStyle(
                            fontFamily: 'muli',
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    ),
                  ),

                  Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        heading_title(numberColumn: 2, listTitle: ['Tên phân loại','Thao tác'], width: width/2, height: 50),

                        Container(
                          height: 400,
                          child: ListView.builder(
                            itemCount: typeList.length,
                            itemBuilder: (context, index) {
                              return item_product_type_show(type: typeList[index], index: index, listType: typeList,);
                            },
                          ),
                        ),

                        Container(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Lưu ý: ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'muli',
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                TextSpan(
                                  text: 'Chỉ hiển thị đúng 6 phân loại sản phẩm trong mục này',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'muli',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 392.72727272727275,
              height: 20,
              alignment: Alignment.center,
              child: AutoSizeText(
                'Phần Demo hiển thị',
                style: TextStyle(
                  fontFamily: 'muli',
                  fontSize: 100,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Positioned(
            top: 40,
            right: 0,
            child: demo_area(typeList: typeList),
          ),
        ],
      ),
    );
  }
}
