import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/shared/components/components.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  Location location = Location();

  static const initialCameraPosition = CameraPosition(
    target: LatLng(
      30.439782815266412,
      30.966845713555813,
    ),
    zoom: 16.8,
  );

   late GoogleMapController googleMapController;

   @override
   void dispose() {
     googleMapController.dispose();
     super.dispose();
   }

   @override
  Widget build(BuildContext context) {

     List pets = AppCubit.get(context).pets;

     Set<Marker> markers = pets.map((element) => markerItem(
       context: context,
       id: element['id'],
       lat: element['latitude'],
       lng: element['longitude'],
       color: element['markerColor'],
       petImage: element['image'],
       ownerImage: element['ownerImage'],
       ownerName: element['ownerName'],
       rate: element['rate'],
       reviews: element['reviews'],
       price: element['price'],
     )).toSet();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pet Caregivers',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.list_alt),
          ),
          const SizedBox(width: 8,),
        ],
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        buildingsEnabled: false,
        polylines: {
          const Polyline (
              polylineId: PolylineId('1'),
              visible: true,
              points: [
                LatLng(30.436367772624280, 30.9570687264220,),
              ],
              width: 4,
              color: Colors.red,
              startCap: Cap.roundCap,
              endCap: Cap.buttCap
          ),
        },
        initialCameraPosition: initialCameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller){
          googleMapController = controller;
          },
        onTap: (l){
          print(l.toString());
        },
        trafficEnabled: false,
        markers: markers,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     googleMapController.animateCamera(
      //       CameraUpdate.newCameraPosition(initialCameraPosition),
      //     );
      //   },
      //   child: const Icon(Icons.my_location_sharp),
      // ),
    );
  }

}
