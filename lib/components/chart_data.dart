import 'package:charts_flutter/flutter.dart';

class Data {
  final int activeUsers;
  final int inactiveUsers;

  Data(this.activeUsers, this.inactiveUsers);

  static final data = [
    Data(23, 65),
    Data(65, 25),
    Data(165, 89),
  ];

  static getSeriesData() {
    List<Series<Data, int>> series = [
      Series(
        id: "USERS",
        data: data,
        domainFn: (Data info, _) => info.activeUsers,
        measureFn: (Data info, _) => info.inactiveUsers,
      )
    ];

    return series;
  }
}
