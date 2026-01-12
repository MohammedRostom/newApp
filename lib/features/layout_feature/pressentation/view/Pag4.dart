import 'package:auth_feature_1_0/core/locator/locatorApp.dart';
import 'package:auth_feature_1_0/features/auth_feature/pressentation/viewmodel/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pag4 extends StatelessWidget {
  const Pag4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Id : => ${gtit<SharedPreferences>().getString("id")}"),
            Text(
              "Username : => ${gtit<SharedPreferences>().getString("username")}",
            ),
            Text("Email : => ${gtit<SharedPreferences>().getString("email")}"),
          ],
        ),
      ),
    );
  }
}
