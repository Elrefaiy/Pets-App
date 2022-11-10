import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';
import 'package:pets_application/shared/components/components.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {

        List<dynamic> favourites = [];
        AppCubit.get(context).pets.forEach((element) {
          if (element['favourite']) {
            favourites.add(element);
          }
        });

        return ConditionalBuilder(
          condition: favourites.isNotEmpty,
          builder: (context)=> GridView.count(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: .7,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: List.generate(
              favourites.length,
              (index) => petItem(
                context: context,
                id: favourites[index]['id'],
                image: favourites[index]['image'],
                petFor: favourites[index]['petFor'],
                name: favourites[index]['name'],
                address: favourites[index]['address'],
                favourite: favourites[index]['favourite'],
              ),
            ),
          ),
          fallback: (context)=> const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
