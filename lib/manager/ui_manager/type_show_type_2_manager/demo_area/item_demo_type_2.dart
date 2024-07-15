import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallmanager/data/product/ProductType.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class item_demo_type_2 extends StatefulWidget {
  final ProductType type;
  const item_demo_type_2({super.key, required this.type});

  @override
  State<item_demo_type_2> createState() => _item_demo_type_2State();
}

class _item_demo_type_2State extends State<item_demo_type_2> {
  String url = '';

  Future<String> _getImageURL() async {
    final ref = FirebaseStorage.instance.ref().child('productType').child(widget.type.id + '.png');
    final url = await ref.getDownloadURL();
    return url;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = 392.72727272727275;
    return Container(
      width: width/2,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: 10,
            right: 10,
            child: Container(
              height: 18,
              child: AutoSizeText(
                widget.type.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'muli',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 100,
                ),
              ),
            ),
          ),

          Positioned(
            top: 35,
            bottom: 5,
            right: 10,
            child: Container(
              width: 80,
              child: FutureBuilder(
                future: _getImageURL(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text('Ảnh lỗi hoặc chưa có ảnh',style: TextStyle(color: Colors.black, fontFamily: 'muli', fontSize: 13),textAlign: TextAlign.center,),
                    );
                  }

                  if (!snapshot.hasData) {
                    return Text('Image not found');
                  }

                  return Image.network(snapshot.data.toString(),fit: BoxFit.fitHeight,);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
