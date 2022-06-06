import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testproject/models/listpojo.dart';

class Postservices {
  static var client = http.Client();
  static Future<List<Getlist>?> fetchList() async {
    String baseURL = "https://jsonplaceholder.typicode.com/posts";
    var response =
        await client.get(Uri.parse(baseURL), headers: <String, String>{
      "content-type": "application/json",
    });
    if (response.statusCode == 200) {
      print(response.body);
      return getlistFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Getlist>?> filterlist() async {
    String baseURL = "https://jsonplaceholder.typicode.com/posts?userId=2";
    var response =
        await client.get(Uri.parse(baseURL), headers: <String, String>{
      "content-type": "application/json",
    });
    if (response.statusCode == 200) {
      print(response.body);
      print('----------------filterdata');
      return getlistFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Getlist>?> deletepost(int id) async {
    String baseURL = "https://jsonplaceholder.typicode.com/posts/$id";
    var response =
        await client.get(Uri.parse(baseURL), headers: <String, String>{
      "content-type": "application/json",
    });
    if (response.statusCode == 200) {
      print("success");
      print("deleted");
      print(response.body);
      print('----------------deletepost');
      return filterlist();
    } else {
      throw Exception("failer to delete album");
    }
  }

  static Future<String?> createpost(Map<String, dynamic> data) async {
    String baseURL = "https://jsonplaceholder.typicode.com/posts";
    var response = await http.post(Uri.parse(baseURL),
        body: json.encode(data),
        headers: <String, String>{
          "content-type": "application/json",
        });
    //on postman its giving 201 response
    if (response.statusCode == 201) {
      print(response.body);
      return "success";
    } else {
      print('-----------------------${response.statusCode}');
      return null;
    }
  }

  static Future<String?> updatepost(
      String title, String body, String userId, int id) async {
    String baseURL = "https://jsonplaceholder.typicode.com/posts/$id";
    var response = await http.put(Uri.parse(baseURL),
        headers: <String, String>{
          "content-type": "application/json",
        },
        body: json.encode(<String, String>{
          'title': title,
          'body': body,
          'userId': userId,
          'id': id.toString(),
        }));
    //on postman its giving 201 response
    if (response.statusCode == 200) {
      print(response.body);
      print('success');
      return "success";
    } else {
      print('-----------------------${response.statusCode}');
      throw Exception("failed to update");
    }
  }
}
