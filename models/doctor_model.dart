import 'dart:convert';

DoctorModel doctorModelFromJson(String str) =>
    DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());



class DoctorModel {
  String? name;
  String? email;
  String? uId;

  DoctorModel({
     this.name ,
     this.email ,
     this.uId,
  })  ;

  DoctorModel.fromJson(Map<String ,dynamic> json)
  {

    name =json['name'] ;
    email =json['email'] ;
    uId =json['uId'] ;
  }

  Map<String ,dynamic> toJson(){
return {
  'name':name ,
  'email':email ,
  'uId':uId ,
} ;

  }


}