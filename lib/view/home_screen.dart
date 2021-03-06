import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola_admin/config/app_colors.dart';
import 'package:hola_admin/config/app_config.dart';
import 'package:hola_admin/controller/users__screen_controller.dart';
import 'package:hola_admin/view/dashboard_screen.dart';
import 'package:hola_admin/view/pages_screen.dart';
import 'package:hola_admin/view/users_screen.dart';

class HomeScreen extends StatelessWidget {
  UsersScreenController userCtrl = Get.put(UsersScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            leadingWidth: 25,
            backgroundColor: AppColors.k323232,
            elevation: 3,
            title: Text(
              "Hola Admin Panel",
              style: kInterText.copyWith(
                fontSize: 25,
                color: AppColors.kff4165,
                fontWeight: FontWeight.w700,
              ),
            ),
            actions: [
              userCtrl.selectedIndex.value == 1
                  ? Container(
                      margin: EdgeInsets.only(top: 5),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 2,
                      child: TextField(
                        controller: userCtrl.searchField,
                        onEditingComplete: userCtrl.displaySearchedUser,
                        onChanged: (value) {
                          if (value.isEmpty) {
                            userCtrl.onSearched.value = false;
                            if (userCtrl.searchedList.isNotEmpty) {
                              userCtrl.searchedList
                                  .removeRange(0, userCtrl.searchedList.length);
                            }
                          }
                        },
                        cursorColor: AppColors.k000000,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: userCtrl.displaySearchedUser,
                            child: Icon(
                              Icons.search_sharp,
                              color: AppColors.k000000,
                            ),
                          ),
                          hintText: "Search Here",
                          hintStyle: kInterText.copyWith(
                            color: AppColors.k2A1C37,
                            fontSize: 15,
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
                    )
                  : Container(
                      margin: EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.login_outlined,
                              size: 30,
                              semanticLabel: "Logout",
                              color: AppColors.kffffff,
                            ),
                            Text(
                              "Logout",
                              style: kInterText.copyWith(
                                fontSize: 10,
                                color: AppColors.kffffff,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavigationRail(
                  minExtendedWidth: 150,
                  onDestinationSelected: (int index) {
                    userCtrl.selectedIndex.value = index;
                  },
                  minWidth: 60,
                  groupAlignment: 0,
                  backgroundColor: AppColors.k323232,
                  elevation: 10,
                  labelType: NavigationRailLabelType.all,
                  destinations: [
                    NavigationRailDestination(
                        icon: Icon(
                          Icons.dashboard_sharp,
                          color: AppColors.kffffff,
                        ),
                        label: Text(
                          "Dashboard",
                          style: kInterText.copyWith(
                            fontSize: 15,
                            color: AppColors.kff4165,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        selectedIcon: Icon(
                          Icons.dashboard_sharp,
                          color: AppColors.kff4165,
                        )),
                    NavigationRailDestination(
                        icon: Icon(
                          Icons.supervised_user_circle_sharp,
                          color: AppColors.kffffff,
                        ),
                        label: Text(
                          "Users",
                          style: kInterText.copyWith(
                            fontSize: 15,
                            color: AppColors.kff4165,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        selectedIcon: Icon(
                          Icons.supervised_user_circle_sharp,
                          color: AppColors.kff4165,
                        )),
                    NavigationRailDestination(
                        icon: Icon(
                          Icons.contact_page_rounded,
                          color: AppColors.kffffff,
                        ),
                        label: Text(
                          "Pages",
                          style: kInterText.copyWith(
                            fontSize: 15,
                            color: AppColors.kff4165,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        selectedIcon: Icon(
                          Icons.contact_page_rounded,
                          color: AppColors.kff4165,
                        ))
                  ],
                  selectedIndex: userCtrl.selectedIndex.value),
              VerticalDivider(thickness: 1, width: 3),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                      child: userCtrl.selectedIndex.value == 0
                          ? Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: DashBoardScreen(),
                            )
                          : userCtrl.selectedIndex.value == 1
                              ? UsersScreen()
                              : PagesScreen()),
                ),
              )
            ],
          ),
        ));
  }
}

/*DataTable(
                            sortColumnIndex: 1,
                            sortAscending: true,
                            columns: [
                                DataColumn(
                                  title: Text(
                                    "Name",
                                    style: kInterText.copyWith(
                                      fontSize: 18,
                                      color: AppColors.kff4165,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Gender",
                                    style: kInterText.copyWith(
                                      fontSize: 18,
                                      color: AppColors.kff4165,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Birthday",
                                    style: kInterText.copyWith(
                                      fontSize: 18,
                                      color: AppColors.kff4165,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Id",
                                    style: kInterText.copyWith(
                                      fontSize: 18,
                                      color: AppColors.kff4165,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "View",
                                    style: kInterText.copyWith(
                                      fontSize: 18,
                                      color: AppColors.kff4165,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            rows: [
                                DataRow(cells: [
                                  DataCell(
                                    Text(
                                      currentUser.name,
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: AppColors.k000000,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      currentUser.gender,
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: AppColors.k000000,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "10/02/2000",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: AppColors.k000000,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      currentUser.id,
                                      style: kInterText.copyWith(
                                        fontSize: 10,
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
                                          gender: "Male",
                                          maxDistance: 125,
                                          name: "Het",
                                          phoneNumber: "12234443222",
                                        ));
                                      },
                                      child: Icon(Icons.grid_view))),
                                ]),
                                DataRow(cells: [
                                  DataCell(
                                    Text(
                                      "Jay",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: AppColors.k000000,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "Male",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: AppColors.k000000,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "10/08/2002",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: AppColors.k000000,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "+919234567890",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: AppColors.k000000,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    ViewProfile(
                                                      age: 15,
                                                      ageRange: "25 - 36",
                                                      gender: "Female",
                                                      maxDistance: 125,
                                                      name: "Zeel",
                                                      phoneNumber: "8812345678",
                                                    )));
                                      },
                                      child: Icon(Icons.grid_view)))
                                ]),
                                DataRow(cells: [
                                  DataCell(
                                    Text(
                                      "Jay",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: AppColors.k000000,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "Male",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: AppColors.k000000,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "10/08/2002",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: AppColors.k000000,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "+919234567890",
                                      style: kInterText.copyWith(
                                        fontSize: 10,
                                        color: AppColors.k000000,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  DataCell(InkWell(
                                      onTap: () {
                                        Get.to(ViewProfile(
                                          age: 25,
                                          ageRange: "25 - 36",
                                          gender: "Male",
                                          maxDistance: 125,
                                          name: "Mit",
                                          phoneNumber: "9812345678",
                                        ));
                                      },
                                      child: Icon(Icons.grid_view))),
                                ])
                              ])*/
