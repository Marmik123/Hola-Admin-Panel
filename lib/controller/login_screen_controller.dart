import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola_admin/api/api_routes.dart';
import 'package:hola_admin/controller/users__screen_controller.dart';
import 'package:hola_admin/models/user.dart';
import 'package:hola_admin/repository/user_repository.dart';
import 'package:hola_admin/view/home_screen.dart';

class LoginScreenController extends GetxController {
  TextEditingController newPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();
  UsersScreenController userCtrl = Get.put(UsersScreenController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool forgotPassword = false.obs;
  RxBool hidePassword = false.obs;
  RxBool hideConfirmPassword = false.obs;
  RxBool isLoading = false.obs;

  Future<void> loginUser() async {
    isLoading.value = true;
    try {
      var response = await API.loginAdminUser({
        "email": email.text.trim(),
        "password": password.text.trim(),
      });

      if (response.statusCode == 200) {
        print(response.data);
        isLoading.value = false;
        setUserData(User.fromMap(response.data['data']['user']),
            response.data['data']['token']);
        Get.to(HomeScreen());
        //userCtrl.showUsersList();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> forgotUserPassword() async {
    isLoading.value = true;
    try {
      var response = await API.postForgotPassword({
        //"password": password.text.trim(),
      });

      if (response.statusCode == 200) {
        print(response.data);
        isLoading.value = false;
        Get.to(HomeScreen());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> resetUserPassword() async {
    isLoading.value = true;
    try {
      var response = await API.postResetPassword({
        "password": password.text.trim(),
      });

      if (response.statusCode == 200) {
        print(response.data);
        isLoading.value = false;
        Get.to(HomeScreen());
      }
    } catch (e) {
      print(e);
    }
  }
}
