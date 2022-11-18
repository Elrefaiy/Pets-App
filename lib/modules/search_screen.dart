import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';
import 'package:pets_application/modules/pet_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var searchController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              state is SearchPetLoadingState
                  ? const LinearProgressIndicator()
                  : const SizedBox(height: 3,),

              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                child: TextFormField(
                  style: const TextStyle(
                    color: Color(0xff1e4558),
                    fontSize: 16,
                  ),
                  controller: searchController,
                  decoration: InputDecoration(
                    fillColor: Colors.blueGrey.withOpacity(.2),
                    filled: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Color(0xff1e4558),
                      ),
                      onPressed: (){
                        AppCubit.get(context).searchPet(searchController.text);
                      },
                    ),
                    helperText: '☛ you can search with the pet ID.',
                    hintText: 'Search',
                    hintStyle: const TextStyle(
                      color: Color(0xff1e4558),
                      fontSize: 16,
                    ),
                  ),
                  onFieldSubmitted: (id){
                    AppCubit.get(context).searchPet(id);
                  },
                ),
              ),
              const SizedBox(height: 15,),
              ConditionalBuilder(
                condition: AppCubit.get(context).searchResult.isNotEmpty,
                builder: (context) => GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => PetScreen(
                          myPet: AppCubit.get(context).searchResult,
                        )),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 140,
                    margin: const EdgeInsets.symmetric(horizontal: 20,),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.blueGrey.withOpacity(.4),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 140,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                AppCubit.get(context).searchResult['image'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.blueGrey.withOpacity(.4),
                          width: 1,
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10,),
                              Text(
                                AppCubit.get(context).searchResult['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[700],
                                  fontSize: 18,
                                ),
                                maxLines: 1,
                              ),
                              const SizedBox(height: 5,),
                              Text(
                                AppCubit.get(context).searchResult['about'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.blueGrey,
                                ),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow[700],
                                    size: 20,
                                  ),
                                  Text(
                                    '  ${AppCubit.get(context).searchResult['reviews']}',
                                    style: const TextStyle(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    AppCubit.get(context).searchResult['price'],
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Color(0xffdc4753),
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                      ],
                    ),

                  ),
                ),
                fallback: (context) => Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                          'assets/images/cat.json',
                          width: 250
                      ),
                      const Text(
                        'search about the pet you want !',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
