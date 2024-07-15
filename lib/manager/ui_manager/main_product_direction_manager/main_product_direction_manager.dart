import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallmanager/data/otherdata/Tool.dart';
import 'package:dbmallmanager/data/product/ProductDirectory.dart';
import 'package:dbmallmanager/manager/ui_manager/main_product_direction_manager/actions/change_direc_ui.dart';
import 'package:dbmallmanager/manager/ui_manager/main_product_direction_manager/ingredient/demo_directory_area.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../general_ingredient/heading_title.dart';
import '../../../general_ingredient/text_line_in_item.dart';

class main_product_direction_manager extends StatefulWidget {
  const main_product_direction_manager({super.key});

  @override
  State<main_product_direction_manager> createState() => _main_product_direction_managerState();
}

class _main_product_direction_managerState extends State<main_product_direction_manager> {
  ProductDirectory directory = ProductDirectory(id: '', status: 0, name: '', createTime: getCurrentTime(), productList: []);

  void getData() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("UI").child('maindirectory').onValue.listen((event) {
      final dynamic orders = event.snapshot.value;
      directory.id = orders.toString();
      if (directory.id != '') {
        getDirecData();
      }
      setState(() {

      });
    });
  }

  void getDirecData() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("productDirectory").child(directory.id).onValue.listen((event) {
      final dynamic orders = event.snapshot.value;
      directory = ProductDirectory.fromJson(orders);
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
              child: Column(
                children: [
                  heading_title(numberColumn: 2, listTitle: ['Tên Danh mục','Thao tác'], width: width/2, height: 50),

                  Container(
                    width: width/2,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 250, 255),
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
                                (1).toString(),
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

                                text_line_in_item(color: Colors.black,title: '', content: directory.name),

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
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return change_direc_ui();
                                    },
                                  );
                                }, child: Text('Cập nhật', style: TextStyle(color: Colors.red,),)),
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
                  ),
                ],
              )
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
            child: demo_directory_area(directory: directory),
          ),
        ],
      ),
    );
  }
}
