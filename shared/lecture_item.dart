// import 'package:attendenceapp/shared/colors.dart';
// import 'package:attendenceapp/shared/components.dart';
// import 'package:attendenceapp/view/app/doctor/studentsList_screen.dart';
// import 'package:flutter/material.dart';

// class LectureItem extends StatelessWidget {
//    LectureItem({Key? key ,required this.sessionNum }) : super(key: key);

//    String sessionNum ;
//   @override
//   Widget build(BuildContext context) {

//     return GestureDetector(
//      onTap: (){
//        navigateTo(context: context, widget: StudentsListScreen());
//      },
//       child: Padding(
//         padding:  EdgeInsets.only(top: 10,left: 12 ,right: 12),
//         child: Container(
//           // width: MediaQuery.of(context).size.width * 0.2,
//             height: MediaQuery.of(context).size.height * 0.3,
//           decoration: BoxDecoration(
//             color: AppColors.blackColor,
//             borderRadius: BorderRadius.circular(25),
//           ),

//         child: Column(
//           mainAxisSize:MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//              Center(child: Text('Lecture $sessionNum ' ,style: TextStyle(color: Colors.white ,fontSize: 24 ,fontWeight: FontWeight.w500),) ,),
//             SizedBox(height: 10,),
//             const Center(child: Text('" Click to see the students who attended "' ,style: TextStyle(color: Colors.white ,fontSize: 14 ,fontWeight: FontWeight.w500),) ,),
//           ],
//         ),),
//       ),
//     ) ;
//   }
// }
