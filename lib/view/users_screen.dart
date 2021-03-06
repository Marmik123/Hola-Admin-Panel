import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hola_admin/config/app_colors.dart';
import 'package:hola_admin/config/app_config.dart';
import 'package:hola_admin/controller/users__screen_controller.dart';
import 'package:hola_admin/view/view_profile.dart';
import 'package:hola_admin/widgets/circular_loader.dart';

class UsersScreen extends StatelessWidget {
  UsersScreenController userCtrl = Get.put(UsersScreenController());
  GetStorage pageStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Obx(() => userCtrl.isLoading.value
        ? Container(
            alignment: Alignment.center,
            height: 50,
            width: 50,
            child: buildLoader(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: DataTable(
                  sortAscending: true,
                  columns: [
                    DataColumn(
                      label: Text(
                        "Name",
                        style: kInterText.copyWith(
                          fontSize: 25,
                          color: AppColors.kff4165,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Gender",
                        style: kInterText.copyWith(
                          fontSize: 25,
                          color: AppColors.kff4165,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Birthday",
                        style: kInterText.copyWith(
                          fontSize: 25,
                          color: AppColors.kff4165,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Id",
                        style: kInterText.copyWith(
                          fontSize: 25,
                          color: AppColors.kff4165,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "View",
                        style: kInterText.copyWith(
                          fontSize: 25,
                          color: AppColors.kff4165,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                  rows: !userCtrl.onSearched.value
                      ? userListWidget()
                      : searchedUserList(),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              userCtrl.onSearched.value
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: AppColors.kD8D8D8,
                        ),
                        width: MediaQuery.of(context).size.width / 8,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_sharp,
                                color: userCtrl.pageNumber.value == 1
                                    ? AppColors.kb0b0b0
                                    : AppColors.k000000,
                              ),
                              onPressed: () {
                                if (userCtrl.pageNumber.value > 1) {
                                  userCtrl.pageNumber.value--;
                                  userCtrl.searchedList.removeRange(
                                      0, userCtrl.searchedList.length);
                                  userCtrl.showSearchedUserList(
                                      userCtrl.pageNumber.value.toInt());
                                }
                              },
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.kffffff,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.kb0b0b0,
                                          spreadRadius: 2,
                                          offset: Offset(2, 2),
                                        )
                                      ],
                                    ),
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Text(
                                        "${userCtrl.pageNumber.value}",
                                        style: kInterText.copyWith(
                                          color: AppColors.kff4165,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text("   /  ${userCtrl.totalSearchedUser}",
                                      style: kInterText.copyWith(
                                        color: AppColors.kff4165,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: userCtrl.pageNumber.value ==
                                        userCtrl.totalSearchedUser
                                    ? AppColors.kb0b0b0
                                    : AppColors.k000000,
                              ),
                              onPressed: () {
                                if (userCtrl.pageNumber.value <
                                    userCtrl.totalSearchedUser) {
                                  userCtrl.pageNumber.value++;
                                  userCtrl.searchedList.removeRange(
                                      0, userCtrl.searchedList.length);
                                  userCtrl.showSearchedUserList(
                                      userCtrl.pageNumber.value.toInt());
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: AppColors.kD8D8D8,
                        ),
                        width: MediaQuery.of(context).size.width / 8,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_sharp,
                                color: userCtrl.pageNumber.value == 1
                                    ? AppColors.kb0b0b0
                                    : AppColors.k000000,
                              ),
                              onPressed: () {
                                if (userCtrl.pageNumber.value > 1) {
                                  userCtrl.pageNumber.value--;
                                  userCtrl.usersList.removeRange(
                                      0, userCtrl.usersList.length);
                                  userCtrl.showUsersList(
                                      userCtrl.pageNumber.value.toInt());
                                }
                              },
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.kffffff,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.kb0b0b0,
                                          spreadRadius: 2,
                                          offset: Offset(2, 2),
                                        )
                                      ],
                                    ),
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Text(
                                        "${userCtrl.pageNumber.value}",
                                        style: kInterText.copyWith(
                                          color: AppColors.kff4165,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text("   /  ${userCtrl.totalPages}",
                                      style: kInterText.copyWith(
                                        color: AppColors.kff4165,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: userCtrl.pageNumber.value ==
                                        userCtrl.totalPages
                                    ? AppColors.kb0b0b0
                                    : AppColors.k000000,
                              ),
                              onPressed: () {
                                if (userCtrl.pageNumber.value <
                                    userCtrl.totalPages) {
                                  userCtrl.pageNumber.value++;
                                  userCtrl.usersList.removeRange(
                                      0, userCtrl.usersList.length);
                                  userCtrl.showUsersList(
                                      userCtrl.pageNumber.value.toInt());
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
            ],
          ));
  }

  //Display Searched user
  List<DataRow> searchedUserList() {
    return List.generate(
      userCtrl.searchedList.length,
      (index) => DataRow(cells: [
        DataCell(
          Text(
            userCtrl.searchedList[index].name ?? "-",
            style: kInterText.copyWith(
              fontSize: 22,
              color: AppColors.k000000,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DataCell(
          Text(
            userCtrl.searchedList[index].gender ?? "-",
            style: kInterText.copyWith(
              fontSize: 22,
              color: AppColors.k000000,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DataCell(
          Text(
            userCtrl.searchedList[index].dateOfBirth ?? "-",
            style: kInterText.copyWith(
              fontSize: 22,
              color: AppColors.k000000,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DataCell(
          Text(
            userCtrl.searchedList[index].id,
            style: kInterText.copyWith(
              fontSize: 22,
              color: AppColors.k000000,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DataCell(Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.grid_view),
              onPressed: () {
                Get.to(ViewProfile(
                  age: 35,
                  ageRange: "25 - 36",
                  gender: userCtrl.searchedList[index].gender ?? "-",
                  maxDistance: 125,
                  name: userCtrl.searchedList[index].name ?? "-",
                  phoneNumber: "12234443222",
                ));
              },
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Are you sure you want to delete the user?",
                  titleStyle: kInterText.copyWith(
                    color: AppColors.kff4165,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  content: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            userCtrl.userId.value =
                                userCtrl.searchedList[index].id;
                            userCtrl.searchedList.removeAt(index);
                            Get.back();
                          },
                          child: Text(
                            'Yes',
                            style: kInterText.copyWith(
                              color: AppColors.kff4165,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            'No',
                            style: kInterText.copyWith(
                              color: AppColors.kff4165,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ))
                    ],
                  ),
                );
              },
              icon: Icon(Icons.delete),
            ),
          ],
        )),
      ]),
    );
  }

  //Display users list
  List<DataRow> userListWidget() {
    return List.generate(
      userCtrl.usersList.length,
      (index) => DataRow(cells: [
        DataCell(
          Text(
            userCtrl.usersList[index].name ?? "-",
            style: kInterText.copyWith(
              fontSize: 22,
              color: AppColors.k000000,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DataCell(
          Text(
            userCtrl.usersList[index].gender ?? "-",
            style: kInterText.copyWith(
              fontSize: 22,
              color: AppColors.k000000,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DataCell(
          Text(
            userCtrl.usersList[index].dateOfBirth ?? "-",
            style: kInterText.copyWith(
              fontSize: 22,
              color: AppColors.k000000,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DataCell(
          Text(
            userCtrl.usersList[index].id,
            style: kInterText.copyWith(
              fontSize: 22,
              color: AppColors.k000000,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DataCell(InkWell(
            onTap: () {
              Get.to(ViewProfile(
                age: 35,
                ageRange: "25 - 36",
                gender: userCtrl.usersList[index].gender ?? "-",
                maxDistance: 125,
                name: userCtrl.usersList[index].name ?? "-",
                phoneNumber: "12234443222",
              ));
            },
            child: Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.grid_view),
                    )),
                SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Are you sure you want to delete the user?",
                      titleStyle: kInterText.copyWith(
                        color: AppColors.kff4165,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                      content: Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                userCtrl.userId.value =
                                    userCtrl.usersList[index].id;
                                userCtrl.usersList.removeAt(index);
                                Get.back();
                              },
                              child: Text(
                                'Yes',
                                style: kInterText.copyWith(
                                  color: AppColors.kff4165,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                'No',
                                style: kInterText.copyWith(
                                  color: AppColors.kff4165,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ))
                        ],
                      ),
                    );
                  },
                  icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.delete),
                      )),
                ),
              ],
            ))),
      ]),
    );
  }
}
