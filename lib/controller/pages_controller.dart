import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hola_admin/api/api_routes.dart';
import 'package:hola_admin/models/pages.dart';
import 'package:hola_admin/repository/user_repository.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

class PagesController extends GetxController {
  RxBool isLoading = false.obs;
  RxList pagesList = [].obs;
  RxString pageId = "".obs;
  ZefyrController _controller;
  FocusNode _focusNode;
  NotusDocument displayTextEditor() {
    final Delta delta = Delta()..insert("Insert text here");
    return NotusDocument.fromDelta(delta);
  }

  Future<void> displayPagesList() async {
    isLoading.value = true;
    try {
      var response = await API.getPagesList(
        {
          "token": GetStorage().read(kToken),
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
        pagesList.addAll(List.generate(response.data['data'].length,
            (index) => Pages.fromMap(response.data['data'][index])));
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> createNewPage() async {
    isLoading.value = true;
    try {
      var response = await API.getPagesList(
        {
          "token": GetStorage().read(kToken),
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
        pagesList.addAll(List.generate(response.data['data'].length,
            (index) => Pages.fromMap(response.data['data'][index])));
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }
  }
}
