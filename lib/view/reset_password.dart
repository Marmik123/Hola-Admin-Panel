import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola_admin/config/app_colors.dart';
import 'package:hola_admin/config/app_config.dart';
import 'package:hola_admin/controller/login_screen_controller.dart';

class ResetPassword extends StatelessWidget {
  LoginScreenController loginCtrl = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Reset Password",
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
                controller: loginCtrl.newPassword,
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
                  hintText: "Enter Your New password",
                  hintStyle: kInterText.copyWith(
                    color: AppColors.k2A1C37,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: AppColors.kffffff,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.kffffff),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: loginCtrl.confirmPassword,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Enter your password";
                  }
                  if (loginCtrl.newPassword.text !=
                      loginCtrl.confirmPassword.text) {
                    return "Password do not match";
                  } else
                    return null;
                },
                obscureText: loginCtrl.hideConfirmPassword.value,
                keyboardType: TextInputType.visiblePassword,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      loginCtrl.hideConfirmPassword.value =
                          !loginCtrl.hideConfirmPassword.value;
                    },
                    child: loginCtrl.hideConfirmPassword.value
                        ? Icon(
                            Icons.visibility_off,
                            color: AppColors.kff4165,
                          )
                        : Icon(
                            Icons.remove_red_eye_sharp,
                            color: AppColors.kff4165,
                          ),
                  ),
                  hintText: "Confirm Your password",
                  hintStyle: kInterText.copyWith(
                    color: AppColors.k2A1C37,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: AppColors.kffffff,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.kffffff),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            button(
              buttonColor: AppColors.kff4165,
              txtSize: 15,
              txtColor: AppColors.kffffff,
              buttonTxt: "Continue",
              onTap: () {
                if (loginCtrl.formKey.currentState.validate()) {
                  loginCtrl.forgotPassword.value = false;
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
