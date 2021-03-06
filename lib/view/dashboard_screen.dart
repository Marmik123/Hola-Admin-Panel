import 'package:charts_flutter/flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola_admin/components/chart_data.dart';
import 'package:hola_admin/config/app_colors.dart';
import 'package:hola_admin/controller/dashboard_controller.dart';

// ignore: must_be_immutable
class DashBoardScreen extends StatelessWidget {
  DashBoardController ctrl = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.only(top: 50, right: 250),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: AppColors.kff4165,
          elevation: 15,
          child: ListTile(
            leading: Text("Total Number of Users"),
            trailing: Text("${ctrl.totalUser.value}"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(top: 50, right: 250),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: AppColors.kff4165,
          elevation: 15,
          child: ListTile(
            leading: Text("Total Number of Active Users"),
            trailing: Text("${ctrl.totalUser.value}"),
          ),
        ),
        Card(
          margin: EdgeInsets.only(top: 50, right: 250),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: AppColors.kff4165,
          elevation: 15,
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 3,
            child: PieChart(
              Data.getSeriesData(),
              animate: true,
              animationDuration: Duration(seconds: 1),
              defaultRenderer: ArcRendererConfig(
                arcWidth: 50,
                arcRendererDecorators: [ArcLabelDecorator()],
              ),
            ),
          ),
        )
      ],
    );
  }
}
