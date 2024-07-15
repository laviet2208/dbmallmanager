import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallmanager/general_ingredient/text_line_in_item.dart';
import 'package:dbmallmanager/manager/ui_manager/type_show_type_2_manager/actions/change_type_sub_title.dart';
import 'package:dbmallmanager/manager/ui_manager/type_show_type_2_manager/actions/change_type_title.dart';
import 'package:dbmallmanager/manager/ui_manager/type_show_type_2_manager/demo_area/type_2_demo_area.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../data/product/ProductType.dart';
import '../../../general_ingredient/heading_title.dart';
import '../../../general_ingredient/utils.dart';
import 'actions/add_type_to_ui.dart';
import 'ingredient/item_product_type_show.dart';

class type_show_type_2_manager extends StatefulWidget {
  const type_show_type_2_manager({super.key});

  @override
  State<type_show_type_2_manager> createState() => _type_show_type_2_managerState();
}

class _type_show_type_2_managerState extends State<type_show_type_2_manager> {
  List<ProductType> typeList = [];
  String title = 'Đang tải';
  String subTitle = 'Đang tải';

  void getData() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("UI").child('productType1').child('list').onValue.listen((event) {
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

  void getTitle() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("UI").child('productType1').child('title').onValue.listen((event) {
      final dynamic orders = event.snapshot.value;
      title = orders.toString();
      setState(() {

      });
    });
  }

  void getSubTitle() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("UI").child('productType1').child('subtitle').onValue.listen((event) {
      final dynamic orders = event.snapshot.value;
      subTitle = orders.toString();
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getTitle();
    getSubTitle();
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
                          if (typeList.length < 10) {
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
                            'Thêm phân loại',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: text_line_in_item(title: 'Tên hiển thị: ', content: title, color: Colors.black),
                        ),

                        SizedBox(height: 10,),

                        Container(
                          alignment: Alignment.centerLeft,
                          child: text_line_in_item(title: 'Nội dung phụ: ', content: subTitle, color: Colors.black),
                        ),

                        SizedBox(height: 10,),

                        heading_title(numberColumn: 2, listTitle: ['Tên phân loại','Thao tác'], width: width/2, height: 50),

                        Container(
                          height: 300,
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
                                  text: 'Mục này không giới hạn số lượng phân loại, nhưng không nên để quá nhiều, tránh ảnh hưởn tới trải nghiệm người dùng',
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

                        SizedBox(height: 20,),

                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return change_type_title(title: title);
                              },
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0), // Đặt border radius ở đây
                              ),
                            ),
                          ),
                          child: Text(
                            'Cập nhật tên hiển thị',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),

                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return change_type_sub_title(subtitle: subTitle);
                              },
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0), // Đặt border radius ở đây
                              ),
                            ),
                            side: WidgetStateProperty.all(const BorderSide(color: Colors.black, width: 1)),
                          ),
                          child: Text(
                            'Cập nhật tiêu đề phụ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
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
            child: type_2_demo_area(title: title, subtitle: subTitle, typeList: typeList),
          ),
        ],
      ),
    );  }
}
