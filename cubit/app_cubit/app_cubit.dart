import 'package:attendenceapp/cubit/app_cubit/app_states.dart';
import 'package:attendenceapp/model/attendance_model.dart';
import 'package:attendenceapp/models/doctor_model.dart';
import 'package:attendenceapp/network0/local/cash_helper.dart';
import 'package:attendenceapp/network0/remote/dio_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  late DoctorModel doctorModel;

  void getDoctorData() async {
    emit(SkinGetUserLoadingState());
    // await Future.delayed(const Duration(seconds: 0));
    var uId = CashHelper.getData(key: 'uId');
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(' value.data is  ${value.data()}');
      doctorModel = DoctorModel.fromJson(value.data()!);
      emit(SkinGetUserSuccessState());
      print(doctorModel.name);
      print(doctorModel.email);
    }).catchError((error) {
      print(error.toString());
      emit(
        SkinGetUserErrorStates(error),
      );
    });
  }

//   Future<void> logOut({
//   required BuildContext context ,
// }) async {
//     emit(SkinLogoutLoadingState()) ;
//     //
//     // await CashHelper.removeData(key: 'uId') ;
//     // await FirebaseAuth.instance.signOut().then((value) {
//     //   emit(SkinLogoutSuccessState()) ;
//     //   print(doctorModel.uId);
//     //   navigateTo(context: context,
//     //       widget: SkinLoginScreen());
//     // }).catchError((error){
//     //   print('error when signing out')  ;
//     //   emit(SkinLogoutErrorState())  ;
//     //
//     // });
//     try {
//       await FirebaseAuth.instance.signOut().then((value) {
//         print(doctorModel.uId);
//         navigateTo(context: context,
//             widget: SkinLoginScreen());
//       });
//       currentIndex = 0;
//       emit(SkinLogoutSuccessState()) ;
//     }catch (e){
//       print('error when signing out $e')  ;
//       emit(SkinLogoutErrorState())  ;
//     }
//
//   }

  // List<DoctorModel>? users;
  //
  // void getAdminForUsers() {
  //   //هجيب الAdmin بس علشان يظهر لليوزرز كلهم
  //   users=[];
  //   FirebaseFirestore.instance.collection(usersCollection).get().then((value) {
  //     emit(SkinGetAdminForUsersSuccessState());
  //     value.docs.forEach((element) {
  //      // print( 'element[uId] is ${element.id}');
  //        if (element.id == AdminUID) {
  //         users!.add(DoctorModel.fromJson(element.data()));
  //       }
  //       print("Users list after  ${users!.length}");
  //        print("number of Docs in Users collection ${value.docs.length}");
  //
  //     });
  //   }).catchError((error) {
  //     emit(SkinGetAdminForUsersErrorState(error.toString()));
  //     print('error get All Users ${error.toString()}') ;
  //   });
  // }

 
}
