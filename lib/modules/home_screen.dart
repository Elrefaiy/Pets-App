import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';
import 'package:pets_application/models/categories.dart';
import 'package:pets_application/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> catItems = [
      Category(
        'All Pets',
        'assets/images/dog.png',
        Colors.blue.withOpacity(.7),
        20,
      ),
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
        'Hamsters',
        'assets/images/hamster.png',
        Colors.orange.withOpacity(.4),
        26,
      ),
    ];

    List<String> titles = [
      'Newest Pets',
      'Dogs',
      'Cats',
      'Birds',
      'Hamsters'
    ];

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
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
                  itemCount: 5,
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
              GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: .7,
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  6, (index) => petItem(context),
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
