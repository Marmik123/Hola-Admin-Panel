import 'package:get/get.dart';
import 'package:hola_admin/controller/pages_controller.dart';
import 'package:hola_admin/controller/users__screen_controller.dart';

class DashBoardController extends GetxController {
  UsersScreenController userCtrl = Get.put(UsersScreenController());
  PagesController pagesCtrl = Get.put(PagesController());

  RxDouble totalUser = 45.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userCtrl.showUsersList(1);
    pagesCtrl.displayPagesList();
  }
}
