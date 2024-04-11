import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}
class _MyLoginState extends State<MyLogin>{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    if(email == "" || password == "" || cPassword == "") {
      log("Please fill all the details!");
    }
    else if(password != cPassword){
      log("Passwords do not match!");
    }
    else{
      try {
        //Create New account
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null){
          Navigator.pop(context);
        }
        log("User created!");
      } on FirebaseAuthException catch(ex) {
        log(ex.code.toString());
      }
    }
  }

  @override
  Widget build (BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login1.jpg'),fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 145, top: 220),
              child: Text('Welcome!\n', style: TextStyle(
                  color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.40,
                    right: 24,
                    left: 24),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Student / College Email',
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),

                        ),),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    TextField(
                      controller: cPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: ' Confirm Password',
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),

                        ),),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Sign In', style: TextStyle(
                            color: Color(0xf0f0f0f0),
                            // onPressed: (){},
                            fontSize: 27,fontWeight: FontWeight.w700
                        ),),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xf0f0f0f0),
                          child: IconButton(
                            color: Colors.black,
                            onPressed: (){
                              Navigator.pushNamed(context, 'homepage');
                            },
                            icon: Icon(Icons.arrow_forward),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      children: [
                        TextButton(onPressed: (){
                          createAccount();
                          Navigator.pushNamed(context, 'register');
                        }, child: Text('Create an\naccount',style: TextStyle(
                            fontSize: 18,
                            color: Color(0xf0f0f0f0)
                        ),)),
                        TextButton(onPressed: (){}, child: Text('Forgot Password',style: TextStyle(
                            fontSize: 18,
                            color: Color(0xf0f0f0f0)
                        ),))
                      ],
                    ),


                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}