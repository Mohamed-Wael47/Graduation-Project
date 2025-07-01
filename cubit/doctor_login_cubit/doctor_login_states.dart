
abstract class DoctorLoginStates{}
class DoctorLoginInitialState extends DoctorLoginStates{}


class DoctorLoginLoadingState extends DoctorLoginStates{}
class DoctorLoginSuccessState extends DoctorLoginStates {
final String uId ;
final String name ;

DoctorLoginSuccessState(this.uId ,this.name);
}
class DoctorLoginNotAllowedState extends DoctorLoginStates {}
class DoctorLoginErrorState extends DoctorLoginStates{
  final dynamic error ;

  DoctorLoginErrorState(this.error);

}

class ChangPasswordVisibilityState extends DoctorLoginStates{}


// class AdminLoginSuccessState extends DoctorLoginStates{
//   final String uIdAdmin ;
//
//   AdminLoginSuccessState(this.uIdAdmin);
//
//
// }
