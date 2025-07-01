import 'dart:io';

import 'package:attendenceapp/shared/colors.dart';
import 'package:attendenceapp/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:image_picker/image_picker.dart';

import '../face_detection/face_detection.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var qrResult = "Not Scanned";

  var height, width;
  @override
  void initState() {
    scanQr();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('Scanning QR code',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: defaultBlueColor,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: defaultBlueColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'QR Result is :',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          qrResult,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.lime,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.3,
                ),

                // qrResult == "hello"
                //     ? Padding(
                //         padding: const EdgeInsets.only(left: 15, right: 15),
                //         child: Container(
                //           height: 70,
                //           width: double.infinity,
                //           decoration: BoxDecoration(
                //               color: defaultBlueColor,
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(50))),
                //           child: ElevatedButton(
                //             style: ButtonStyle(
                //                 backgroundColor: MaterialStateProperty.all(
                //                     Colors.lightGreen)),
                //             onPressed: () {
                //               navigateTo(context: context, widget: FaceDetection()) ;
                //               // getStudentImage();
                //             },
                //             child: Row(
                //               children: [
                //                 Column(
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     Text(
                //                       ' Please Enter To Continue ',
                //                       style: TextStyle(
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 18),
                //                     ),
                //                     Text(
                //                       ' attendence with your face ',
                //                       style: TextStyle(
                //                           fontWeight: FontWeight.bold,
                //                           fontSize: 18 ,),
                //                     ),
                //                   ],
                //                 ),
                //                 Spacer(),
                //                 Icon(
                //                   Icons.arrow_forward_ios,
                //                   color: Colors.white,
                //                   size: 35,
                //                 ),
                //                 Icon(
                //                   Icons.arrow_forward_ios,
                //                   color: Colors.lime,
                //                   size: 35,
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //       )
                //     : qrResult == "-1"?
                // Padding(
                //   padding: const EdgeInsets.only(left: 15, right: 15),
                //   child: Container(
                //     height: 200,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       border: Border.all(color: Colors.black),
                //         borderRadius:
                //         BorderRadius.all(Radius.circular(20))),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text(
                //           'may be you are not in the lecture',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w400,
                //               fontSize: 18,
                //               color: Colors.red.shade800),
                //         ),
                //         Text(
                //           'Please Try Scanning the lecture Qr Again',
                //           style: TextStyle(
                //               fontWeight: FontWeight.w400,
                //               fontSize: 18,
                //               color: Colors.red.shade800),
                //         ),
                //         SizedBox(height: 10,),
                //         Icon(Icons.warning ,size: 50,color: Colors.red,)
                //       ],
                //     ),
                //   ),
                // ):
                SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: defaultBlueColor,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lightGreen)),
                      onPressed: () {
                        navigateTo(context: context, widget: FaceDetection());
                        // getStudentImage();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'With Face Detection',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Spacer(),
                          Icon(
                            Icons.face_6_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  File? profileImage;
  ImagePicker picker = ImagePicker();

  Future<void> getStudentImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      print(pickedFile.path);
      profileImage = File(pickedFile.path);
    } else {
      print('No Image Selected .. ..');
    }
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR)
          .then((value) {
        setState(() {
          qrResult = value;
          //// +++
        });
        if (!value.toLowerCase().contains("hello")) {
          showAlertDialog(context);
        }
      });
    } catch (e) {
      setState(() {
        qrResult = 'unable to read this';
        print('error is $e');
      });
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("try again"),
      onPressed: () {
        scanQr().whenComplete(() {
          Navigator.pop(context);
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Barcode"),
      content: Text("result not in our database records"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
