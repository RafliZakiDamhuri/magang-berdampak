import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:magang_3/Models/user_model/user_model.dart';

class Page3Provider with ChangeNotifier {
  UserModel? userModel;
  Future<void> getUsers() async {
    String apiUrl = 'https://reqres.in/api/users?page=1&per_page=10';
    Uri url = Uri.parse(apiUrl);

    var apiResult = await http.get(
      url,
      headers: {'x-api-key': 'reqres-free-v1'},
    );
    var data = jsonDecode(apiResult.body);
    userModel = UserModel.fromJson(data);
    notifyListeners();
  }
}
