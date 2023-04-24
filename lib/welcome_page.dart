import 'package:flutter/material.dart';
import 'package:shopp/auth_controller.dart';

class WelcomePage extends StatelessWidget {
  String email;
    WelcomePage({super.key,  required this.email});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h*0.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "image/signup.png"
                      )
                  )
              ),
              child: Column(
                children: [
                  SizedBox(height: h*0.14,),
                  const CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 60,
                    backgroundImage: AssetImage(
                        "image/profile1.png"
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 70,),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[500]
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 200,),
            GestureDetector(
              onTap: (){
                AuthController.instance.logout();
              },
              child: Container(
                width: w*0.5,
                height: h*0.08,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image:const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "image/loginbtn.png"
                        )
                    )
                ),
                child: const Center(
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
