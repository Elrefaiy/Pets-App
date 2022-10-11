abstract class AppStates {}

class AppInitialState extends AppStates {}

class ChangeRegisterIndexState extends AppStates {}

class UserLoginLoadingState extends AppStates {}
class UserLoginSuccessState extends AppStates {}
class UserLoginErrorState extends AppStates {
  final String error;
  UserLoginErrorState(this.error);
}

class UserSignupLoadingState extends AppStates {}
class UserSignupSuccessState extends AppStates {}
class UserSignupErrorState extends AppStates {
  final String error;
  UserSignupErrorState(this.error);
}

