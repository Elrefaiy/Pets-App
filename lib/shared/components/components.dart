import 'package:flutter/material.dart';
import 'package:pets_application/modules/pet_screen.dart';

Widget petItem(context) => Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.grey.withOpacity(.4)),
  ),
  child: GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => const PetScreen()),
        ),
      );
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.freepik.com/free-photo/kitty-with-monochrome-wall-her_23-2148955134.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            Container(
              width: 33,
              height: 33,
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.grey[350],
                  size: 18,
                ),

              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 9,),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Text(
            'Adoption',
            style: TextStyle(
                fontSize: 12,
                color: Colors.blue,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,),
          child: Text(
            'Scottish Fold',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5,),
          child: Row(
            children: const [
              Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: 18,
              ),
              Text(
                'California ( 2.5 Km )',
                  style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);