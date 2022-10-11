import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_application/cubit/app_status.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int registerIndex = 0 ;
  void changeRegisterIndex(int index){
    registerIndex = index;
    emit(ChangeRegisterIndexState());
  }

  void createUser({
    required String email,
    required String password,
  }){
    emit(UserSignupLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value){
      emit(UserSignupSuccessState());
      print(value.user?.email);
      print(value.user?.uid);
    }).catchError((error){
      emit(UserSignupErrorState(error.toString()));
      print(error.toString());
    });
  }

  void userLogin({
    required String email,
    required String password,
  }){
    emit(UserLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value){
      emit(UserLoginSuccessState());
    }).catchError((error){
      emit(UserLoginErrorState(error.toString()));
    });
  }

}