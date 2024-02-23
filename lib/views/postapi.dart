import 'dart:developer';

import 'package:api/api/api.dart';
import 'package:api/views/getapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class postapi extends StatelessWidget {
  postapi({super.key});
  @override
  String? email;
  String? password;
  TextEditingController emailcon = TextEditingController();
  TextEditingController passlcon = TextEditingController();

  Future<void> api({required String email, required String pass}) async {
    var ans = await http.post(Uri.parse("https://uat.redprix.com/api/login"),
        body: {"email": "$email", "password": "$pass"});
    if (ans.statusCode == 200) {
      print("${ans.body}");
      Get.snackbar("login ", "successfully");
      Get.to(() => getapipage());
    } else {
      print("${ans.statusCode}");
      Get.snackbar("login", "failed");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("loginapi"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Email",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                  TextFormField(
                    onChanged: (val) {
                      email = val;
                    },
                    controller: emailcon,
                    decoration: InputDecoration(
                      hintText: "ritik@gamil.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Password",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                  TextFormField(
                    onChanged: (val) {
                      password = val;
                    },
                    controller: passlcon,
                    decoration: InputDecoration(
                      hintText: "123456",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                    onTap: () {
                      var ans = api(email: email!, pass: password!);
                      emailcon.clear();
                      passlcon.clear();
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          "Login ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
