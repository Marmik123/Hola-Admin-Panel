import 'dart:core';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:hola_admin/api/http_service.dart';
import 'package:hola_admin/controller/users__screen_controller.dart';

class API {
  static HttpService _httpService = HttpService.getInstance();
  static int pagenumber = 1;
  UsersScreenController ctrl = Get.put(UsersScreenController());
  //AUTH BASE URL
  static String baseUrl = "https://hola.api.dharmatech.in/api/cms/auth";
  static String usersbaseUrl =
      "https://hola.api.dharmatech.in/api/cms/v1/users";
  static String pagesBaseUrl =
      "https://hola.api.dharmatech.in/api/cms/v1/pages";

  //ROUTES
  static String loginUser = baseUrl + "/login";
  static String forgotPassword = baseUrl + "/forgot-password";
  static String resetPassword = baseUrl + "/reset-password";
  static String userDetails = baseUrl + "/add-user-details";

  static String usersList = usersbaseUrl + "/list/";
  static String getUser = usersbaseUrl + "/get/:id";
  static String updateUser = usersbaseUrl + "/update/:id";
  static String deleteUser = usersbaseUrl + "/delete/";
  static String createUser = usersbaseUrl + "/create";

  static String pagesUrl = "";
  static String pagesList = pagesBaseUrl + "/list";
  static String createNewPage = pagesBaseUrl + "/create";

  static Future<Response> loginAdminUser(Map<String, dynamic> args) {
    return _httpService.post(loginUser, args);
  }

  static Future<Response> postForgotPassword(Map<String, dynamic> args) {
    return _httpService.post(forgotPassword, args);
  }

  static Future<Response> postResetPassword(Map<String, dynamic> args) {
    return _httpService.post(resetPassword, args);
  }

  static Future<Response> getStaticPages(Map<String, dynamic> args) {
    return _httpService.post(pagesUrl, args);
  }

  static Future<Response> getUsersList(
      Map<String, dynamic> args, dynamic pageNumber) {
    return _httpService.post(usersList + pageNumber.toString(), args);
  }

  static Future<Response> deleteExistingUser(
      Map<String, dynamic> args, dynamic id) {
    return _httpService.delete(deleteUser + id, args);
  }

  static Future<Response> getPagesList(Map<String, dynamic> args) {
    return _httpService.post(pagesList, args);
  }

  static Future<Response> createPage(Map<String, dynamic> args) {
    return _httpService.put(createNewPage, args);
  }
}
