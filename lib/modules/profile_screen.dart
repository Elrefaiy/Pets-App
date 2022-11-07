import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';
import 'package:pets_application/modules/register_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var c = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
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
                                  'https://media.istockphoto.com/id/165066428/vector/pets.jpg?s=612x612&w=0&k=20&c=5c01R_8H6cM9PDkHYXcFHTxjmCRcq_mD7C4YNLNpWho=',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 400,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: AlignmentDirectional.topCenter,
                                end: AlignmentDirectional.bottomCenter,
                                colors: [
                                  Color(0xffffffff),
                                  Color(0x10ffffff),
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 36,),
                                const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    'https://www.bentbusinessmarketing.com/wp-content/uploads/2013/02/35844588650_3ebd4096b1_b-1024x683.jpg',
                                  ),
                                  radius: 60,
                                ),
                                const SizedBox(height: 20,),
                                const Text(
                                  'Georgie Cole',
                                  style: TextStyle(
                                    // color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'Dogs Lover',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: 25,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: const [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Color(0xff1e79e5),
                                      child: FaIcon(
                                        FontAwesomeIcons.facebookF,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 30,),
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Color(0xff1db7ff),
                                      child: FaIcon(
                                        FontAwesomeIcons.twitter,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 30,),
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Color(0xffff6a6a),
                                      child: FaIcon(
                                        FontAwesomeIcons.google,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'About Me',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'I am always punctual to school and regular in my studies. I love to play with my friends during break time. My best friends name is Pooja and we play with dolls every day after school. I participate in all extracurricular activities and sports events at my school and try my best to do well.',
                          style: TextStyle(
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
              const SizedBox(height: 15,),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 4,
                      color: Colors.grey.withOpacity(.3)
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Account Information',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: const [
                        Text(
                          'Phone number',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Text(
                          '419-921-8500',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.grey.withOpacity(.5),
                      width: double.infinity,
                      height: 1,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    Row(
                      children: const [
                        Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Text(
                          'elrefaiy77@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.grey.withOpacity(.5),
                      width: double.infinity,
                      height: 1,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    Row(
                      children: const [
                        Text(
                          'Address',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Text(
                          '2944 Genoveva Pine',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 4,
                        color: Colors.grey.withOpacity(.3)
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: (){
                    AppCubit.get(context).signOut();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => const RegisterScreen())), (route) => false);
                  },
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35,),
            ],
          ),
        );
      },
    );
  }
}
