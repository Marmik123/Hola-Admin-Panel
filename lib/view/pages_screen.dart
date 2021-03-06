import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola_admin/config/app_colors.dart';
import 'package:hola_admin/config/app_config.dart';
import 'package:hola_admin/controller/pages_controller.dart';

class PagesScreen extends StatelessWidget {
  PagesController pagesCtrl = Get.put(PagesController());
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      button(
          buttonColor: AppColors.kff4165,
          txtSize: 15,
          txtColor: AppColors.kffffff,
          buttonTxt: "Add New",
          onTap: () {}),
      SizedBox(
        height: 50,
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        child: DataTable(
            sortAscending: true,
            columns: [
              DataColumn(
                label: Text(
                  "Sr No.",
                  style: kInterText.copyWith(
                    fontSize: 25,
                    color: AppColors.kff4165,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Page Name",
                  style: kInterText.copyWith(
                    fontSize: 25,
                    color: AppColors.kff4165,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  "Actions",
                  style: kInterText.copyWith(
                    fontSize: 25,
                    color: AppColors.kff4165,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
            rows: List.generate(
              pagesCtrl.pagesList.length,
              (index) => DataRow(cells: [
                DataCell(
                  Text(
                    "${index + 1}",
                    style: kInterText.copyWith(
                      fontSize: 22,
                      color: AppColors.k000000,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    pagesCtrl.pagesList[index].title ?? "-",
                    style: kInterText.copyWith(
                      fontSize: 22,
                      color: AppColors.k000000,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                DataCell(InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: AppColors.kb0b0b0,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {
                                    pagesCtrl.displayTextEditor();
                                  },
                                  icon: Icon(Icons.edit_outlined)),
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title:
                                  "Are you sure you want to delete the user?",
                              titleStyle: kInterText.copyWith(
                                color: AppColors.kff4165,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                              content: Column(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        pagesCtrl.pageId.value =
                                            pagesCtrl.pagesList[index].id;
                                        pagesCtrl.pagesList.removeAt(index);
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
                          icon: Icon(
                            Icons.delete,
                          ),
                        ),
                      ],
                    )))
              ]),
            )),
      )
    ]);
  }
}
