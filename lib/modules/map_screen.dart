import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pets_application/shared/components/components.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

   static const _initialCameraPosition = CameraPosition(
    target: LatLng(30.04600767967174, 31.234485916793346),
    zoom: 11.5,
  );

   late GoogleMapController _googleMapController;

   @override
   void dispose() {
     _googleMapController.dispose();
     super.dispose();
   }

  @override
  Widget build(BuildContext context) {
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
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller)=> _googleMapController = controller,
        onTap: (l){
          print(l.toString());
        },
        trafficEnabled: false,
        markers: {
          markerItem(
            context: context,
            id: '1',
            lat: 30.062669137820645,
            lng: 31.24409861862659,
            color: 200,
          ),
          markerItem(
            context: context,
            id: '2',
            lat: 30.101671585959625,
            lng: 31.281610317528244,
            color: 120,
          ),
          markerItem(
            context: context,
            id: '3',
            lat: 30.030910002798098,
            lng: 31.25740472227335,
            color: 60,
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition),
          );
        },
        child: const Icon(Icons.my_location_sharp),
      ),
    );
  }

}
