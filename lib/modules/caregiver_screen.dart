import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';

class CaregiverScreen extends StatelessWidget {
  final Map user;
  const CaregiverScreen(this.user,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener:(context, state){},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 400,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://i.pinimg.com/564x/d9/b3/7f/d9b37f2a81e9b516a2d0d6c1ceab1a20.jpg',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 400,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: AlignmentDirectional.topCenter,
                                    end: AlignmentDirectional.bottomCenter,
                                    colors: [
                                      Colors.grey[100]!,
                                      const Color(0x11ffffff),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        user['image'],
                                      ),
                                      radius: 65,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      user['name'],
                                      style: const TextStyle(
                                        color: Color(0xff1e4558),
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      user['nickname'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blueGrey[700],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 130,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(.8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About Me',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              user['about'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blueGrey.withOpacity(.4),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Account Information',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff1e4558),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Phone number',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Text(
                              user['phone'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xffdc4753),
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.blueGrey.withOpacity(.4),
                          width: double.infinity,
                          height: 1,
                          margin: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Email',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Text(
                              user['email'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xffdc4753),
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.blueGrey.withOpacity(.4),
                          width: double.infinity,
                          height: 1,
                          margin: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Address',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Text(
                              user['address'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xffdc4753),
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
