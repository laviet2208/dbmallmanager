import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../../../../data/otherdata/Time.dart';
import '../../../../../data/otherdata/Tool.dart';
import '../../../../../data/product/Product.dart';
import '../../../../../data/product/ProductDirectory.dart';
import '../../../../../general_ingredient/text_line_in_item.dart';
import '../../../../../general_ingredient/utils.dart';
import '../../../product_list/action/add_new_product/controller.dart';
import '../../../product_list/controller.dart';

class product_in_directory_item extends StatefulWidget {
  final String id;
  final String directoryId;
  final int index;
  const product_in_directory_item({super.key, required this.id, required this.index, required this.directoryId});

  @override
  State<product_in_directory_item> createState() => _product_in_directory_itemState();
}

class _product_in_directory_itemState extends State<product_in_directory_item> {
  String productType = 'Lỗi tên phân loại';
  String brandName = 'Lỗi nhà cung cấp';
  Product product = Product(id: generateID(15), name: '', productType: '', showStatus: 0, createTime: getCurrentTime(), description: '', directoryList: [], cost: 0, costBeforeSale: 0, inventory: 0, saleLimit: Time(second: 0, minute: 0, hour: 0, day: 0, month: 0, year: 0), subdescription: '');

  void get_product() {
    if (widget.id != '') {
      final reference = FirebaseDatabase.instance.ref();

      reference.child("productList").child(widget.id).onValue.listen((event) {
        final dynamic data = event.snapshot.value;
        product = Product.fromJson(data);
        get_type_name();
        setState(() {

        });
      });
    }
  }

  void get_type_name() {
    if (product.productType != '') {
      final reference = FirebaseDatabase.instance.ref();
      reference.child("productType").child(product.productType).child('name').onValue.listen((event) {
        final dynamic data = event.snapshot.value;
        productType = data.toString();
        setState(() {

        });
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_product();
    get_type_name();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/5*4;
    double height = 150;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: widget.index % 2 == 0 ? Colors.white : Color.fromARGB(255, 247, 250, 255),
        border: Border.all(
          color: Color.fromARGB(255, 240, 240, 240),
          width: 1.0,
        ),
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
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
            width: (width - 50)/5-1,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListView(
                children: [
                  Container(height: 4,),

                  text_line_in_item(color: Colors.black,title: 'Mã sản phẩm: ', content: product.id),

                  Container(height: 8,),

                  text_line_in_item(color: Colors.black,title: 'Tên sản phẩm: ', content: product.name),

                  Container(height: 8,),

                  text_line_in_item(color: product.showStatus == 0 ? Colors.redAccent : Colors.blueAccent, title: 'Trạng thái hiển thị: ', content: product.showStatus == 0 ? 'Đang ẩn' : 'Đang hiện'),

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
            width: (width - 50)/5-1,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListView(
                children: [
                  Container(height: 4,),

                  text_line_in_item(color: Colors.black,title: 'Số lượng tồn kho: ', content: product.inventory.toString()),

                  Container(height: 8,),

                  text_line_in_item(color: Colors.black,title: 'Giá tiền thực: ', content: getStringNumber(product.cost) + '.đ'),

                  Container(height: 8,),

                  text_line_in_item(color: Colors.black,title: 'Giá tiền trước giảm: ', content: getStringNumber(product.costBeforeSale) + '.đ'),

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
            width: (width - 50)/5-1,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListView(
                children: [
                  Container(height: 4,),

                  text_line_in_item(color: Colors.black,title: 'Phân loại: ', content: productType),

                  Container(height: 8,),

                  text_line_in_item(color: Colors.black,title: 'Nhà cung cấp: ', content: brandName),

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
            width: (width - 50)/5-1,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListView(
                children: [
                  // Container(
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     padding: EdgeInsets.zero,
                  //     itemCount: product.directoryList.length,
                  //     itemBuilder: (context, index) {
                  //       return Padding(
                  //         padding: EdgeInsets.only(top: 5),
                  //         child: item_directory_brand_name(id: product.directoryList[index], index: index, width: ((width - 50)/5-1) - 20, product: product,),
                  //       );
                  //     },
                  //   ),
                  // ),
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
            width: (width - 50)/5 - 1,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: ListView(
                children: [
                  Container(height: 4,),

                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 1,
                              color: Colors.black
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Xóa khỏi danh mục',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      onTap: () async {
                        if (product.directoryList.length > 1) {
                          ProductDirectory directory = await add_product_controller.get_directory(widget.id);
                          directory.productList.remove(product.id);
                          await add_product_controller.push_new_productdirect(directory);
                          product.directoryList.remove(widget.id);
                          await product_manager_controller.change_productDirectory(product);
                          toastMessage('Xóa thành công');
                          Navigator.of(context).pop();
                        } else {
                          toastMessage('Không thể xóa');
                        }
                      },
                    ),
                  ),

                  Container(height: 8,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
