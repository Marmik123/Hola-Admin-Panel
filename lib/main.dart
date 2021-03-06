import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hola_admin/repository/user_repository.dart';
import 'package:hola_admin/view/home_screen.dart';
import 'package:hola_admin/view/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
            name: '/',
            page: () {
              return GetStorage().hasData(kToken)
                  ? HomeScreen()
                  : LoginScreen();
            })
      ],
    );
  }
}
