// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:lecture7_api/models/user.dart';

class UserServices {
  Future<List<User>> getAllUsers(String url, Map<String, String> header) async {
    var uri = Uri.parse(url);
    List<User> usersList = [];

    var response = await http.get(uri, headers: header);

    if (response.statusCode == 200) {
      List<dynamic> res = json.decode(response.body);
      res.forEach((e) {
        usersList.add(User.fromJson(e));
      });
    }

    return usersList;
  }
}

UserServices userServices = UserServices();
