import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';

class PetScreen extends StatelessWidget {

  final Map<String, dynamic> myPet;
  const PetScreen({required this.myPet, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                              height: 450,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    myPet['image'],
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
                                vertical: 45,
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
                        const SizedBox(height: 50,),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 17,
                      ),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
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
                              Text(
                                myPet['name'],
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                '${myPet['type']} - ${myPet['age']}',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: myPet['gender'] == 'male'
                                  ? Colors.lightBlue
                                  : Colors.pink[200],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: myPet['gender'] == 'male'
                                      ? Colors.blue.withOpacity(.2)
                                      : Colors.pink.withOpacity(.15),
                                  spreadRadius: 5,
                                  blurRadius: 3,
                                ),
                              ]
                            ),
                            child: Icon(
                              myPet['gender'] == 'male'
                                  ? Icons.male
                                  : Icons.female,
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              myPet['weight'],
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            const Text('Weight',),
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              myPet['height'],
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            const Text('Height',),
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              myPet['color'],
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            const Text('Color',),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                  ],
                ),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,),
                  child: Text(
                    myPet['about'],
                    style: const TextStyle(
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
                      myPet['behavior'].length,
                      (index) => Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.lightBlue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          myPet['behavior'][index],
                          style: const TextStyle(
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
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      myPet['ownerImage'],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Posted by',),
                      const SizedBox(height: 5,),
                      Text(
                        myPet['ownerName'],
                        textScaleFactor: 1.1,
                      ),
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
