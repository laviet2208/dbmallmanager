import 'package:auto_size_text/auto_size_text.dart';
import 'package:dbmallmanager/data/Ads/TextAds.dart';
import 'package:dbmallmanager/general_ingredient/text_line_in_item.dart';
import 'package:dbmallmanager/manager/ui_manager/ads_manager/actions/change_ads_sub_title.dart';
import 'package:dbmallmanager/manager/ui_manager/ads_manager/actions/change_ads_title.dart';
import 'package:dbmallmanager/manager/ui_manager/ads_manager/actions/product_search.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../use_screen/page/main_page/ingredient/text_ads.dart';

class ads_text_manager extends StatefulWidget {
  final String id;
  const ads_text_manager({super.key, required this.id});

  @override
  State<ads_text_manager> createState() => _ads_text_managerState();
}

class _ads_text_managerState extends State<ads_text_manager> {
  TextAds ads = TextAds(id: '', title: '', productId: '', subTitle: '');

  void get_ads() {
    if (widget.id != '') {
      final reference = FirebaseDatabase.instance.ref();

      reference.child("Ads/TextAds").child(widget.id).onValue.listen((event) {
        final dynamic data = event.snapshot.value;
        ads = TextAds.fromJson(data);
        setState(() {

        });
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_ads();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 392.72727272727275,
      child: ListView(
        children: [
          text_ads(title: ads.title, subtitle: ads.subTitle, backgroundColor: widget.id == 'textAds1' ? Color.fromARGB(255, 76, 147, 251) : Color.fromARGB(255, 1, 60, 102), textColor: widget.id == 'textAds1' ? Colors.black : Color.fromARGB(255, 211, 239, 253),),

          SizedBox(height: 10,),

          text_line_in_item(title: 'Tiêu đề chính: ', content: ads.title, color: Colors.black),

          SizedBox(height: 10,),

          text_line_in_item(title: 'Tiêu đề phụ: ', content: ads.subTitle, color: Colors.black),

          SizedBox(height: 10,),

          text_line_in_item(title: 'Sản phẩm quảng cáo: ', content: ads.productId, color: Colors.black),

          SizedBox(height: 10,),

          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return change_ads_title(id: widget.id, title: ads.title);
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0), // Đặt border radius ở đây
                ),
              ),
            ),
            child: Text(
              'Cập nhật tiêu đề chính',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),

          SizedBox(height: 10,),

          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return change_ads_sub_title(id: widget.id, title: ads.subTitle);
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0), // Đặt border radius ở đây
                ),
              ),
              side: WidgetStateProperty.all(const BorderSide(color: Colors.black, width: 1)),
            ),
            child: Text(
              'Cập nhật tiêu đề phụ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),

          SizedBox(height: 10,),

          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return product_search(id: widget.id);
                },
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0), // Đặt border radius ở đây
                ),
              ),
            ),
            child: Text(
              'Sản phẩm quảng cáo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
