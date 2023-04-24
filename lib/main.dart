import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopp/auth_controller.dart';
import 'package:shopp/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopp/splash_screen.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: LoginPage(),
    );
  }
}
