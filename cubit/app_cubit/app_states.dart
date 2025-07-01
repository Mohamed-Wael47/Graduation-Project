
abstract class AppStates{}

class AppInitialState extends AppStates{}

class SkinGetUserLoadingState extends AppStates{}
class SkinGetUserSuccessState extends AppStates{
 // final SkinUserModel skinUserModel;
 //
 //  SkinGetUserSuccessState(this.skinUserModel);

}
class SkinGetUserErrorStates extends AppStates{
  final dynamic error ;

  SkinGetUserErrorStates(this.error);
}



class SkinGetAdminForUsersSuccessState extends AppStates{
  // final String uId ;
  //
  // SkinGetAllUsersSuccessState(this.uId);
}
class SkinGetAdminForUsersErrorState extends AppStates{
  final String error ;

  SkinGetAdminForUsersErrorState(this.error);
}


class GetAttendanceLoadingState extends AppStates {}
class GetAttendanceSucessState extends AppStates {}




class SkinChangeBottomNavState extends AppStates{}


class SkinProfileImagePickedSuccessState extends AppStates{}
class SkinProfileImagePickedErrorState extends AppStates{}



class SkinUploadProfileImageSuccessState extends AppStates{}
class SkinUploadProfileImageErrorState extends AppStates{}


class SkinUpdateUserLoadingState extends AppStates{}
class SkinUpdateUserErrorState extends AppStates{}
class SkinUpdateUserSuccessState extends AppStates{}


class ChangeAppModeState extends AppStates{}







class SkinLogoutLoadingState extends AppStates{}
class SkinLogoutSuccessState extends AppStates{}
class SkinLogoutErrorState extends AppStates{}









