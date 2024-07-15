import 'package:dbmallmanager/manager/ui_manager/ads_manager/ingredient/ads_image_manager.dart';
import 'package:dbmallmanager/manager/ui_manager/ads_manager/ingredient/ads_text_manager.dart';
import 'package:flutter/material.dart';

import '../use_screen/page/main_page/ingredient/text_ads.dart';

class ads_manager_main extends StatefulWidget {
  const ads_manager_main({super.key});

  @override
  State<ads_manager_main> createState() => _ads_manager_mainState();
}

class _ads_manager_mainState extends State<ads_manager_main> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20;
    double height = MediaQuery.of(context).size.height - 80;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: 10,
            bottom: 10,
            child: ads_text_manager(id: 'textAds1'),
          ),

          Positioned(
            top: 10,
            left: 30 + 392.72727272727275,
            bottom: 10,
            child: ads_text_manager(id: 'textAds2'),
          ),

          Positioned(
            top: 10,
            left: 50 + 392.72727272727275 * 2,
            bottom: 10,
            child: ads_image_manager(id: 'imageAds1'),
          ),
        ],
      ),
    );
  }
}
