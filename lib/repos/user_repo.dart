import 'package:flutter/cupertino.dart';
import 'package:lecture7_api/models/user.dart';

import '../services/user_services.dart';

class UserRepo extends ChangeNotifier {
  List<User> usersList = [];
  void getAllUsers(String url, Map<String, String> header) async {
    usersList = await userServices.getAllUsers(url, header);
    notifyListeners();
  }
}

UserRepo userRepo = UserRepo();
