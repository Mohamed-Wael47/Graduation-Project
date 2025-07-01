import 'package:attendenceapp/models/doctor_model.dart';
import 'package:attendenceapp/shared/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'doctor_login_states.dart';

class DoctorLoginCubit extends Cubit<DoctorLoginStates> {
  DoctorLoginCubit() : super(DoctorLoginInitialState());

  static DoctorLoginCubit get(context) => BlocProvider.of(context);

  void doctorLogin({
    required String email,
    required String password,
  }) {
    emit(DoctorLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      if (email == 'mohamed@gmail.com' && password == 'mohamed123') {
        print(value.user!.email);
        print(value.user!.uid);
        print('doctor mohamed Login');
        emit(DoctorLoginSuccessState(
            value.user!.uid, value.user!.email.toString()));
        doctorCreate(
          name: value.user!.email.toString(),
          email: value.user!.email.toString(),
          // uId: 'q9RtRJPeijZw3ZDePHEQV8puqJl1',
          uId: value.user!.uid,
        );
      } else if (email == 'zeina@gmail.com' && password == 'zeina123') {
        print(value.user!.email);
        print(value.user!.uid);
        print('doctor zeina Login');
        emit(DoctorLoginSuccessState(
            value.user!.uid, value.user!.email.toString()));
        doctorCreate(
          name: value.user!.email.toString(),
          email: value.user!.email.toString(),
          // uId: 'q9RtRJPeijZw3ZDePHEQV8puqJl1',
          uId: value.user!.uid,
        );
      } else if (email == 'sherif@gmail.com' && password == '123') {
        print(value.user!.email);
        print(value.user!.uid);

        emit(DoctorLoginSuccessState(
            value.user!.uid, value.user!.email.toString()));
        doctorCreate(
          name: value.user!.email.toString(),
          email: value.user!.email.toString(),
          // uId: 'q9RtRJPeijZw3ZDePHEQV8puqJl1',
          uId: value.user!.uid,
        );
      } else {
        print('not allowed');
        print('not allowed');
        emit(DoctorLoginNotAllowedState());
        showToast(text: 'not allowed doctor', state: ToastStates.ERROR);
      }
    }).catchError((error) {
      emit(DoctorLoginErrorState(error));
      print('doctor Login Error ....    $error');
    });
  }

  void doctorCreate({
    required String name,
    required String email,
    required String uId,
  }) {
    DoctorModel model = DoctorModel(
      name: name,
      email: email,
      uId: uId,
    );
    print('Now in creating doctor');

    FirebaseFirestore.instance
        .collection('users')
        .doc('q9RtRJPeijZw3ZDePHEQV8puqJl1')
        .set(model.toJson())
        .then((value) {
      // emit(SkinCreateUserSuccessState(uId)) ;
      print('doctor Created Successfully ,,,,');
    }).catchError((error) {
      print('doctor create error is $error');
      // emit(SkinCreateUserErrorState(error)) ;
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void shopChangPasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangPasswordVisibilityState());
  }
}
