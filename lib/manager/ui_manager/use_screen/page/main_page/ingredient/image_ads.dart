import 'package:dbmallmanager/manager/ui_manager/use_screen/page/main_page/ingredient/text_ads.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class image_ads extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color textColor;
  final String url;
  const image_ads({super.key, required this.title, required this.subtitle, required this.backgroundColor, required this.textColor, required this.url});

  @override
  Widget build(BuildContext context) {

    Future<String> _getImageURL() async {
      final ref = FirebaseStorage.instance.ref().child('ads/imageAds1.png');
      final url = await ref.getDownloadURL();
      return url;
    }

    double width = 392.72727272727275;
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          text_ads(title: title, subtitle: subtitle, backgroundColor: backgroundColor, textColor: textColor),


          // child: Container(
          //   decoration: url == '' ? null : BoxDecoration(
          //     image: DecorationImage(
          //       fit: BoxFit.fitHeight,
          //       image: NetworkImage(url),
          //     ),
          //   ),
          // ),

          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 219, 59, 7),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 0, bottom: 5, left: 0, right: 0),
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
          ),
        ],
      ),
    );
  }
}
