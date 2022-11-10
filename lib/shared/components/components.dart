import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/modules/pet_screen.dart';

Widget petItem({
  required context,
  required id,
  required image,
  required petFor,
  required name,
  required address,
  required favourite,
}) => Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.grey.withOpacity(.4)),
  ),
  child: GestureDetector(
    onTap: (){
      AppCubit.get(context).getPetItem(id);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => PetScreen(myPet: AppCubit.get(context).myPet)),
        ),
      );
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            Container(
              width: 33,
              height: 33,
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.favorite,
                  color: favourite ? Colors.redAccent : Colors.grey[350],
                  size: 18,
                ),

              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 9,),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
              petFor,
            style: const TextStyle(
                fontSize: 12,
                color: Colors.blue,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,),
          child: Text(
            name,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5,),
          child: Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: 18,
              ),
              Text(
                address,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);

Marker markerItem({
    required context,
    required String id,
    required double lat,
    required double lng,
    required double color,
})=> Marker(
    markerId: MarkerId(id),
    infoWindow: const InfoWindow(
      title: 'Lina Amane',
      snippet: '1,2 km away from you',
    ),
    icon: BitmapDescriptor.defaultMarkerWithHue(color),
    alpha: .8,
    position: LatLng(lat, lng),
    onTap: (){
      showDialog(
        context: context,
        builder: ((context) => Column(
          children: [
            const Spacer(),
            SimpleDialog(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              children: [
                Row(
                  children: [
                    const Text(
                      ' Lina Amane ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Icon(
                      Icons.verified,
                      color: Colors.lightGreen,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: (){},
                      icon: const FaIcon(
                        FontAwesomeIcons.heart,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                    ),
                    Text(
                      ' 1,2 km away from you',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const SizedBox(width: 10,),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[600],
                    ),
                    const Text(
                      ' 4,9',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    const Text(
                      '20 reviews',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      '\$ 20',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(width: 15,),
                  ],
                ),
                const SizedBox(height: 15,),
              ],
            ),
            const SizedBox(height: 170,),
          ],
        )),
      );
    }
);

Widget foodItem({
  required image,
  required name,
  required about,
  required reviews,
  required price,
}) => Container(
  width: double.infinity,
  height: 140,
  decoration: BoxDecoration(
    color: Colors.grey.withOpacity(.06),
    border: Border.all(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Row(
    children: [
      Container(
        height: 130,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          image: DecorationImage(
            image: NetworkImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(width: 15,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 5,),
            Text(
              about,
              style: const TextStyle(
                fontSize: 16,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow[700],
                  size: 20,
                ),
                Text('  $reviews'),
                const Spacer(),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
      const SizedBox(width: 10,),
    ],
  ),

);