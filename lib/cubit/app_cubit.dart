import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
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
      getUser();
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
      phone: '---',
      address: '---',
      about: '---',
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
      getUser();
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
        email: '---',
        isGuest: value.user!.isAnonymous,
      );
      CacheHelper.putData(
        key: 'token',
        value: value.user!.uid.toString(),
      );
      getUser();
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
    token = CacheHelper.getData(key: 'token') ?? '';
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
        emit(GetUserErrorState(error.toString()));
      });
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

  void updateUser({
    required name,
    required nickname,
    required about,
    required phone,
    required address,
    image,
  }) {
    emit(UpdateUserLoadingState());
    userModel = UserModel(
      name: name,
      nickname: nickname,
      about: about,
      phone: phone,
      address: address,
      email: userModel.email,
      image: image ?? userModel.image,
      isGuest: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(token)
        .update(userModel.toMap())
        .then((value) {
      getUser();
      emit(UpdateUserSuccessState());
    }).catchError((error) {
      emit(UpdateUserErrorState(error.toString()));
    });
  }

  File profileImage = File('');
  ImagePicker picker = ImagePicker();

  Future<void> getProfilePic() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(GetProfilePicSuccessState());
    } else {
      emit(GetProfilePicErrorState());
    }
  }

  void uploadProfilePic({
    required String name,
    required String nickname,
    required String about,
    required String phone,
    required String address,
  }) {
    emit(UploadProfilePicLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUser(
          name: name,
          nickname: nickname,
          about: about,
          phone: phone,
          address: address,
          image: value,
        );
        emit(UploadProfilePicSuccessState());
      }).catchError((error) {
        emit(UploadProfilePicErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(UploadProfilePicErrorState(error.toString()));
    });
  }

  List petsCaregivers = [];
  void getCaregivers(){
    DioHelper.getData(
      url: caregivers,
    ).then((value){
      petsCaregivers = value.data;
      emit(GetCaregiversSuccessState());
    }).catchError((error){
      emit(GetCaregiversErrorState(error.toString()));
    });
  }


}
