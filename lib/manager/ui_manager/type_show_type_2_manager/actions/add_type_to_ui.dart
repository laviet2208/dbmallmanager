import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../data/product/ProductType.dart';
import '../../../../general_ingredient/utils.dart';

class add_type_to_ui extends StatefulWidget {
  final List<ProductType> typeList;
  const add_type_to_ui({super.key, required this.typeList});

  @override
  State<add_type_to_ui> createState() => _add_type_to_uiState();
}

class _add_type_to_uiState extends State<add_type_to_ui> {
  String query = '';
  final control = TextEditingController();
  List<ProductType> filteredList = [];
  final List<ProductType> list_type = [];

  void get_type_data() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("productType").onValue.listen((event) {
      list_type.clear();
      final dynamic orders = event.snapshot.value;
      orders.forEach((key, value) {
        ProductType type = ProductType.fromJson(value);
        list_type.add(type);
        filteredList = list_type.where((product) => product.name.toLowerCase().contains(query.toLowerCase())).toList();
      });
      setState(() {

      });
    });
  }

  Future<void> push_new_producttype() async{
    try {
      DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
      await databaseRef.child("UI").child('productType1').child('list').set(widget.typeList.map((e) => e.toJson()).toList());
    } catch (error) {
      print('Đã xảy ra lỗi khi đẩy catchOrder: $error');
      throw error;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_type_data();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Thêm phân loại hiển thị'),
      content: Padding(
        padding: EdgeInsets.only(left: 0),
        child: Container(
          width: 350,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: control,
                onChanged: (value) {
                  setState(() {
                    query = value;
                    filteredList = list_type.where((product) => product.name.toLowerCase().contains(query.toLowerCase())).toList();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Tìm kiếm loại sản phẩm',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: ListTile(
                        title: Text(filteredList[index].name),
                        onTap: () async {
                          toastMessage('Vui lòng chờ');
                          control.text = filteredList[index].name;
                          widget.typeList.add(filteredList[index]);
                          await push_new_producttype();
                          setState(() {

                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(onPressed: () {Navigator.of(context).pop();}, child: Text('Đóng', style: TextStyle(color: Colors.redAccent),)),
      ],
    );
  }
}
