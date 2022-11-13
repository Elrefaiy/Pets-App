import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';
import 'package:pets_application/models/categories.dart';
import 'package:pets_application/modules/map_screen.dart';
import 'package:pets_application/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {



        List pets = AppCubit.get(context).pets;
        List newPets = [];
        List dogs = [];
        List cats = [];
        List birds = [];

        List<String> titles = [
          'Newest Pets',
          'Dogs',
          'Cats',
          'Birds',
        ];

        for (var element in pets) {
          if(element['category'] == 'new'){
            newPets.add(element);
          }else if(element['category'] == 'dog'){
            dogs.add(element);
          }else if(element['category'] == 'cat'){
            cats.add(element);
          }else{
            birds.add(element);
          }
        }

        List myPetList = [] ;
        if(AppCubit.get(context).catIndex == 0){
          myPetList = newPets;
        }else if (AppCubit.get(context).catIndex == 1){
          myPetList = dogs;
        }else if (AppCubit.get(context).catIndex == 2){
          myPetList = cats;
        }else{
          myPetList = birds;
        }

        List<Category> catItems = [
          Category(
            'All Pets',
            'assets/images/dog.png',
            Colors.blue.withOpacity(.7),
            newPets.length,
          ),
          Category(
            'Dogs',
            'assets/images/dog.png',
            Colors.brown.withOpacity(.7),
            dogs.length,
          ),
          Category(
            'Cats',
            'assets/images/cat.png',
            Colors.pink.withOpacity(.3),
            cats.length,
          ),
          Category(
            'Birds',
            'assets/images/bird.png',
            Colors.yellow.withOpacity(.5),
            birds.length,
          ),
        ];


        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 160,
                    margin: const EdgeInsets.symmetric(horizontal: 20,),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://img.freepik.com/premium-vector/map-with-destination-location-point-city-map-with-street-river-gps-map-navigator-concept_34645-1078.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                ' Find Nearest Friendly Pet',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 18,
                                  ),
                                  Text(
                                    'Menufia, Cairo, Egypt',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.yellow[700],
                          child: IconButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context)=>const MapScreen(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.my_location,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
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
              SizedBox(
                height: 50,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20,),
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      AppCubit.get(context).changeCatIndex(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppCubit.get(context).catIndex == index
                            ? catItems[index].color.withOpacity(.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppCubit.get(context).catIndex == index
                              ? catItems[index].color
                              : Colors.grey.withOpacity(.4),
                          width: AppCubit.get(context).catIndex == index ? 2 : .75,
                        ),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text(catItems[index].name, textScaleFactor: 1.1,),
                              Text('Total of ${catItems[index].total}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(width: 10,),
                  itemCount: catItems.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // newest pets
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  titles[AppCubit.get(context).catIndex],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ConditionalBuilder(
                condition: pets.isNotEmpty,
                builder: (context)=> GridView.count(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: .7,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    myPetList.length, (index) => petItem(
                    context: context,
                    id: myPetList[index]['id'],
                    image: myPetList[index]['image'],
                    name: myPetList[index]['name'],
                    petFor: myPetList[index]['petFor'],
                    address: myPetList[index]['address'],
                    favourite: myPetList[index]['favourite'],
                    price: myPetList[index]['price'],
                  ),
                  ),
                ),
                fallback: (context)=> const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        );
      },
    );
  }
}
