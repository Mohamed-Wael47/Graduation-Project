import 'package:attendenceapp/cubit/app_cubit/app_cubit.dart';
import 'package:attendenceapp/cubit/app_cubit/app_states.dart';
import 'package:attendenceapp/model/attendance_model.dart';
import 'package:attendenceapp/network0/remote/dio_helper.dart';
import 'package:attendenceapp/shared/colors.dart';
import 'package:attendenceapp/shared/lecture_item.dart';
import 'package:attendenceapp/shared/student_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorScreen extends StatelessWidget {
  DoctorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: AppColors.whiteColor,
              body: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                      ),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                            'Today Attendence of ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                          SizedBox(
                            height: 4,
                          ),
                          Center(
                              child: Text(
                            'operating system Lecture',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                          SizedBox(
                            height: 4,
                          ),
                          Center(
                              child: Text(
                            'Dr/ sherif',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder<List<Attendance>>(
                        future: getAttendance(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Center(child: CircularProgressIndicator());
                            case ConnectionState.done:
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                reverse: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return StudentItem(
                                    studentName:
                                        snapshot.data![index].studentName!,
                                    studentCode:
                                        snapshot.data![index].studentCode!,
                                    studentTime: snapshot.data![index].time!,
                                  );
                                },
                              );
                            default:
                              return Center(child: CircularProgressIndicator());
                          }
                        }),
                  ],
                ),
              ));
        },
      ),
    );
  }
}

Future<List<Attendance>> getAttendance() async {
  Response<dynamic> response = await DioHelper.getData(
      methodUrl: "http://www.attend100.somee.com/api/Attendences");
  print("object ${response.data}");
  return (response.data as List<dynamic>)
      .map((e) => Attendance.fromJson(e))
      .toList();
}
