
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopp/welcome_page.dart';

import 'login_page.dart';

class AuthController extends GetxController{

  static AuthController  instance = Get.find();

  late Rx<User?> _user ;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    _user = auth.currentUser as Rx<User?>;
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
    super.onReady();
  }

  _initialScreen(User? user){
    if(user == null){
      print('login page');
      Get.offAll(()=>const LoginPage());
    }else{
        Get.offAll(()=>WelcomePage(email:user.email!));
    }
  }

  void register(String email, String password) async{
   try{
     await auth.createUserWithEmailAndPassword(email: email, password: password);
     _initialScreen(auth.currentUser);
   }catch(e){
      Get.snackbar(
        "About User", 'User Message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
            'Account Creation Failed',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white
          ),
        )
      );
   }
  }
  void login(String email, String password) async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      _initialScreen(auth.currentUser);
    }catch(e){
      Get.snackbar(
          "About Login", 'Login Message',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            'Login Failed',
            style: TextStyle(
                color: Colors.white
            ),
          ),
          messageText: Text(
            e.toString(),
            style: const TextStyle(
                color: Colors.white
            ),
          )
      );
    }
  }

  void logout()async{
     await auth.signOut();
     _initialScreen(auth.currentUser);
  }

}