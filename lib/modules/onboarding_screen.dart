import 'package:flutter/material.dart';
import 'package:pets_application/models/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var pageController = PageController();

    List onBoardingPage = <OnBoarding>[
      OnBoarding(
        image: 'https://img.freepik.com/free-photo/spaniel-puppy-playing-studio-cute-doggy-pet-is-sitting-isolated-blue-background-cavalier-king-charles-negative-space-insert-your-text-image-concept-movement-animal-rights_155003-33840.jpg',
        title: 'Pet Care In Your Neighbourhood',
        body: 'Connect with 5-star pet caregivers near you who are boarding, walking, house sitting or day care.',
      ),
      OnBoarding(
        image: 'https://img.freepik.com/free-photo/lovely-pet-portrait-isolated_23-2149192301.jpg',
        title: 'Pet Care In Your Neighbourhood',
        body: 'Connect with 5-star pet caregivers near you who are boarding, walking, house sitting or day care.',
      ),
      OnBoarding(
        image: 'https://img.freepik.com/free-photo/amazing-woman-with-long-wavy-hair-kissing-french-bulldog-portrait-ginger-girl-embracing-her-puppy-pink_197531-11037.jpg',
        title: 'Pet Care In Your Neighbourhood',
        body: 'Connect with 5-star pet caregivers near you who are boarding, walking, house sitting or day care.',
      ),
    ];

    Widget boarding(OnBoarding model) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image(
            image: NetworkImage(
              model.image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                model.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                model.body,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
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
              dotWidth: 15.0,
              dotHeight: 5.0,
              paintStyle: PaintingStyle.stroke,
              strokeWidth: 1.5,
              dotColor: Color(0x2F505050),
              activeDotColor: Colors.blue,
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TextButton(
              onPressed: () {},
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
