import 'package:attendenceapp/shared/colors.dart';
import 'package:attendenceapp/shared/components.dart';
import 'package:flutter/material.dart';

class StudentItem extends StatelessWidget {
  String studentName;
  String studentCode;
  String studentTime;
  StudentItem(
      {Key? key,
      required this.studentName,
      required this.studentCode,
      required this.studentTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 12, right: 12),
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          color: AppColors.blackColor,
          borderRadius: BorderRadius.circular(25),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Name : ',
                  color: Colors.lime,
                ),
                CustomText(
                  text: studentName,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'ID : ',
                  color: Colors.lime,
                ),
                CustomText(
                  text: studentCode,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Time : ',
                  color: Colors.lime,
                ),
                CustomText(
                  text: studentTime,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
