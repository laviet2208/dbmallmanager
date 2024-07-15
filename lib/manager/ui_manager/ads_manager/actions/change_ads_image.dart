import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../../../general_ingredient/utils.dart';

class change_ads_image extends StatefulWidget {
  final String id;
  const change_ads_image({super.key, required this.id});

  @override
  State<change_ads_image> createState() => _change_ads_imageState();
}

class _change_ads_imageState extends State<change_ads_image> {
  Uint8List? registrationImage;
  bool loading = false;

  Future<Uint8List?> galleryImagePicker() async {
    Uint8List? bytesFromPicker = await ImagePickerWeb.getImageAsBytes();
    return bytesFromPicker;
  }

  Future<void> uploadImageToFirebaseStorage(Uint8List imageBytes, String imageName) async {
    try {
      // Tạo tham chiếu đến Firebase Storage
      Reference storageReference =
      FirebaseStorage.instance.ref().child('ads/$imageName.png');

      // Đặt loại (MIME type) là 'image/png'
      SettableMetadata metadata = SettableMetadata(contentType: 'image/png');

      // Upload dữ liệu của ảnh lên Firebase Storage với metadata
      UploadTask uploadTask = storageReference.putData(imageBytes, metadata);

      // Lắng nghe sự kiện khi upload hoàn thành
      await uploadTask.whenComplete(() => print('Upload completed'));
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Cập nhật ảnh quảng cáo'),
      content: GestureDetector(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(2),
            child:registrationImage == null
                ? Icon(Icons.image_outlined, size: 20.0, color: Colors.black,)
                : Image.memory(registrationImage!, fit: BoxFit.fitHeight,),
          ),
        ),
        onTap: () async {
          final Uint8List? image = await galleryImagePicker();

          if (image != null) {
            registrationImage = image;
            toastMessage('Thêm ảnh thành công');
            setState(() {});
          }
        },
      ),
      actions: <Widget>[
        !loading ? TextButton(
          onPressed: () async {
            if (registrationImage != null) {
              setState(() {
                loading = true;
              });
              await uploadImageToFirebaseStorage(registrationImage!, widget.id);
              setState(() {
                loading = false;
              });
              toastMessage('Cập nhật thành công');
              Navigator.of(context).pop();
            }
          },
          child: Text(
            'Lưu hình ảnh',
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
        ) : CircularProgressIndicator(color: Colors.blueAccent,),

        !loading ? TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Đóng',
            style: TextStyle(
              color: Colors.redAccent,
            ),
          ),
        ) : CircularProgressIndicator(color: Colors.redAccent,),
      ],
    );
  }
}
