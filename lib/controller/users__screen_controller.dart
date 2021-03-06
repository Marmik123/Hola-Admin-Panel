import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hola_admin/api/api_routes.dart';
import 'package:hola_admin/controller/pages_controller.dart';
import 'package:hola_admin/models/user.dart';
import 'package:hola_admin/repository/user_repository.dart';

class UsersScreenController extends GetxController {
  PagesController pagesCtrl = Get.put(PagesController());

  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxString searchedName = "".obs;
  RxString userId = "".obs;
  RxInt pageNumber = 1.obs;
  RxList usersList = [].obs;
  int totalPages;
  int totalSearchedUser;
  RxList searchedList = [].obs;
  RxString userQuerySearch = "".obs;
  RxBool onSearched = false.obs;
  RxBool applyBorder = false.obs;
  TextEditingController searchField = TextEditingController();
/*

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pagesCtrl.displayPagesList();
  }
*/

  Future<void> showUsersList(int pageNumber) async {
    isLoading.value = true;
    try {
      var response = await API.getUsersList(
        {
          "token": GetStorage().read(kToken),
        },
        pageNumber,
      );
      if (response.statusCode == 200) {
        print(response.data);

        usersList.addAll(List.generate(response.data['data']['docs'].length,
            (index) => User.fromMap(response.data['data']['docs'][index])));
        isLoading.value = false;
        totalPages = response.data['data']['totalPages'];
        /* setPageDetails(response.data['data']['totalPages'],
            response.data['data']['limit'], response.data['data']['page']);*/
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> showSearchedUserList(int pageNumber) async {
    isLoading.value = true;
    try {
      var response = await API.getUsersList(
        {
          "token": GetStorage().read(kToken),
          "query_search": searchField.text.trim(),
        },
        pageNumber,
      );
      if (response.statusCode == 200) {
        print(response.data);
        searchedList.addAll(List.generate(response.data['data']['docs'].length,
            (index) => User.fromMap(response.data['data']['docs'][index])));
        isLoading.value = false;
        totalSearchedUser = response.data['data']['totalPages'];
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteUser() async {
    isLoading.value = true;
    try {
      var response = await API.deleteExistingUser(
        {
          "token": GetStorage().read(kToken),
        },
        userId.value,
      );
      if (response.statusCode == 200) {
        print(response.data);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }
  }

  void displaySearchedUser() {
    onSearched.value == false ? showSearchedUserList(1) : null;
    onSearched.value = true;
  }
}
