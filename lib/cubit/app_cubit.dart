import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_application/cubit/app_status.dart';
import 'package:pets_application/modules/facourites_screen.dart';
import 'package:pets_application/modules/home_screen.dart';
import 'package:pets_application/modules/profile_screen.dart';
import 'package:pets_application/modules/search_screen.dart';

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
    }).catchError((error){
      emit(UserSignupErrorState(error.toString()));
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

  void anonymous(){
    emit(AnonymousLoadingState());
    FirebaseAuth.instance.signInAnonymously().then((value){
      emit(AnonymousSuccessState());
    }).catchError((error){
      emit(AnonymousErrorState(error));
    });
  }

  bool isHidden = true;
  void toggleHide(){
    isHidden = !isHidden;
    emit(ChangePasswordVisibilityState());
  }

  int currentIndex = 0 ;
  List<Widget> layoutScreens = [
    const HomeScreen(),
    const FavouritesScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];
  void changeCurrentIndex(int index){
    currentIndex = index;
    emit(ChangeCurrentIndexState());
  }

}