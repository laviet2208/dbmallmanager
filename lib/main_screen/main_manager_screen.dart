import 'package:dbmallmanager/manager/product_manager/product_directory/product_directory_main.dart';
import 'package:dbmallmanager/manager/product_manager/product_list/product_list_main.dart';
import 'package:dbmallmanager/manager/ui_manager/ads_manager/ads_manager_main.dart';
import 'package:dbmallmanager/manager/ui_manager/main_product_direction_manager/main_product_direction_manager.dart';
import 'package:dbmallmanager/manager/ui_manager/type_show_manager/type_show_manager_main.dart';
import 'package:dbmallmanager/manager/ui_manager/type_show_type_2_manager/type_show_type_2_manager_main.dart';
import 'package:dbmallmanager/manager/ui_manager/ui_manager_main.dart';
import 'package:dbmallmanager/manager/voucher_manager/voucher_manager_main.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../data/finalData.dart';
import '../manager/product_manager/product_type/product_type_main_manager.dart';
import 'feature_type_1.dart';

class main_manager_screen extends StatefulWidget {
  const main_manager_screen({super.key});

  @override
  State<main_manager_screen> createState() => _main_manager_screenState();
}

class _main_manager_screenState extends State<main_manager_screen> {
  Widget getWidget(int init, double width, double height) {
    if (init == 1) {

    }

    if (init == 2) {
      return product_list_main();
    }

    if (init == 3) {
      return product_type_main_manager();
    }

    if (init == 4) {
      return product_directory_main();
    }

    if (init == 5) {

    }

    if (init == 6) {

    }

    if (init == 7) {

    }

    if (init == 8) {

    }

    if (init == 9) {

    }

    if (init == 10) {

    }

    if (init == 11) {

    }

    if (init == 12) {
      return voucher_manager_main();
    }

    if (init == 13) {
      return main_product_direction_manager();
    }

    if (init == 14) {
      return ui_manager_main();
    }

    if (init == 15) {
      return ads_manager_main();
    }

    if (init == 16) {
      return type_show_manager_main();
    }

    if (init == 17) {
      return type_show_type_2_manager();
    }

    return Container();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 240, 242, 245)
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: screenWidth,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 21, 41),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 17, bottom: 17),
                          child: AutoSizeText(
                            'Admin Dubai Mall',
                            style: TextStyle(
                              fontFamily: 'muli',
                              fontSize: 100,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Positioned(
                top: screenHeight/12,
                left: 0,
                bottom: 0,
                right: 10,
                child: Scaffold(
                  body: Container(
                    width: screenWidth,
                    height: screenHeight - (screenHeight/12),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 10,
                          left: 10,
                          right: 10,
                          bottom: 10,
                          child: Container(
                            height: screenHeight - 20,
                            width: screenWidth - 20,
                            child: Scaffold(
                              body: getWidget(finalData.selectButton, screenWidth - 20, screenHeight - 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  floatingActionButton: Builder(builder: (context) {
                    return FloatingActionButton(
                      backgroundColor: Color.fromARGB(255, 0, 21, 41),
                      child: Icon(
                        Icons.menu_sharp,
                        color: Colors.white,
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(), // <-- Opens drawer.
                    );
                  }),

                  drawer: Drawer(
                    width: 250,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(0),
                          bottomRight: Radius.circular(0)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.zero,
                      child: Container(
                        height: screenHeight - (screenHeight/12 + 10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 21, 41),
                        ),
                        child: ListView(
                          children: [
                            // GestureDetector(
                            //   child: Container(
                            //     height: 60,
                            //     color: (finalData.selectButton == 1) ? Colors.red : Colors.transparent,
                            //     child: Stack(
                            //       children: <Widget>[
                            //         Positioned(
                            //           left: 10,
                            //           right: 0,
                            //           top: 0,
                            //           bottom: 0,
                            //           child: Container(
                            //             alignment: Alignment.centerLeft,
                            //             child: Text(
                            //               'Thống kê',
                            //               style: TextStyle(
                            //                   fontFamily: 'muli',
                            //                   fontSize: 13,
                            //                   color: Colors.white,
                            //                   fontWeight: FontWeight.normal
                            //               ),
                            //             ),
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            //   onTap: () {
                            //     setState(() {
                            //       finalData.selectButton = 1;
                            //     });
                            //   },
                            // ),
                            //
                            // Container(
                            //   height: 1,
                            //   decoration: BoxDecoration(
                            //       color: Colors.white
                            //   ),
                            // ),

                            ExpansionTile(
                              leading: Icon(
                                Icons.production_quantity_limits,
                                color: Colors.white,
                              ),
                              iconColor: Colors.white,
                              collapsedIconColor: Colors.white,
                              title: Container(
                                  alignment: Alignment.centerLeft,
                                  child : Padding(
                                    padding: EdgeInsets.only(top: 15,bottom: 15),
                                    child: Text(
                                      'Qlý sản phẩm',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'muli',
                                        fontSize: 13, // Điều chỉnh kích thước phù hợp với bạn
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  )
                              ),
                              children: [
                                GestureDetector(
                                  child: feature_type_1(selectButton: finalData.selectButton, title: 'Danh sách sản phẩm', thisIndex: 2,),
                                  onTap: () {
                                    setState(() {
                                      finalData.selectButton = 2;
                                    });
                                  },
                                ),

                                GestureDetector(
                                  child: feature_type_1(selectButton: finalData.selectButton, title: 'Phân loại sản phẩm', thisIndex: 3,),
                                  onTap: () {
                                    setState(() {
                                      finalData.selectButton = 3;
                                    });
                                  },
                                ),

                                GestureDetector(
                                  child: feature_type_1(selectButton: finalData.selectButton, title: 'Danh mục sản phẩm', thisIndex: 4,),
                                  onTap: () {
                                    setState(() {
                                      finalData.selectButton = 4;
                                    });
                                  },
                                ),
                              ],
                            ),

                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                  color: Colors.white
                              ),
                            ),

                            ExpansionTile(
                              leading: Icon(
                                Icons.delivery_dining_outlined,
                                color: Colors.white,
                              ),
                              iconColor: Colors.white,
                              collapsedIconColor: Colors.white,
                              title: Container(
                                  alignment: Alignment.centerLeft,
                                  child : Padding(
                                    padding: EdgeInsets.only(top: 15,bottom: 15),
                                    child: Text(
                                      'Quản lý đơn hàng',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'muli',
                                        fontSize: 13, // Điều chỉnh kích thước phù hợp với bạn
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  )
                              ),
                              children: [
                                GestureDetector(
                                  child: feature_type_1(selectButton: finalData.selectButton, title: 'Danh sách đơn hàng', thisIndex: 7,),
                                  onTap: () {
                                    setState(() {
                                      finalData.selectButton = 7;
                                    });
                                  },
                                ),

                                GestureDetector(
                                  child: feature_type_1(selectButton: finalData.selectButton, title: 'Thêm đơn hàng', thisIndex: 8,),
                                  onTap: () {
                                    setState(() {
                                      finalData.selectButton = 8;
                                    });
                                  },
                                ),
                              ],
                            ),

                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                  color: Colors.white
                              ),
                            ),

                            ExpansionTile(
                              leading: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.white,
                              ),
                              iconColor: Colors.white,
                              collapsedIconColor: Colors.white,
                              title: Container(
                                  alignment: Alignment.centerLeft,
                                  child : Padding(
                                    padding: EdgeInsets.only(top: 15,bottom: 15),
                                    child: Text(
                                      'Quản lý khách hàng',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'muli',
                                        fontSize: 13, // Điều chỉnh kích thước phù hợp với bạn
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  )
                              ),
                              children: [
                                GestureDetector(
                                  child: feature_type_1(selectButton: finalData.selectButton, title: 'Danh sách khách hàng', thisIndex: 9,),
                                  onTap: () {
                                    setState(() {
                                      finalData.selectButton = 9;
                                    });
                                  },
                                ),
                              ],
                            ),

                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                  color: Colors.white
                              ),
                            ),

                            ExpansionTile(
                              leading: Icon(
                                Icons.discount_outlined,
                                color: Colors.white,
                              ),
                              iconColor: Colors.white,
                              collapsedIconColor: Colors.white,
                              title: Container(
                                  alignment: Alignment.centerLeft,
                                  child : Padding(
                                    padding: EdgeInsets.only(top: 15,bottom: 15),
                                    child: Text(
                                      'Quản lý Voucher',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'muli',
                                        fontSize: 13, // Điều chỉnh kích thước phù hợp với bạn
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  )
                              ),
                              children: [
                                GestureDetector(
                                  child: feature_type_1(selectButton: finalData.selectButton, title: 'Danh sách mã giảm giá', thisIndex: 12,),
                                  onTap: () {
                                    setState(() {
                                      finalData.selectButton = 12;
                                    });
                                  },
                                ),
                              ],
                            ),

                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                  color: Colors.white
                              ),
                            ),

                            ExpansionTile(
                              leading: Icon(
                                Icons.phone_android,
                                color: Colors.white,
                              ),
                              iconColor: Colors.white,
                              collapsedIconColor: Colors.white,
                              title: Container(
                                  alignment: Alignment.centerLeft,
                                  child : Padding(
                                    padding: EdgeInsets.only(top: 15,bottom: 15),
                                    child: Text(
                                      'Quản lý gdiện',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'muli',
                                        fontSize: 14, // Điều chỉnh kích thước phù hợp với bạn
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  )
                              ),
                              children: [
                                GestureDetector(
                                  child: feature_type_1(selectButton: finalData.selectButton, title: 'Danh mục gdiện chính', thisIndex: 14,),
                                  onTap: () {
                                    setState(() {
                                      finalData.selectButton = 14;
                                    });
                                  },
                                ),

                                GestureDetector(
                                  child: feature_type_1(selectButton: finalData.selectButton, title: 'Quản lý quảng cáo', thisIndex: 15,),
                                  onTap: () {
                                    setState(() {
                                      finalData.selectButton = 15;
                                    });
                                  },
                                ),

                                GestureDetector(
                                  child: feature_type_1(selectButton: finalData.selectButton, title: 'Phân loại hiển thị loại 1', thisIndex: 16,),
                                  onTap: () {
                                    setState(() {
                                      finalData.selectButton = 16;
                                    });
                                  },
                                ),

                                GestureDetector(
                                  child: feature_type_1(selectButton: finalData.selectButton, title: 'Phân loại hiển thị loại 2', thisIndex: 17,),
                                  onTap: () {
                                    setState(() {
                                      finalData.selectButton = 17;
                                    });
                                  },
                                ),

                                GestureDetector(
                                  child: feature_type_1(selectButton: finalData.selectButton, title: 'Danh mục chính', thisIndex: 13,),
                                  onTap: () {
                                    setState(() {
                                      finalData.selectButton = 13;
                                    });
                                  },
                                ),
                              ],
                            ),

                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
