import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
        trafficEnabled: false,
        markers: {
          Marker(
            markerId: const MarkerId('Origin'),
            infoWindow: const InfoWindow(
              title: 'Origin',
              snippet: 'AAAAAA',
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            alpha: .8,
            position: const LatLng(30.04600767967174, 31.234485916793346),
          ),
          Marker(
            markerId: const MarkerId('Destination'),
            infoWindow: const InfoWindow(
              title: 'Origin',
              snippet: 'AAAAAA',
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
            alpha: .8,
            position: const LatLng(30.062669137820645, 31.24409861862659),
            onTap: (){
              showDialog(
                context: context,
                builder: ((context) => Column(
                  children: const [
                    Spacer(),
                    SimpleDialog(
                      children: [
                        Text('aaaaa'),
                        Text('aaaaa'),
                      ],
                    ),
                    SizedBox(height: 100,),
                  ],
                )),
              );
            }
          ),
        },
        onTap: (l){
          print(l.toString());
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
