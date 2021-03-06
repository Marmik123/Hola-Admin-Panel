import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hola_admin/config/app_colors.dart';
import 'package:hola_admin/config/app_config.dart';
import 'package:hola_admin/view/home_screen.dart';

class ViewProfile extends StatelessWidget {
  final String name;
  final String gender;
  final String phoneNumber;
  final int age;
  final double maxDistance;
  final String ageRange;

  const ViewProfile(
      {Key key,
      this.name,
      this.gender,
      this.phoneNumber,
      this.age,
      this.maxDistance,
      this.ageRange})
      : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.kb0b0b0,
        elevation: 5,
        backgroundColor: AppColors.kffffff,
        centerTitle: true,
        title: Text(
          "View Profile",
          style: kInterText.copyWith(
            fontSize: 25,
            color: AppColors.kff4165,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: InkWell(
            onTap: () {
              Get.to(HomeScreen());
            },
            child: Icon(
              Icons.keyboard_backspace_sharp,
              size: 19,
              color: AppColors.k000000,
            )),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Text("Are you sure?"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          button(
                            onTap: () {
                              //Delete User from the list
                            },
                            buttonTxt: "Yes",
                            txtSize: 10,
                            txtColor: AppColors.kff4165,
                            buttonColor: AppColors.kffffff,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          button(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            buttonTxt: "No",
                            txtSize: 10,
                            txtColor: AppColors.kff4165,
                            buttonColor: AppColors.kffffff,
                          )
                        ],
                      ),
                    );
                  });
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  "Block User",
                  style: kInterText.copyWith(
                    color: AppColors.k000000.withOpacity(0.9),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  itemCount: 9,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 5,
                    childAspectRatio: 104 / 126,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Image(
                            image: NetworkImage(
                                "https://via.placeholder.com/150")));
                  }),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name",
                      style: kInterText.copyWith(
                        fontSize: 20,
                        color: AppColors.k000000,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      name,
                      style: kInterText.copyWith(
                        fontSize: 15,
                        color: AppColors.k000000,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Gender",
                      style: kInterText.copyWith(
                        fontSize: 20,
                        color: AppColors.k000000,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      gender,
                      style: kInterText.copyWith(
                        fontSize: 15,
                        color: AppColors.k000000,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Phone Number",
                      style: kInterText.copyWith(
                        fontSize: 20,
                        color: AppColors.k000000,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      phoneNumber,
                      style: kInterText.copyWith(
                        fontSize: 15,
                        color: AppColors.k000000,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Age",
                      style: kInterText.copyWith(
                        fontSize: 20,
                        color: AppColors.k000000,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      age.toString(),
                      style: kInterText.copyWith(
                        fontSize: 15,
                        color: AppColors.k000000,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      " Maximum Distance",
                      style: kInterText.copyWith(
                        fontSize: 20,
                        color: AppColors.k000000,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      maxDistance.toString(),
                      style: kInterText.copyWith(
                        fontSize: 15,
                        color: AppColors.k000000,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Age Range",
                      style: kInterText.copyWith(
                        fontSize: 20,
                        color: AppColors.k000000,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      ageRange,
                      style: kInterText.copyWith(
                        fontSize: 15,
                        color: AppColors.k000000,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
