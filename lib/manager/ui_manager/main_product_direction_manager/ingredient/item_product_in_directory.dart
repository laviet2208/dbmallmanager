import 'package:dbmallmanager/data/otherdata/Tool.dart';
import 'package:dbmallmanager/data/product/Product.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class item_product_in_directory extends StatefulWidget {
  final String id;
  const item_product_in_directory({super.key, required this.id});

  @override
  State<item_product_in_directory> createState() => _item_product_in_directoryState();
}

class _item_product_in_directoryState extends State<item_product_in_directory> {
  String url = '';
  Product product = Product(id: '', name: '', productType: '', showStatus: 0, createTime: getCurrentTime(), description: '', directoryList: [], cost: 0, costBeforeSale: 0, inventory: 0, saleLimit: getCurrentTime(), subdescription: '');

  void _getImageURL() async {
    final ref = FirebaseStorage.instance.ref().child('product').child(widget.id).child(widget.id + '_0.png');
    url = await ref.getDownloadURL();
    setState(() {

    });
  }

  void getData() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("productList").child(widget.id).onValue.listen((event) {
      final dynamic orders = event.snapshot.value;
      product = Product.fromJson(orders);
      _getImageURL();
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _getImageURL();
  }

  @override
  Widget build(BuildContext context) {
    double width = 392.72727272727275;
    return Container(
      width: (width - 100)/2,
      height: 240,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Đặt bán kính bo tròn
            child: Container(
              width: (width - 100) / 2,
              height: (width - 100) / 2,
              decoration: url != '' ? BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(url),
                ),
              ) : null,
            ),
          ),


          SizedBox(height: 5,),

          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'muli',
                fontSize: width/30,
                color: Colors.black,
              ),
            ),
          ),

          SizedBox(height: 5,),

          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              getStringNumber(product.cost) + ' VND',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'muli',
                fontSize: width/25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          SizedBox(height: 5,),

          product.costBeforeSale != 0 ? Container(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: getStringNumber(product.costBeforeSale) + ' VND',
                    style: TextStyle(
                      fontSize: width / 35,
                      fontFamily: 'muli',
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough, // Thêm gạch chéo
                      decorationColor: Colors.grey, // Màu gạch chéo
                      decorationThickness: 2,
                    ),
                  ),

                  TextSpan(
                    text: ' . ' + calculateDiscountPercentage(product.costBeforeSale, product.cost).toString() + '% off',
                    style: TextStyle(
                      fontSize: width/35,
                      fontFamily: 'muli',
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
