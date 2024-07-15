import 'package:dbmallmanager/manager/ui_manager/use_screen/main_screen/main_screen.dart';
import 'package:flutter/material.dart';

class ui_manager_main extends StatefulWidget {
  const ui_manager_main({super.key});

  @override
  State<ui_manager_main> createState() => _ui_manager_mainState();
}

class _ui_manager_mainState extends State<ui_manager_main> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 100,
            top: 0,
            bottom: 0,
            child: Container(
              // height: 825.4545454545455,
              width: 392.72727272727275,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: main_screen(),
            ),
          )
        ],
      ),
    );
  }
}
