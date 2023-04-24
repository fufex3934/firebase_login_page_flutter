
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopp/auth_controller.dart';
import 'package:shopp/welcome_page.dart';


class SignUpPage extends StatelessWidget {
   SignUpPage({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List images = [
      "g.png",
      "t.png",
      "f.png"
    ];

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
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const SizedBox(height: 50,),
                  Container(
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2)
                          )
                        ]
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.deepOrange,
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2)
                          )
                        ]
                    ),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(
                            Icons.padding_outlined,
                            color: Colors.deepOrange,
                          ),
                          focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          enabledBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1.0
                              )
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 70,),
            GestureDetector(
              onTap: (){
                AuthController.instance.register(_emailController.text, _passwordController.text);

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
                    "Sign up",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            RichText(
                text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = ()=>Get.back(),
                  text: "Have an account?",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[500]
                  )
            ),
            ),
            SizedBox(height: w*0.08,),
            RichText(
                text:  TextSpan(
                    text: "sign up using one of the following method",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16
                    ),
                )
            ),
            Wrap(
              children: List<Widget>.generate(3, (index) {
                return  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[500],
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        "image/${images[index]}"
                      ),

                    ),
                  ),
                );
              }),
            )

          ],
        ),
      ),
    );
  }
}
