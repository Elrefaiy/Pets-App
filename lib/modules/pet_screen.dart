import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';

class PetScreen extends StatelessWidget {
  const PetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> behaviour = [
      'Friendly with other cats',
      'Leash trained cat',
      'Active cat',
      'Tries to eat things',
    ];

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    'https://img.freepik.com/free-photo/kitty-with-monochrome-wall-her_23-2148955134.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 50,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.7),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.2),
                                    spreadRadius: 3,
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 80,),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.7),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.2),
                            spreadRadius: 3,
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Maine Coon Cat',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                'French Bulldog, 1y 4m',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: const Icon(
                              Icons.male,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: const [
                      FaIcon(FontAwesomeIcons.circleInfo, size: 20,),
                      Text(
                        ' About Maine',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.withOpacity(.1),
                          border: Border.all(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: const [
                            Text(
                              '5.5 kg',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text('Weight',),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.withOpacity(.1),
                          border: Border.all(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: const [
                            Text(
                              '42 cm',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text('Height',),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue.withOpacity(.1),
                          border: Border.all(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: const [
                            Text(
                              'Light Brown',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text('Color',),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                  ],
                ),
                const SizedBox(height: 15,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,),
                  child: Text(
                    'my cat is incredibly and unconditionally loyal to me, he loves me as much as i love him or something more.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: const [
                      FaIcon(FontAwesomeIcons.circleInfo, size: 20,),
                      Text(
                        ' Maine Behaviour',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    spacing: 6,
                    children: List.generate(
                      behaviour.length,
                      (index) => Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          behaviour[index],
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
              height: 80,
              color: Colors.white,
              child: Row(
                children: [
                  const CircleAvatar(),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Posted by'),
                      SizedBox(height: 5,),
                      Text('Nannie Barker', textScaleFactor: 1.1,),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: (){},
                    child: const Text(
                      'Contact Me',
                      textScaleFactor: 1.05,
                    ),
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
