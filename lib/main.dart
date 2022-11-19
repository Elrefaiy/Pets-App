import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/layout/layout.dart';
import 'package:pets_application/modules/onboarding_screen.dart';
import 'package:pets_application/shared/constants/conistants.dart';
import 'package:pets_application/shared/network/local/cache_helper.dart';
import 'package:pets_application/shared/network/remote/dio_helper.dart';
import 'cubit/bloc_observer.dart';
import 'firebase_options.dart';

void main() async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  DioHelper.init();

  Widget widget ;
  token = CacheHelper.getData(key: 'token') ?? '';
  if(token == ''){
    widget = const OnBoardingScreen();
  }else{
    widget = const Layout();
  }

  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {

  final Widget widget;
  const MyApp(this.widget, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => AppCubit()
        ..getPetsData()
        ..getFoodsData()
        ..getUser()
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        home: widget,
      ),
    );
  }
}
