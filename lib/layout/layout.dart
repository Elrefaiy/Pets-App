import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';
import 'package:pets_application/modules/map_screen.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppCubit.get(context).currentIndex != 3
              ? AppBar(
                  titleSpacing: 20,
                  title: Text(
                    AppCubit.get(context)
                        .title[AppCubit.get(context).currentIndex],
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.bell,
                        size: 22,
                      ),
                    ),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://www.bentbusinessmarketing.com/wp-content/uploads/2013/02/35844588650_3ebd4096b1_b-1024x683.jpg',
                      ),
                      radius: 18,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                )
              : null,
          body: SafeArea(
            child: AppCubit.get(context)
                .layoutScreens[AppCubit.get(context).currentIndex],
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
                      onTap: () {
                        AppCubit.get(context).changeCurrentIndex(0);
                        AppCubit.get(context).getPetsData();
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.house,
                            color: AppCubit.get(context).currentIndex == 0
                                ? const Color(0xffdc4753)
                                : Colors.blueGrey[200],
                            size: 20,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Home',
                            style: AppCubit.get(context).currentIndex == 0
                                ? const TextStyle(
                                    color: Color(0xffdc4753),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                  )
                                : TextStyle(
                                    color: Colors.blueGrey[200],
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
                      onTap: () {
                        AppCubit.get(context).changeCurrentIndex(1);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.solidHeart,
                            color: AppCubit.get(context).currentIndex == 1
                                ? const Color(0xffdc4753)
                                : Colors.blueGrey[200],
                            size: 20,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Saved',
                            style: AppCubit.get(context).currentIndex == 1
                                ? const TextStyle(
                              color: Color(0xffdc4753),
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            )
                                : TextStyle(
                              color: Colors.blueGrey[200],
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
                      onTap: () {
                        AppCubit.get(context).changeCurrentIndex(2);
                        AppCubit.get(context).getFoodsData();
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.bone,
                            color: AppCubit.get(context).currentIndex == 2
                                ? const Color(0xffdc4753)
                                : Colors.blueGrey[200],
                            size: 20,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Foods',
                            style: AppCubit.get(context).currentIndex == 2
                                ? const TextStyle(
                              color: Color(0xffdc4753),
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            )
                                : TextStyle(
                              color: Colors.blueGrey[200],
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
                      onTap: () {
                        AppCubit.get(context).changeCurrentIndex(3);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.solidUser,
                            color: AppCubit.get(context).currentIndex == 3
                                ? const Color(0xffdc4753)
                                : Colors.blueGrey[200],
                            size: 20,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Profile',
                            style: AppCubit.get(context).currentIndex == 3
                                ? const TextStyle(
                              color: Color(0xffdc4753),
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            )
                                : TextStyle(
                              color: Colors.blueGrey[200],
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MapScreen(),
                ),
              );
            },
            backgroundColor: Color(0xff1e4558),
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
