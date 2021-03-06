import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola_admin/config/app_colors.dart';
import 'package:hola_admin/config/app_config.dart';
import 'package:hola_admin/controller/login_screen_controller.dart';
import 'package:hola_admin/view/reset_password.dart';
import 'package:hola_admin/widgets/circular_loader.dart';

class LoginScreen extends StatelessWidget {
  LoginScreenController loginCtrl = Get.put(LoginScreenController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/da.jpg',
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    spreadRadius: 2,
                    //offset: Offset(3, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(30),
                shape: BoxShape.rectangle,
                color: AppColors.kD8D8D8,
              ),
              height: MediaQuery.of(context).size.height / 1,
              width: MediaQuery.of(context).size.width / 2,
              margin: EdgeInsets.all(100),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
                child: Form(
                  key: loginCtrl.formKey,
                  child: Obx(
                    () => loginCtrl.forgotPassword.value
                        ? ResetPassword()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Hola Admin Panel",
                                style: kInterText.copyWith(
                                    color: AppColors.kff4165,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: loginCtrl.email,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter your email address";
                                    }
                                    if (!GetUtils.isEmail(value)) {
                                      return "Enter valid Email Address";
                                    } else
                                      return null;
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Email Id",
                                    hintStyle: kInterText.copyWith(
                                      color: AppColors.k2A1C37,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.kffffff,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColors.kffffff),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: loginCtrl.password,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Please enter a password";
                                    } else
                                      return null;
                                  },
                                  obscureText: loginCtrl.hidePassword.value,
                                  keyboardType: TextInputType.visiblePassword,
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        loginCtrl.hidePassword.value =
                                            !loginCtrl.hidePassword.value;
                                      },
                                      child: loginCtrl.hidePassword.value
                                          ? Icon(
                                              Icons.visibility_off,
                                              color: AppColors.kff4165,
                                            )
                                          : Icon(
                                              Icons.remove_red_eye_sharp,
                                              color: AppColors.kff4165,
                                            ),
                                    ),
                                    hintText: "Enter Your password",
                                    hintStyle: kInterText.copyWith(
                                      color: AppColors.k2A1C37,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.kffffff,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColors.kffffff),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                              loginCtrl.isLoading.value
                                  ? buildLoader()
                                  : button(
                                      buttonColor: AppColors.kff4165,
                                      txtSize: 15,
                                      txtColor: AppColors.kffffff,
                                      buttonTxt: "Login",
                                      onTap: () {
                                        if (loginCtrl.formKey.currentState
                                            .validate()) {
                                          loginCtrl.loginUser();
                                        }
                                      },
                                    ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  loginCtrl.forgotPassword.value = true;
                                },
                                child: Text(
                                  "Forgot Password ?",
                                  style: kInterText.copyWith(
                                      color: AppColors.kff4165,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
