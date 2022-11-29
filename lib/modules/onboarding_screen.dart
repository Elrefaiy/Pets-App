import 'package:flutter/material.dart';
import 'package:pets_application/models/onboarding.dart';
import 'package:pets_application/modules/register_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var pageController = PageController();

    List onBoardingPage = <OnBoarding>[
      OnBoarding(
        image: 'https://assets.vogue.in/photos/62502b8d90038a40f11ff27c/2:3/w_1600,c_limit/Dog%202.png',
        title: 'Pet Care In Your Neighbourhood',
        body: 'Connect with 5-star pet caregivers near you who are boarding, walking, house sitting or day care.',
        color: 0xff95cce1,
      ),
      OnBoarding(
        image: 'https://img.freepik.com/free-photo/red-white-cat-i-white-studio_155003-13189.jpg',
        title: 'Find The Nearest Pet Form Your Location',
        body: 'Using our map you can chose your location, to find the nearest friendly pet for you fast and easy.',
        color: 0xffffffff,

      ),
      OnBoarding(
        image: 'https://img.freepik.com/free-photo/closeup-shot-sulphur-crested-cockatoo-perched-branch-yellow-background_181624-36192.jpg',
        title: 'Find And Make Your New Friends',
        body: 'Pets have so much to give, they will never stop giving it to you once you let them into your heart.',
        color: 0xfff4b33f,

      ),
    ];

    Widget boarding(OnBoarding model) => Container(
      color: Color(model.color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(model.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 10,
                  blurRadius: 10,
                  color: Color(0x2D616161),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1e4558),
                    fontSize: 26,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  model.body,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey[300],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => boarding(onBoardingPage[index]),
              controller: pageController,
              itemCount: 3,
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            axisDirection: Axis.horizontal,
            effect: const SlideEffect(
              spacing: 10.0,
              radius: 5.0,
              dotWidth: 20.0,
              dotHeight: 6.0,
              paintStyle: PaintingStyle.stroke,
              strokeWidth: 1.5,
              dotColor: Color(0x52FF5252),
              activeDotColor: Color(0xdddc4753),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xff1e4558),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=> const RegisterScreen(),
                  ),
                );
              },
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
