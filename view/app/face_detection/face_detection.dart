import 'dart:io';

import 'package:attendenceapp/model/attendance_model.dart';
import 'package:attendenceapp/network0/remote/dio_helper.dart';
import 'package:attendenceapp/shared/colors.dart';
import 'package:attendenceapp/shared/components.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class FaceDetection extends StatefulWidget {
  const FaceDetection({Key? key}) : super(key: key);

  @override
  State<FaceDetection> createState() => _FaceDetectionState();
}

class _FaceDetectionState extends State<FaceDetection> {
  List? outputs;

  File? _imageFile;

  bool? loading = false;

  late List<Face>? _faces = []; // Faces Detected ;

  @override
  void initState() {
    super.initState();
    loading = true;

    loadModel().then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultBlueColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Face Detection',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: loading!
          ? Center(
              child: Container(
              child: CircularProgressIndicator(
                color: defaultBlueColor,
              ),
            ))
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Image.asset('assets/images/placeHolder.png' ,height:600  ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Take a Clearly Image',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.black,
                              fontSize: 27,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              wordSpacing: 0,
                              letterSpacing: 0,
                            ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'For Best Experience and Best Result,',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.grey[700],
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              wordSpacing: 0,
                              letterSpacing: 0,
                            ),
                      ),
                      Text(
                        'Please make sure that your face ',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.grey[700],
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              wordSpacing: 0,
                              letterSpacing: 0,
                            ),
                      ),
                      Text(
                        ' photo you upload is clear ,',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.grey[700],
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              wordSpacing: 0,
                              letterSpacing: 0,
                            ),
                      ),
                      Text(
                        ', in a light place, straight',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.grey[700],
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              wordSpacing: 0,
                              letterSpacing: 0,
                            ),
                      ),
                    ],
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     getUserFaceImage().then((value) {
                //       Future.delayed(
                //         Duration(seconds: 1),
                //       ).then((value) {
                //         print('done');
                //         if (_faces!.length == 1) {
                //           showDialog(
                //             context: context,
                //             builder: (context) => AlertDialog(
                //               alignment: Alignment.center,
                //               backgroundColor: Colors.white,
                //               title: const Center(
                //                 child: Text(
                //                   'Result :',
                //                   style: TextStyle(
                //                       fontSize: 23,
                //                       fontWeight: FontWeight.bold,
                //                       color: Colors.blue),
                //                 ),
                //               ),
                //               content: Column(
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 mainAxisSize: MainAxisSize.min,
                //                 children: [
                //                   Padding(
                //                     padding: EdgeInsets.only(top: 5.0),
                //                     child: _imageFile == null
                //                         ? Container()
                //                         : Image.file(
                //                             _imageFile!,
                //                           ),
                //                   ),
                //                   const SizedBox(
                //                     height: 20.0,
                //                   ),
                //                   RichText(
                //                     text: TextSpan(
                //                       children: [
                //                         TextSpan(
                //                           text:
                //                               'Wellcome ${outputs![0]['label'].toString().substring(2)}',
                //                           style: TextStyle(
                //                               fontWeight: FontWeight.w700,
                //                               fontSize: 15,
                //                               color: Colors.black),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               shadowColor: Colors.blue[100],
                //               actions: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(
                //                       right: 35, bottom: 7.0),
                //                   child: myButton(
                //                       width: 100,
                //                       height: 30,
                //                       color: Colors.blue,
                //                       textSize: 13,
                //                       textcolor: Colors.white,
                //                       text: 'Back Home',
                //                       onTap: () {
                //                         navigateAndFinish(
                //                           context: context,
                //                           widget: SizedBox(),
                //                         );
                //                       }),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(bottom: 7.0),
                //                   child: myButton(
                //                       width: 150,
                //                       height: 30,
                //                       color: Colors.blue,
                //                       textSize: 13,
                //                       textcolor: Colors.white,
                //                       text: 'Try another Image',
                //                       onTap: () {
                //                         Navigator.pop(context);
                //                       }),
                //                 ),
                //               ],
                //             ),
                //           );
                //         }
                //       });
                //     });
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.all(12.0),
                //     child: Center(
                //       child: Container(
                //         decoration: BoxDecoration(
                //           color: defaultBlueColor,
                //           borderRadius: BorderRadius.circular(20.0),
                //         ),
                //         width: double.infinity,
                //         height: 55,
                //         child: Center(
                //             child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               'Upload Image ',
                //               style: const TextStyle(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 18,
                //               ),
                //             ),
                //             SizedBox(
                //               width: 20.0,
                //             ),
                //             Icon(
                //               Icons.upload_file,
                //               color: Colors.white,
                //             )
                //           ],
                //         )),
                //       ),
                //     ),
                //   ),
                // ),
                // Text(
                //   'OR',
                //   style: Theme.of(context)
                //       .textTheme
                //       .labelLarge!
                //       .copyWith(color: defaultBlueColor),
                // ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    getUserFaceWithCameraImage().then((value) {
                      Future.delayed(
                        Duration(seconds: 1),
                      ).then((value) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            alignment: Alignment.center,
                            backgroundColor: Colors.white,
                            title: const Center(
                              child: Text(
                                'Result :',
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: defaultBlueColor),
                              ),
                            ),
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: _imageFile == null
                                      ? Container()
                                      : Image.file(
                                          _imageFile!,
                                        ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Wellcome',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            shadowColor: Colors.blue[100],
                            actions: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 35, bottom: 7.0),
                                child: myButton(
                                    width: 100,
                                    height: 30,
                                    color: Colors.blue,
                                    textSize: 13,
                                    textcolor: Colors.white,
                                    text: 'Back Home',
                                    onTap: () {
                                      navigateTo(
                                          context: context,
                                          widget: Scaffold(
                                            body: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.face,
                                                      size: 50,
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Text(
                                                      "you have attended this lecture",
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ));
                                    }),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(bottom: 7.0),
                              //   child: myButton(
                              //       width: 150,
                              //       height: 30,
                              //       color: Colors.blue,
                              //       textSize: 13,
                              //       textcolor: Colors.white,
                              //       text: 'Try another Image',
                              //       onTap: () {
                              //         Navigator.pop(context);
                              //       }),
                              // ),
                            ],
                          ),
                        );
                      });
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: defaultBlueColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        width: double.infinity,
                        height: 55,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Take a Photo ',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Icon(
                              Icons.linked_camera_sharp,
                              color: Colors.white,
                            )
                          ],
                        )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
    );
  }

  ImagePicker picker = ImagePicker();

  // Future<void> detectFacesInImageImage() async {
  //
  // }
  Future<void> getUserFaceImage() async {
    var image = await picker
        .pickImage(
      source: ImageSource.gallery,
    )
        .catchError((e) {
      print('pick image method  error${e.toString()} ');
      return null;
    });

    if (image == null) return null;
    getFaceRecognition(File(image.path));

    final GoogleVisionImage visionImage =
        GoogleVisionImage.fromFile(File(image.path));
    final FaceDetector faceDetector =
        GoogleVision.instance.faceDetector(const FaceDetectorOptions(
      mode: FaceDetectorMode.fast,
      enableLandmarks: true,
      enableClassification: false,
      enableContours: false,
      enableTracking: false,
    ));

    _faces = await faceDetector.processImage(visionImage);
    print('////////////////////');
    print(_faces!.length);
    print(_faces!);
    print('////////////////////');
    print(image.path);

    loading = true;

    _imageFile = File(image.path);

    if (_faces!.length == 0) {
      print(_faces!.length);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          alignment: Alignment.center,
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Failed Note :',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade700,
              ),
            ),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          ' Sorry , this image is not valid cause it has no faces , Try Again ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          shadowColor: Colors.blue[100],
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 35, bottom: 7.0),
              child: myButton(
                  width: 100,
                  height: 30,
                  color: Colors.blue,
                  textSize: 13,
                  textcolor: Colors.white,
                  text: 'Back Home',
                  onTap: () {
                    navigateAndFinish(
                      context: context,
                      widget: SizedBox(),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 7.0),
              child: myButton(
                  width: 150,
                  height: 30,
                  color: Colors.blue,
                  textSize: 13,
                  textcolor: Colors.white,
                  text: 'Try another Image',
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      );
    } else if (_faces!.length > 1) {
      print(_faces!.length);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          alignment: Alignment.center,
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Failed Note :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade700,
              ),
            ),
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          ' Sorry , this image is not valid cause it has ${_faces!.length} Faces  , We just Need one , Try Again ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          shadowColor: Colors.blue[100],
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 35, bottom: 7.0),
              child: myButton(
                  width: 100,
                  height: 30,
                  color: Colors.blue,
                  textSize: 13,
                  textcolor: Colors.white,
                  text: 'Back Home',
                  onTap: () {
                    navigateAndFinish(
                      context: context,
                      widget: SizedBox(),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 7.0),
              child: myButton(
                  width: 150,
                  height: 30,
                  color: Colors.blue,
                  textSize: 13,
                  textcolor: Colors.white,
                  text: 'Try another Image',
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      );
    } else if (_faces!.length == 1) {
      setState(() {
        classifyImage(File(image.path));
      });
    }
  }

  Future<void> getUserFaceWithCameraImage() async {
    var image = await picker
        .pickImage(
      source: ImageSource.camera,
    )
        .catchError((e) {
      print('pick image method  error${e.toString()} ');
      return null;
    });
    if (image == null) return null;
    setState(() {
      print(image.path);
      loading = true;
      _imageFile = File(image.path);
      classifyImage(File(image.path));
    });
    getFaceRecognition(File(image.path));
  }

  classifyImage(File? image) async {
    var output = await Tflite.runModelOnImage(
      path: image!.path,
      numResults: 2,
      threshold: 0.2,
      imageMean: 0.0,
      imageStd: 255.0,
      asynch: true,
    );
    setState(() {
      loading = false;
      outputs = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/Tflite_Model/model.tflite',
      labels: 'assets/Tflite_Model/labels.txt',
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    ).then((value) {
      print('model Loaded');
    });
  }

  @override
  void dispose() async {
    super.dispose();
    await Tflite.close();
  }

  Future<bool> storeAttendance(String studentCode, String time) async {
    Response<dynamic> response = await DioHelper.postData(
        methodUrl: "http://www.attend100.somee.com/api/GetCode",
        data: {
          "studentCode": studentCode,
          "scanTime": time,
        });
    print("object ${response.data}");
    return true;
  }

  Future<void> getFaceRecognition(File file) async {
    Response<dynamic> response = await DioHelper.uploadFile(
        methodUrl: "https://rare-prawn-awfully.ngrok-free.app/recognize",
        file: file);
    storeAttendance(response.data["StudentCode"], response.data["Time"]);
  }
}
