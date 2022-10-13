abstract class AppStates {
  get error{}
}

class AppInitialState extends AppStates {}

class ChangeRegisterIndexState extends AppStates {}

class UserLoginLoadingState extends AppStates {}
class UserLoginSuccessState extends AppStates {}
class UserLoginErrorState extends AppStates {
  @override
  final String error;
  UserLoginErrorState(this.error);
}

class UserSignupLoadingState extends AppStates {}
class UserSignupSuccessState extends AppStates {}
class UserSignupErrorState extends AppStates {
  @override
  final String error;
  UserSignupErrorState(this.error);
}

class AnonymousLoadingState extends AppStates {}
class AnonymousSuccessState extends AppStates {}
class AnonymousErrorState extends AppStates {
  @override
  final String error;
  AnonymousErrorState(this.error);
}

class ChangePasswordVisibilityState extends AppStates {}

class ChangeCurrentIndexState extends AppStates {}


