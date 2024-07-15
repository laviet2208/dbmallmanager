import 'package:dbmallmanager/manager/product_manager/product_list/action/add_new_product/add_new_product.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'main_screen/main_manager_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyB6IQCpkuF7AOwE3JyI0FPIuqMNIOJHn0s",
        authDomain: "dbmall-onelink-01.firebaseapp.com",
        databaseURL: "https://dbmall-onelink-01-default-rtdb.firebaseio.com",
        projectId: "dbmall-onelink-01",
        storageBucket: "dbmall-onelink-01.appspot.com",
        messagingSenderId: "201552769484",
        appId: "1:201552769484:web:56b19f3dd9a374246dad69",
        measurementId: "G-0G2HL71SVZ"
    ),
  );
  // finalUnchangeData.lastOrderTime = DateTime.now().add(Duration(seconds: 90));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý DB mall',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'admin/mainscreen',
      routes: {
        'admin/mainscreen': (context) => const main_manager_screen(),
        'admin/addproduct': (context) => const add_new_product(),
      },
    );
  }
}
