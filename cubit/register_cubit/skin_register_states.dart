
abstract class RegisterStates{}
class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates
{

}
class RegisterErrorState extends RegisterStates{
  final dynamic error ;

  RegisterErrorState(this.error);

}

class CreateUserSuccessState extends RegisterStates
{
final String uId ;

  CreateUserSuccessState(this.uId);
}
class CreateUserErrorState extends RegisterStates{
  final dynamic error ;

  CreateUserErrorState(this.error);

}

class RegisterChangPasswordVisibilityState extends RegisterStates{}
