import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';
import 'package:pets_application/models/slider.dart';
import 'package:pets_application/shared/components/components.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<SliderModel> sliderItems = [
      SliderModel(
        title: 'Silver Dry Dog Food',
        content: 'High-quality animal proteins (poultry and fish) to support body and muscle growth.',
        image: 'https://img.freepik.com/free-photo/chewing-bones-near-bowl-with-food_23-2147799951.jpg',
      ),
      SliderModel(
        title: 'Alpha Puppies Food',
        content: 'The product does not contain any harmful preservatives or colorings.',
        image: 'https://img.freepik.com/free-photo/still-life-pet-food-arrangement_23-2148982349.jpg',
      ),
      SliderModel(
        title: 'Migma Adult Basic Food',
        content: 'Especially suitable for dogs of all breeds from 5 months old.',
        image: 'https://img.freepik.com/free-photo/still-life-pet-food-assortment_23-2148982363.jpg',
      ),
      SliderModel(
        title: 'Mockup Pet Food',
        content: 'Rich in optimal amounts of essential minerals for strong bones and healthy joints.',
        image: 'https://img.freepik.com/free-psd/pet-food-bag-mockup-design_23-2149424627.jpg',
      ),
    ];

    Widget carouselItem(title, content, image,) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0,),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.blueGrey.withOpacity(.4),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 160,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: AlignmentDirectional.bottomCenter,
                end: AlignmentDirectional.topCenter,
                colors: [
                  Color(0xA1494949),
                  Color(0x14494949),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                Text(
                  content,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state) {

        List allFoods = AppCubit.get(context).allFoods;

       return SingleChildScrollView(
         physics: const BouncingScrollPhysics(),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             const SizedBox(height: 10,),
             CarouselSlider.builder(
               itemCount: sliderItems.length,
               itemBuilder: (context, index, realIndex) => carouselItem(
                 sliderItems[index].title,
                 sliderItems[index].content,
                 sliderItems[index].image,
               ),
               options: CarouselOptions(
                 autoPlay: true,
                 enlargeCenterPage: true,

               ),
             ),
             const Padding(
               padding: EdgeInsets.symmetric(horizontal: 20),
               child: Text(
                 'Newest Food Products',
                 style: TextStyle(
                   fontSize: 14,
                   color: Color(0xff1e4558),
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
             const SizedBox(height: 10,),
             ListView.separated(
               padding: const EdgeInsets.symmetric(horizontal: 20,),
               shrinkWrap: true,
               physics: const NeverScrollableScrollPhysics(),
               itemBuilder: (context, index) => foodItem(
                 image: allFoods[index]['image'],
                 name: allFoods[index]['name'],
                 about: allFoods[index]['about'],
                 reviews: allFoods[index]['reviews'],
                 price: allFoods[index]['price'],
               ),
               separatorBuilder: (context, index) => const SizedBox(height: 10,),
               itemCount: allFoods.length,
             ),

           ],
         ),
       );
      },
    );
  }
}
