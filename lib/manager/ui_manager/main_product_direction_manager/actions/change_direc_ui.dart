import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../data/product/ProductDirectory.dart';
import '../../../../general_ingredient/utils.dart';

class change_direc_ui extends StatefulWidget {
  const change_direc_ui({super.key});

  @override
  State<change_direc_ui> createState() => _change_direc_uiState();
}

class _change_direc_uiState extends State<change_direc_ui> {
  String query = '';
  final control = TextEditingController();
  List<ProductDirectory> filteredList = [];
  final List<ProductDirectory> directory_type = [];

  static Future<void> change_direct(String id) async{
    try {
      DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
      await databaseRef.child("UI").child('maindirectory').set(id);
    } catch (error) {
      print('Đã xảy ra lỗi khi đẩy catchOrder: $error');
      throw error;
    }
  }

  void get_directory_data() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("productDirectory").onValue.listen((event) {
      directory_type.clear();
      final dynamic orders = event.snapshot.value;
      orders.forEach((key, value) {
        ProductDirectory directory = ProductDirectory.fromJson(value);
        directory_type.add(directory);
        filteredList = directory_type.where((product) => product.name.toLowerCase().contains(query.toLowerCase())).toList();
      });
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_directory_data();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 350,
        height: 350,
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            children: [
              TextField(
                controller: control,
                onChanged: (value) {
                  setState(() {
                    query = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Tìm kiếm danh mục sản phẩm',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              Expanded(
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
                          toastMessage('Vui lòng đợi');
                          control.text = filteredList[index].name;
                          await change_direct(filteredList[index].id);
                          setState(() {

                          });
                          toastMessage('Thêm thành công');
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
    );
  }
}
