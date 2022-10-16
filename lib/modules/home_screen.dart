import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // intro
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Column(
                children: const [
                  Text('we care as you care', textScaleFactor: 1.4,),
                  Text('find your friendly pet'),
                ],
              ),
              const SizedBox(width: 20,),
              const Expanded (child: CircleAvatar()),
            ],
          ),
        ),
        const SizedBox(height: 20,),
        // search
        Container(
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(22),
              bottomLeft: Radius.circular(22),
            ),
          ),
          child: Row(
            children: const [
              Icon(Icons.search),
              SizedBox(width: 10,),
              Text('Search')
            ],
          ),
        ),
      ],
    );
  }
}
