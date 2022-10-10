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

}