import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pets_application/cubit/app_status.dart';
import 'package:pets_application/models/user.dart';
import 'package:pets_application/modules/favourites_screen.dart';
import 'package:pets_application/modules/home_screen.dart';
import 'package:pets_application/modules/profile_screen.dart';
import 'package:pets_application/modules/food_screen.dart';
import 'package:pets_application/shared/constants/conistants.dart';
import 'package:pets_application/shared/network/end_points.dart';
import 'package:pets_application/shared/network/local/cache_helper.dart';
import 'package:pets_application/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int registerIndex = 0;
  void changeRegisterIndex(int index) {
    registerIndex = index;
    emit(ChangeRegisterIndexState());
  }

  bool isAnonymous = true;

  void createUser({
    required String userName,
    required String email,
    required String password,
  }) {
    emit(UserSignupLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      addUserToFireStore(
        uId: value.user!.uid,
        userName: userName,
        email: value.user!.email,
        isGuest: value.user!.isAnonymous,
      );
      CacheHelper.putData(
        key: 'token',
        value: value.user!.uid.toString(),
      );
      emit(UserSignupSuccessState());
    }).catchError((error) {
      emit(UserSignupErrorState(error.toString()));
    });
  }

  void addUserToFireStore({
    required uId,
    required userName,
    required email,
    required isGuest,
  }) {
    UserModel userModel = UserModel(
      name: userName,
      nickname: '---',
      email: email,
      phone: '-',
      address: '-',
      about: '...',
      image: '',
      isGuest: isGuest,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      emit(AddUserSuccessState());
    }).catchError((error) {
      emit(AddUserErrorState(error.toString()));
    });
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(UserLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      CacheHelper.putData(
        key: 'token',
        value: value.user!.uid.toString(),
      );
      emit(UserLoginSuccessState());
    }).catchError((error) {
      emit(UserLoginErrorState(error.toString()));
    });
  }

  void anonymous() {
    emit(AnonymousLoadingState());
    FirebaseAuth.instance.signInAnonymously().then((value) {
      addUserToFireStore(
        uId: value.user!.uid,
        userName: 'I am Guest',
        email: 'I am Guest',
        isGuest: value.user!.isAnonymous,
      );
      CacheHelper.putData(
        key: 'token',
        value: value.user!.uid.toString(),
      );
      emit(AnonymousSuccessState());
    }).catchError((error) {
      emit(AnonymousErrorState(error.toString()));
    });
  }

  void signOut() {
    emit(UserSignOutLoadingState());
    CacheHelper.removeData(key: 'token');
    FirebaseAuth.instance.signOut().then((value) {
      emit(UserSignOutSuccessState());
    }).catchError((error) {
      emit(UserSignOutErrorState(error.toString()));
    });
  }

  late UserModel userModel;
  void getUser() {
    if (token != '') {
      emit(GetUserLoadingState());
      FirebaseFirestore.instance
          .collection('users')
          .doc(token)
          .get()
          .then((value) {
        userModel = UserModel.fromJson(value.data());
        emit(GetUserSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetUserErrorState(error.toString()));
      });
    }else{
      print('Empty uId $token');
    }
  }

  bool isHidden = true;
  void toggleHide() {
    isHidden = !isHidden;
    emit(ChangePasswordVisibilityState());
  }

  int currentIndex = 0;
  List<String> title = [
    'Pets Store',
    'Favourites',
    "Pet's Food",
    'Profile',
  ];
  List<Widget> layoutScreens = [
    const HomeScreen(),
    const FavouritesScreen(),
    const FoodScreen(),
    const ProfileScreen(),
  ];
  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState());
  }

  int catIndex = 0;
  void changeCatIndex(int index) {
    catIndex = index;
    emit(ChangeCatIndexState());
  }

  List<dynamic> pets = [];
  Set<Marker> markers = {};

  void getPetsData() {
    emit(GetAllPetsDataLoadingState());
    DioHelper.getData(
      url: allPets,
    ).then((value) {
      pets = value.data;
      emit(GetAllPetsDataSuccessState());
    }).catchError((error) {
      emit(GetAllPetsDataErrorState(error.toString()));
    });
  }

  Map<String, dynamic> myPet = {};
  void getPetItem(String id) {
    myPet = pets[int.parse(id)];
  }

  List<dynamic> allFoods = [];
  void getFoodsData() {
    emit(GetFoodsDataLoadingState());
    DioHelper.getData(
      url: foods,
    ).then((value) {
      allFoods = value.data;
      emit(GetFoodsDataSuccessState());
    }).catchError((error) {
      emit(GetFoodsDataErrorState(error.toString()));
    });
  }

  Map<String, dynamic> searchResult = {};

  void searchPet(String id) {
    emit(SearchPetLoadingState());
    DioHelper.getData(
      url: search(id),
    ).then((value) {
      searchResult = value.data;
      emit(SearchPetSuccessState());
    }).catchError((error) {
      emit(SearchPetErrorState(error.toString()));
    });
  }
}
