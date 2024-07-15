import 'package:dbmallmanager/data/product/ProductType.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class item_demo extends StatefulWidget {
  final ProductType type;
  const item_demo({super.key, required this.type});

  @override
  State<item_demo> createState() => _item_demoState();
}

class _item_demoState extends State<item_demo> {

  String url = '';

  void _getImageURL() async {
    final ref = FirebaseStorage.instance.ref().child('productType').child(widget.type.id + '.png');
    url = await ref.getDownloadURL();
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getImageURL();
  }

  @override
  Widget build(BuildContext context) {
    double width = 392.72727272727275;
    return Container(
      width: (width - 60)/3,
      height: (width - 60)/3 + 40,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 40,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  color: Color.fromARGB(255, 219, 219, 219),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      image: url != '' ? DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(url),
                      ) : null,
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 30,
              alignment: Alignment.center,
              child: Text(
                widget.type.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'muli',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
