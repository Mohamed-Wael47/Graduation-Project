import 'package:animate_do/animate_do.dart';
import 'package:attendenceapp/shared/components.dart';
import 'package:attendenceapp/view/app/Authentication/doctor_auth/login/doctor_login_screen.dart';
import 'package:attendenceapp/view/app/scan_qr/Scan_QR_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Duration duration = const Duration(milliseconds: 800);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      ),
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///
              FadeInUp(
                duration: duration,
                delay: const Duration(milliseconds: 2000),
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 0,
                    left: 5,
                    right: 5,
                  ),
                  width: size.width,
                  height: size.height / 2,
                  child: Lottie.asset("assets/images/wl.json", animate: true),
                ),
              ),

              ///

              /// TITLE
              FadeInUp(
                duration: duration,
                delay: const Duration(milliseconds: 1900),
                child: const Text(
                  "Welcome In Our App !!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),

              ///

              SizedBox(
                height: 5,
              ),

              /// SUBTITLE
              FadeInUp(
                duration: duration,
                delay: const Duration(milliseconds: 1300),
                child: const Text(
                  "Keep It Simple and get in touch and Improve your attendence system easily right from the app.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.2,
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              ///

              /// GOOGLE BTN
              // FadeInUp(
              //   duration: duration,
              //   delay: const Duration(milliseconds: 800),
              //   child: SButton(
              //     size: size,
              //     borderColor: Colors.grey,
              //     color: const Color.fromARGB(255, 54, 54, 54),
              //     img: 'assets/images/g.png',
              //     text: "Continue with Google",
              //     textStyle: TextStyle(color: Colors.white),
              //     onTap: () {
              //       navigateTo(context: context, widget: MainScreen());
              //     },
              //   ),
              // ),
              //
              // ///
              // const SizedBox(
              //   height: 20,
              // ),

              // FadeInUp(
              //   duration: duration,
              //   delay: const Duration(milliseconds: 500),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Container(
              //           height: 0.7,
              //           width: double.infinity,
              //           color: Colors.grey,
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 10 ,right: 10),
              //         child: Text(
              //           'OR',
              //           style: TextStyle(
              //               color: Colors.grey,
              //               letterSpacing: 1
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         child: Container(
              //           height: 0.5,
              //           width: double.infinity,
              //           color: Colors.grey,
              //         ),
              //       ),
              //     ],
              //   ),
              //
              // ),
              //
              //
              // SizedBox(
              //   height: 15,
              // ),
              FadeInUp(
                duration: duration,
                delay: const Duration(milliseconds: 1200),
                child: const Text(
                  "ARE YOU ..? ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),

              FadeInUp(
                duration: duration,
                delay: const Duration(milliseconds: 800),
                child: SButton(
                  size: size,
                  borderColor: Colors.white,
                  color: Colors.white,
                  // color: const Color.fromARGB(255, 54, 54, 54),
                  img: 'assets/images/loginIcon1.png',
                  text: " Doctor ",
                  textStyle: const TextStyle(),
                  onTap: () {
                    navigateTo(
                      context: context,
                      widget: DoctorLoginScreen(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15.0,
              ),

              FadeInUp(
                duration: duration,
                delay: const Duration(milliseconds: 800),
                child: SButton(
                  size: size,
                  borderColor: Colors.white,
                  color: Colors.white,
                  // color: const Color.fromARGB( 255, 54, 54, 54 ),
                  img: 'assets/images/loginIcon1.png',
                  text: " STUDENT  ",
                  textStyle: const TextStyle(),
                  onTap: () {
                    navigateTo(context: context, widget: ScanScreen());
                  },
                ),
              ),

              ///
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
//   Future<void> ScanQR()async{
//     try{
//
//       FlutterBarcodeScanner.scanBarcode(
//
//           '#2A99CF' ,'cancel' ,true ,
//         ScanMode.QR ,
//       ).then((value) {
// setState(() {
//   navigateTo(
//
//     context: context ,
//     widget: ScanScreen() ,
//
//   );
// });
//       });
//
//     }catch(e){
//
//     }
//
//   }
}

class SButton extends StatelessWidget {
  const SButton({
    Key? key,
    required this.size,
    required this.color,
    required this.borderColor,
    required this.img,
    required this.text,
    required this.textStyle,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final Color color;
  final Color borderColor;
  final String img;
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: size.width / 1.2,
        height: size.height / 15,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img,
              height: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
