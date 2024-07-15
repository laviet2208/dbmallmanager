import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../general_ingredient/textfield_type_1.dart';
import '../../../../general_ingredient/utils.dart';

class change_type_title extends StatefulWidget {
  final String title;
  const change_type_title({super.key, required this.title});

  @override
  State<change_type_title> createState() => _change_type_titleState();
}

class _change_type_titleState extends State<change_type_title> {
  bool loading = false;
  final titleController = TextEditingController();

  Future<void> change_title(String title) async{
    try {
      DatabaseReference databaseRef = FirebaseDatabase.instance.ref();
      await databaseRef.child('UI').child('productType1').child('title').set(title);
      setState(() {
        loading = false;
      });
      toastMessage('Cập nhật thành công');
    } catch (error) {
      print('Đã xảy ra lỗi khi đẩy catchOrder: $error');
      throw error;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Câp nhật tiêu đề', style: TextStyle(fontFamily: 'muli'),),
      content: Container(
        width: 200,
        child: textfield_type_1(title: 'Nhập tiêu đề mới', hint: 'Tiêu đề', controller: titleController),
      ),
      actions: <Widget>[
        !loading ? TextButton(
          child: Text('Đồng ý', style: TextStyle(color: Colors.blue),),
          onPressed: () async {
            if (!loading) {
              if (titleController.text.isNotEmpty) {
                setState(() {
                  loading = true;
                });
                await change_title(titleController.text.toString());
                setState(() {
                  loading = false;
                });
                toastMessage('Sửa thành công');
                Navigator.of(context).pop();
              } else {
                toastMessage('Nhập đủ thông tin trước');
              }
            } else {

            }
          },
        ) : CircularProgressIndicator(color: Colors.blue,),

        !loading ? TextButton(
          child: Text('Hủy', style: TextStyle(color: Colors.red),),
          onPressed: () async {
            if (!loading) {
              Navigator.of(context).pop();
            } else {

            }
          },
        ) : CircularProgressIndicator(color: Colors.red,),
      ],
    );
  }
}
