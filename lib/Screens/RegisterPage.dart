import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vigenesia/Constant/const.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:dio/dio.dart';
import 'package:vigenesia/Screens/LoginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Ganti Base URL

  String baseurl = url;

  Future postRegister(
      String nama, String profesi, String email, String password) async {
    var dio = Dio();

    dynamic data = {
      "nama": nama,
      "profesi": profesi,
      "email": email,
      "password": password
    };

    try {
      final response = await dio.post("$baseurl/api/registrasi",
          data: data,
          options: Options(headers: {'Content-type': 'application/json'}));

      print("Respon -> ${response.data} + ${response.statusCode}");

      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print("Failed To Load $e");
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController profesiController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      //  untuk bisa scroll
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SafeArea(
                  child: Text(
                    "JoinWith Us",
                    style: TextStyle(
                      color: Color(0xFF2075BF),
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                height: 300, child: Image.asset("assets/images/register.png")),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Form(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: "name",
                        controller: nameController,
                        cursorColor: Color(0xFF2075BF),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 20.0),
                          labelText: 'Name',
                          hintText: 'Name',
                          labelStyle: TextStyle(
                            color: Color(0xFF2075BF),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          prefixIcon: Icon(
                            Iconsax.user,
                            color: Color(0xFF2075BF),
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade200, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF2075BF), width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FormBuilderTextField(
                        name: "profesi",
                        controller: profesiController,
                        cursorColor: Color(0xFF2075BF),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 20.0),
                          labelText: 'Profesi',
                          hintText: 'Profesi',
                          labelStyle: TextStyle(
                            color: Color(0xFF2075BF),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          prefixIcon: Icon(
                            Iconsax.code,
                            color: Color(0xFF2075BF),
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade200, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF2075BF), width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FormBuilderTextField(
                        name: "email",
                        controller: emailController,
                        cursorColor: Color(0xFF2075BF),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 20.0),
                          labelText: 'Email',
                          hintText: 'Email',
                          labelStyle: TextStyle(
                            color: Color(0xFF2075BF),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          prefixIcon: Icon(
                            Iconsax.note,
                            color: Color(0xFF2075BF),
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade200, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF2075BF), width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FormBuilderTextField(
                        obscureText:
                            true, // <-- Buat bikin setiap inputan jadi bintang " * "
                        name: "password",
                        controller: passwordController,
                        cursorColor: Color(0xFF2075BF),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 20.0),
                          labelText: 'Password',
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                          labelStyle: TextStyle(
                            color: Color(0xFF2075BF),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          prefixIcon: Icon(
                            Iconsax.key,
                            color: Color(0xFF2075BF),
                            size: 18,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade200, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFF2075BF), width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () async {
                await postRegister(nameController.text, profesiController.text,
                        emailController.text, passwordController.text)
                    .then((value) => {
                          if (value != null)
                            {
                              setState(() {
                                Navigator.pop(context);
                                Flushbar(
                                  message: "Berhasil Registrasi",
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.greenAccent,
                                  flushbarPosition: FlushbarPosition.TOP,
                                ).show(context);
                              })
                            }
                          else if (value == null)
                            {
                              Flushbar(
                                message: "Check Your Field Before Register",
                                duration: Duration(seconds: 5),
                                backgroundColor: Colors.redAccent,
                                flushbarPosition: FlushbarPosition.TOP,
                              ).show(context)
                            }
                        });
              },
              height: 45,
              color: Color(0xFF2075BF),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600),
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OutlineButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new LoginPage()));
              },
              borderSide: BorderSide(color: Color(0xFF2075BF)),
              splashColor: Color(0xFFF9F9F9),
              color: Color(0xFFF9F9F9),
              child: Text(
                "Have Account",
                style: TextStyle(
                    color: Color(0xFF2075BF),
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600),
              ),
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 67),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
