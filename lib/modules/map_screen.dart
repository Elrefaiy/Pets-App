import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';
import 'package:pets_application/shared/components/components.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Location location = Location();
  static const initialCameraPosition = CameraPosition(
    target: LatLng(
      30.053462065549184,
      31.261562146246433,
    ),
    zoom: 17,
  );

  late GoogleMapController googleMapController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List pets = AppCubit.get(context).pets;
    Set<Marker> markers = AppCubit.get(context).markers;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Pet Caregivers',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.showBottomSheet(
                    (context) => Container(
                      height: 250,
                      color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                          Expanded(
                            child: ListView.separated(
                              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0,),
                              itemBuilder: (context, index)=> caregiver(
                                context: context,
                                image: AppCubit.get(context).petsCaregivers[index]['image'],
                                name: AppCubit.get(context).petsCaregivers[index]['name'],
                                address: AppCubit.get(context).petsCaregivers[index]['address'],
                                id: index,
                              ),
                              separatorBuilder: (context, index)=> Container(
                                height: 1,
                                color: Colors.blueGrey.withOpacity(.4),
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                              ),
                              itemCount: AppCubit.get(context).petsCaregivers.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.list_alt),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
          body: GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition: initialCameraPosition,
            mapType: MapType.normal,
            onMapCreated: (controller) async {
              googleMapController = controller;
              for (var element in pets) {
                markers.add(
                  Marker(
                    markerId: MarkerId(element['id']),
                    infoWindow: InfoWindow(
                      title: element['ownerName'],
                      snippet: '1,2 km away from you',
                    ),
                    icon: await MarkerIcon.downloadResizePictureCircle(
                      element['ownerImage'],
                      size: 150,
                      addBorder: true,
                      borderColor: Colors.white,
                      borderSize: 15,
                    ),
                    position: LatLng(
                      element['latitude'],
                      element['longitude'],
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SimpleDialog(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Image(
                                        image: NetworkImage(
                                          element['ownerImage'],
                                        ),
                                        fit: BoxFit.cover,
                                        height: 120,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: Image(
                                        image: NetworkImage(
                                          element['image'],
                                        ),
                                        fit: BoxFit.cover,
                                        height: 120,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      element['ownerName'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey[700],
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.verified,
                                      color: Colors.lightGreen,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '  the owner of : ${element['name']}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow[600],
                                    ),
                                    Text(
                                      ' ${element['rate']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '${element['reviews']} reviews',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      element['price'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xffdc4753),
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
                setState(() {});
              }
            },
            markers: AppCubit.get(context).markers,
          ),
        );
      },
    );
  }
}
