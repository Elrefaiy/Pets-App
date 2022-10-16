import 'package:flutter/material.dart';
import 'package:pets_application/models/categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> catItems = [
      Category(
        'Dogs',
        'assets/images/dog.png',
        Colors.brown.withOpacity(.7),
        20,
      ),
      Category(
        'Cats',
        'assets/images/cat.png',
        Colors.pink.withOpacity(.3),
        23,
      ),
      Category(
        'Birds',
        'assets/images/bird.png',
        Colors.yellow.withOpacity(.5),
        30,
      ),
      Category(
        'Hamster',
        'assets/images/hamster.png',
        Colors.orange.withOpacity(.4),
        26,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // intro
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'we care as you care',
                      textScaleFactor: 1.4,
                    ),
                    Text('find your friendly pet'),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/close-up-shot-pleased-woman-with-afro-hair-holds-two-puppies-spends-leisure-time-with-loyal-animal-friends-happy-have-newborn-french-bulldog-dogs_273609-31196.jpg'),
                radius: 70,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
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
              SizedBox(
                width: 10,
              ),
              Text('Search')
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // categories
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text('Pet Category'),
        ),
        const SizedBox(
          height: 15,
        ),
        GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 20,),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 2.7,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: List.generate(
            4,
            (index) => Container(
              width: 40,
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.withOpacity(.4)),
              ),
              child: Row(
                children:[
                  ClipOval(
                    child: CircleAvatar(
                      backgroundColor: catItems[index].color,
                      radius: 21,
                      child: Image(
                        image: AssetImage(catItems[index].image),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Text(catItems[index].name, textScaleFactor: 1.1,),
                      Text('Total of ${catItems[index].total}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
