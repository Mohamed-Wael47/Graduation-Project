//
// import 'package:attendenceapp/models/doctor_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'skin_register_states.dart';
//
// class RegisterCubit extends Cubit<RegisterStates> {
//   RegisterCubit() : super(RegisterInitialState());
//
//   static RegisterCubit get(context) => BlocProvider.of(context);
//
//   void userRegister({
//     required String name,
//     required String email,
//     required String password,
//     // required String phone,
//   }) {
//     emit(RegisterLoadingState());
//
//     FirebaseAuth.instance
//         .createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     ).then((value) {
//
//       print(value.user!.email);
//       print(value.user!.uid);
//
//       userCreate(
//            name: name,
//           email: email,
//           uId: value.user!.uid ,
//         image: 'assets/images/placeHolder.png',
//         isAdmin: false ,
//       ) ;
//
//      // emit(CreateUserSuccessState(value.user!.uid) ,) ;
//         }).catchError((error) {
//       emit(RegisterErrorState(error));
//       print('user register error$error');
//     });
//   }
//
//
//   void userCreate({
//     required String name,
//     required String email,
//     required String uId,
//     required String image,
//     required bool isAdmin,
//   }) {
//     UserModel model= UserModel(
//       name: name  ,
//       email:email  ,
//       uId: uId ,
//       isEmailVerified: false ,
//          image: 'assets/images/logo.jpg',
//       isAdmin: false ,
//     ) ;
//     print('Now in creating User') ;
//
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(uId)
//         .set( model.toMap())
//         .then((value) {
//         emit(CreateUserSuccessState(uId)) ;
//         print('User Created Successfully ,,,,');
//     }).catchError((error){
//       print('user creat error is $error');
//       emit(CreateUserErrorState(error)) ;
//     });
//   }
//
//
//
//   IconData suffix = Icons.visibility_off_outlined;
//   bool isPassword = true;
//
//   void ChangPasswordVisibility() {
//     isPassword = !isPassword;
//     suffix =
//         isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//     emit(RegisterChangPasswordVisibilityState());
//   }
// }
