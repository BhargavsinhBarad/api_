import 'dart:convert';
import 'dart:developer';

import 'package:api/api/api.dart';
import 'package:api/model/api.dart';
import 'package:flutter/material.dart';

class getapipage extends StatelessWidget {
  getapipage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Getapi"),
      ),
      body: FutureBuilder(
        future: Api.api.getapi(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<Apimodel>? data = snapshot.data;
            return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    child: ListTile(
                      leading: Text("${data[i].id}"),
                      title: Text("${data[i].title}"),
                      subtitle: Text("${data[i].description}"),
                    ),
                  );
                });
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
