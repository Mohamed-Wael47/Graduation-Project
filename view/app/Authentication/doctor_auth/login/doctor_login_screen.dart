import 'package:attendenceapp/cubit/doctor_login_cubit/doctor_login_cubit.dart';
import 'package:attendenceapp/cubit/doctor_login_cubit/doctor_login_states.dart';
import 'package:attendenceapp/network0/local/cash_helper.dart';
import 'package:attendenceapp/shared/colors.dart';
import 'package:attendenceapp/shared/components.dart';
import 'package:attendenceapp/view/app/doctor/doctor_screen.dart';
import 'package:attendenceapp/view/app/welcom_screen/welcom_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorLoginScreen extends StatelessWidget {
  DoctorLoginScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final docEmailController = TextEditingController();
  final docPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => DoctorLoginCubit(),
      child: BlocConsumer<DoctorLoginCubit, DoctorLoginStates>(
        listener: (context, state) async {
          if (state is DoctorLoginErrorState) {
            print('login Errorrrr ${state.error.message}');
            showToast(text: 'please try gain', state: ToastStates.ERROR);
          }
          // if (state is AdminLoginSuccessState) {
          //   await CashHelper.saveData(
          //     key: 'uIdAdmin',
          //     value: state.uIdAdmin,
          //   ).then((value) {
          //     print('Admin Login Successfully');
          //     showToast(
          //         text: 'Admin Logged In Successfully',
          //         state: ToastStates.SUCCESS
          //     );
          //     // uId = state.uIdAdmin;
          //
          //   }).whenComplete(() =>  navigateAndFinish(context: context, widget:const AdminPanelScreen()));
          // }

          if (state is DoctorLoginSuccessState) {
            await CashHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              print(' doctor Login Successfully');
              showToast(
                  text: 'doctor ${state.name} Logged in Successfully',
                  state: ToastStates.SUCCESS);
              // uId = state.uId;
            }).whenComplete(
              () => navigateAndFinish(
                context: context,
                widget: DoctorScreen(),
              ),
            );
          }
        },
        builder: (BuildContext context, DoctorLoginStates state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 239, 239, 239),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 239, 239, 239),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("LOGIN",
                            style: TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                              color: defaultBlueColor,
                            )),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Login Now To see your students attendance ",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        myTextField(
                          context: context,

                          //onSubmit: () {},
                          prefixIcon: Icons.email,
                          suffixSize: 20,
                          prefixSize: 20,
                          validateText: "Please Enter Your ID",
                          //جملة الvalidation
                          controller: docEmailController,
                          label: " Doctor ID ",
                          onChanged: () {},
                          onTap: () {},
                          type: TextInputType.emailAddress,
                        ),
                        myTextField(
                          context: context,

                          prefixIcon: Icons.lock_clock_outlined,
                          suffixSize: 20,
                          prefixSize: 20,
                          suffixIcon: Icons.lock,
                          validateText: "Please Enter Your Password",
                          controller: docPasswordController,
                          label: " Password",
                          isPassword: true,
                          SuffixPressed: () {},
                          onChanged: () {},
                          onTap: () {},
                          type: TextInputType.visiblePassword,
                          // onSubmit: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ConditionalBuilder(
                          condition: state is! DoctorLoginLoadingState,
                          builder: (context) => myButton(
                              width: double.infinity,
                              height: 50,
                              text: "Login",
                              color: defaultBlueColor,
                              onTap: () async {
                                await CashHelper.removeData(key: 'uId');
                                if (formKey.currentState!.validate()) {
                                  DoctorLoginCubit.get(context).doctorLogin(
                                    email: docEmailController.text,
                                    password: docPasswordController.text,
                                  );
                                }
                              }),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
