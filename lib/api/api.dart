import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/api.dart'; // Import your Apimodel class here

class Api {
  Api._();
  static final Api api = Api._();

  Future<List<Apimodel>?> getapi() async {
    var res = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (res.statusCode == 200) {
      var ans = res.body;
      List body = jsonDecode(ans);
      List<Apimodel>? data = body.map((e) => Apimodel.api(e: e)).toList();
      print(ans);
      return data;
    } else {
      print("Error: ${res.statusCode}");
      return null;
    }
  }

  Future<Object> postapi({required String email, required String pass}) async {
    http.Response response = await http.post(
        Uri.parse("https://uat.redprix.com/api/login"),
        body: {"email": "$email", "password": "$pass"});
    if (response.statusCode == 200) {
      print("${response.body}");
      return response.body;
    } else {
      print("${response.statusCode}");
      return response;
    }

  }
}
