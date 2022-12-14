import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';
import 'package:pets_application/layout/layout.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var loginEmailController = TextEditingController();
    var loginPasswordController = TextEditingController();
    var signupEmailController = TextEditingController();
    var signupPasswordController = TextEditingController();
    var usernameController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if( state is UserLoginSuccessState ||
            state is AddUserSuccessState ||
            state is AnonymousSuccessState){
          Fluttertoast.showToast(
            msg: 'You have successfully logged in.',
            fontSize: 16,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.green[400]!.withOpacity(.8),
            gravity: ToastGravity.TOP,
          );
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context)=> const Layout(),
              ), (route) => false,
          );
        }
        else if( state is UserLoginErrorState ||
            state is UserSignupErrorState ||
            state is AnonymousErrorState ){
          Fluttertoast.showToast(
            msg: state.error.toString().split(']').last,
            fontSize: 16,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: const Color(0xc4dc4753),
            gravity: ToastGravity.TOP,
          );
        }
      },
      builder: ((context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              color: Color(0xffd3eafd),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/login.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                child: Column(
                  children: [
                    const SizedBox(height: 150,),
                    Text(
                      AppCubit.get(context).registerIndex == 0
                          ? 'Welcome Again!'
                          : "Let's Get Started!",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.blueGrey[700],
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      AppCubit.get(context).registerIndex == 0
                          ? 'login now and find your friendly pet.'
                          : 'signup now and find your friendly pet.',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 340,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Color(0xc6ffffff),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x14323232),
                                spreadRadius: 10,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: const Color(0xffdc4753),
                                            width: AppCubit.get(context).registerIndex == 0
                                                ? 3
                                                : 0,
                                          ),
                                        ),
                                      ),
                                      child: TextButton(
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: AppCubit.get(context).registerIndex == 0
                                                ? const Color(0xffdc4753)
                                                : Colors.blueGrey[200],
                                            fontWeight: FontWeight.bold
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        onPressed: () {
                                          AppCubit.get(context).changeRegisterIndex(0);
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: const Color(0xffdc4753),
                                            width: AppCubit.get(context).registerIndex == 1
                                                ? 3
                                                : 0,
                                          ),
                                        ),
                                      ),
                                      child: TextButton(
                                        child: Text(
                                          'Signup',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: AppCubit.get(context).registerIndex == 1
                                                ? const Color(0xffdc4753)
                                                : Colors.blueGrey[200],
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        onPressed: () {
                                          AppCubit.get(context).changeRegisterIndex(1);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AppCubit.get(context).registerIndex == 0
                                  ? Column(
                                      children: [
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        SizedBox(
                                          height: 43,
                                          child: TextFormField(
                                            controller: loginEmailController,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                              ),
                                              prefixIcon: Icon(Icons.email_outlined),
                                              labelText: 'Email Address',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 43,
                                          child: TextFormField(
                                            obscureText: AppCubit.get(context).isHidden,
                                            controller: loginPasswordController,
                                            decoration: InputDecoration(
                                              border: const OutlineInputBorder(
                                                borderRadius:
                                                  BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                              ),
                                              prefixIcon: const Icon(Icons.lock_outline,),
                                              suffixIcon: IconButton(
                                                onPressed: (){
                                                  AppCubit.get(context).toggleHide();
                                                },
                                                icon: Icon(
                                                  AppCubit.get(context).isHidden
                                                      ? Icons.visibility_off_outlined
                                                      : Icons.remove_red_eye_outlined,
                                                ),
                                              ),
                                              labelText: 'Password',
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              'or, you can just',
                                              style: TextStyle(
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: (){
                                                AppCubit.get(context).anonymous();
                                              },
                                              child: const Text(
                                                'continue as a guest',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        SizedBox(
                                          height: 45,
                                          child: TextFormField(
                                            controller: usernameController,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              prefixIcon: Icon(Icons.person_outline),
                                              labelText: 'User Name',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 45,
                                          child: TextFormField(
                                            controller: signupEmailController,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                  BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                              ),
                                              prefixIcon:
                                                  Icon(Icons.email_outlined),
                                              labelText: 'Email Address',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 45,
                                          child: TextFormField(
                                            obscureText: AppCubit.get(context).isHidden,
                                            controller: signupPasswordController,
                                            decoration: InputDecoration(
                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              prefixIcon: const Icon(Icons.lock_outline),
                                              suffixIcon: IconButton(
                                                onPressed: (){
                                                  AppCubit.get(context).toggleHide();
                                                },
                                                icon: Icon(
                                                  AppCubit.get(context).isHidden
                                                      ? Icons.visibility_off_outlined
                                                      : Icons.remove_red_eye_outlined,
                                                ),
                                              ),
                                              labelText: 'Password',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(top: 335),
                          decoration: const BoxDecoration(
                            color: Color(0xbaffffff),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x17323232),
                                spreadRadius: 4,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff1e4558),
                              shape: BoxShape.circle,
                            ),
                            child: ConditionalBuilder(
                              condition: state is UserLoginLoadingState || state is UserSignupLoadingState ,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                              fallback: (context) => IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  if (AppCubit.get(context).registerIndex == 1){
                                    AppCubit.get(context).createUser(
                                      userName: usernameController.text,
                                      email: signupEmailController.text,
                                      password: signupPasswordController.text,
                                    );
                                  }else{
                                    AppCubit.get(context).userLogin(
                                      email: loginEmailController.text,
                                      password: loginPasswordController.text,
                                    );
                                  }
                                },
                                icon: const Icon(Icons.arrow_forward),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 150,),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

