import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: ((context, state) {
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                color: Color(0xffeceadc),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://i.pinimg.com/originals/d9/b3/7f/d9b37f2a81e9b516a2d0d6c1ceab1a20.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: const BoxDecoration(
                            color: Color(0xf0ffffff),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x31323232),
                                spreadRadius: 10,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Image(
                            image: NetworkImage(
                                'https://www.petlink.net/wp-content/uploads/2022/04/pl-logo-v-b.png'
                            ),
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 340,
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                color: Color(0xf0ffffff),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x31323232),
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
                                                color: Colors.blue,
                                                width: AppCubit.get(context)
                                                            .registerIndex ==
                                                        0
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
                                                color: AppCubit.get(context)
                                                            .registerIndex ==
                                                        0
                                                    ? Colors.blue
                                                    : Colors.grey,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            onPressed: () {
                                              AppCubit.get(context)
                                                  .changeRegisterIndex(0);
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.blue,
                                                width: AppCubit.get(context)
                                                            .registerIndex ==
                                                        1
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
                                                color: AppCubit.get(context)
                                                            .registerIndex ==
                                                        1
                                                    ? Colors.blue
                                                    : Colors.grey,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            onPressed: () {
                                              AppCubit.get(context)
                                                  .changeRegisterIndex(1);
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
                                              height: 45,
                                              child: TextFormField(
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
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
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  prefixIcon:
                                                      Icon(Icons.lock_outline),
                                                  labelText: 'Password',
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Spacer(),
                                                TextButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                    'forget password ?',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
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
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  prefixIcon:
                                                      Icon(Icons.lock_outline),
                                                  labelText: 'Password',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            SizedBox(
                                              height: 45,
                                              child: TextFormField(
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                  ),
                                                  prefixIcon: Icon(Icons.more_horiz),
                                                  labelText: 'Confirm Password',
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
                                color: Color(0xf0ffffff),
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
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_forward),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// https://i.pinimg.com/564x/35/08/15/3508153d63b595bdac4b7d1169217996.jpg
// https://i.pinimg.com/564x/46/06/ed/4606ed955169e30c0a98fba712c282c1.jpg
// https://i.pinimg.com/564x/0e/84/e5/0e84e5d48847d45666254ca4d86f6301.jpg
// https://i.pinimg.com/originals/d9/b3/7f/d9b37f2a81e9b516a2d0d6c1ceab1a20.png
//https://64.media.tumblr.com/07c1c2e87fb8ca247103dd92bc14a74c/tumblr_n68s9pNcQS1rrccpdo1_640.jpg
