import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            'New Pets',
            'assets/images/allPets.png',
            Colors.orange.withOpacity(.7),
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
            Colors.redAccent.withOpacity(.7),
            cats.length,
          ),
          Category(
            'Birds',
            'assets/images/bird.png',
            Colors.blueAccent.withOpacity(.6),
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
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.blueGrey.withOpacity(.4),
                      ),
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
                      border: Border.all(
                        color: Colors.blueGrey.withOpacity(.4),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ' Find Nearest Friendly Pet',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blueGrey[700],
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 18,
                                    color: Colors.blueGrey,
                                  ),
                                  Text(
                                    'Menufia, Cairo, Egypt',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blueGrey,
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
                          backgroundColor: Colors.orange[300],
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
                  color: Colors.blueGrey.withOpacity(.2),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(22),
                    bottomLeft: Radius.circular(22),
                  ),
                  border: Border.all(
                    color: Colors.blueGrey.withOpacity(.4),
                  ),
                ),
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Color(0xff1e4558),
                      size: 18,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Color(0xff1e4558),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // categories
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Pet Category',
                  style: TextStyle(
                    color: Color(0xff1e4558),
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
                              : Colors.blueGrey.withOpacity(.4),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          CircleAvatar(
                            backgroundColor:catItems[index].color,
                            radius: 21,
                            child: Image(
                              image: AssetImage(catItems[index].image),
                              width: 23,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text(
                                catItems[index].name,
                                style: TextStyle(
                                    color: Colors.blueGrey[700],
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'total of ${catItems[index].total}',
                                style: TextStyle(
                                  color: Colors.blueGrey[700],
                                  fontSize: 13,
                                ),
                              ),
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
                  style: const TextStyle(
                    color: Color(0xff1e4558),
                    fontWeight: FontWeight.bold,
                  ),
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
