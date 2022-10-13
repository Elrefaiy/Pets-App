import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: AppCubit.get(context).layoutScreens[AppCubit.get(context).currentIndex],
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 15,
            shape: const CircularNotchedRectangle(),
            notchMargin: 7,
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        AppCubit.get(context).changeCurrentIndex(0);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.house,
                            color: AppCubit.get(context).currentIndex == 0
                                ? Colors.blue
                                : Colors.grey[400],
                            size: 20,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Home',
                            style: AppCubit.get(context).currentIndex == 0 ? const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ) : const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        AppCubit.get(context).changeCurrentIndex(1);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.solidHeart,
                            color: AppCubit.get(context).currentIndex == 1
                                ? Colors.blue
                                : Colors.grey[400],
                            size: 20,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Saved',
                            style: AppCubit.get(context).currentIndex == 1 ? const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ) : const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        AppCubit.get(context).changeCurrentIndex(2);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: AppCubit.get(context).currentIndex == 2
                                ? Colors.blue
                                : Colors.grey[400],
                            size: 20,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Search',
                            style: AppCubit.get(context).currentIndex == 2 ? const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ) : const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        AppCubit.get(context).changeCurrentIndex(3);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.solidUser,
                            color: AppCubit.get(context).currentIndex == 3
                                ? Colors.blue
                                : Colors.grey[400],
                            size: 20,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Profile',
                            style: AppCubit.get(context).currentIndex == 3 ? const TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ) : const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.location_pin,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
