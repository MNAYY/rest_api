import 'package:flutter/material.dart';
import 'package:lecture7_api/constants/const_variables.dart';
import 'package:lecture7_api/repos/user_repo.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home(BuildContext context, {Key? key}) : super(key: key) {
    Provider.of<UserRepo>(context, listen: false)
        .getAllUsers(ConstVariables.baseURL + "users", ConstVariables.header);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<UserRepo>(builder: (context, repo, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("users"),
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(repo.usersList.elementAt(index).name ?? "hi"),
                  subtitle: Text(repo.usersList.elementAt(index).email ?? ""),
                );
              },
              itemCount: repo.usersList.length,
            ),
          ),
        ]),
      );
    });
  }
}
