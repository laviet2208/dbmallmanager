import 'package:dbmallmanager/manager/ui_manager/type_show_manager/ingredient/item_demo.dart';
import 'package:flutter/material.dart';

import '../../../../data/product/ProductType.dart';

class demo_area extends StatelessWidget {
  final List<ProductType> typeList;
  const demo_area({super.key, required this.typeList});

  @override
  Widget build(BuildContext context) {
    double width = 392.72727272727275;

    return Container(
      width: width,
      height: ((width - 60)/3) * 2 + 100,
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // số phần tử trên mỗi hàng
            mainAxisSpacing: 20, // khoảng cách giữa các hàng
            crossAxisSpacing: 20, // khoảng cách giữa các cột
            childAspectRatio: ((width - 60)/3)/((width - 60)/3 + 40),
          ),
          itemCount: typeList.length,
          itemBuilder: (context, index) {
            return item_demo(type: typeList[index]);
          },
        ),
      ),
    );
  }
}
