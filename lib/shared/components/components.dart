import 'package:flutter/material.dart';
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
  required price,
}) => Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: Colors.blueGrey.withOpacity(.4),
    ),
  ),
  child: GestureDetector(
    onTap: (){
      AppCubit.get(context).getPetItem(id);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => PetScreen(
            myPet: AppCubit.get(context).myPet,
          )),
        ),
      );
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
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
                    color: favourite
                        ? Colors.redAccent
                        : Colors.blueGrey[200],
                    size: 18,
                  ),

                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 9,),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: petFor == 'Selling'
                    ? Colors.blueGrey.withOpacity(.2)
                    : Colors.orange.withOpacity(.3),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                  petFor,
                style: TextStyle(
                    fontSize: 13,
                    color: petFor == 'Selling'
                        ? Colors.blueGrey[700]
                        : Colors.orange[700],
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Text(
              price,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: petFor == 'Adoption'
                    ? Colors.blueGrey[200]
                    : const Color(0xcddc4753),
                decoration: petFor == 'Adoption'
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            const SizedBox(width: 10,),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 19,
                color: Colors.blueGrey[700],
                fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5,),
          child: Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.blueGrey,
                size: 18,
              ),
              Expanded(
                child: Text(
                  address,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5,),
      ],
    ),
  ),
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
    color: Colors.white,
    border: Border.all(
      color: Colors.blueGrey.withOpacity(.4),
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Row(
    children: [
      Container(
        height: 140,
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
      Container(
        color: Colors.blueGrey.withOpacity(.4),
        width: 1,
      ),
      const SizedBox(width: 10,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[700],
                fontSize: 18,
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 5,),
            Text(
              about,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.blueGrey,
              ),
              maxLines: 4,
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
                Text(
                  '  $reviews',
                  style: const TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
                const Spacer(),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Color(0xffdc4753),
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

Marker markerItem({
  required context,
  required id,
  required lat,
  required lng,
  required markerIcon,
  required petImage,
  required petName,
  required ownerName,
  required ownerImage,
  required rate,
  required reviews,
  required price,
}) => Marker(
    markerId: MarkerId(id),
    infoWindow: InfoWindow(
      title: ownerName,
      snippet: '1,2 km away from you',
    ),
    icon: markerIcon,
    position: LatLng(
      lat,
      lng,
    ),
    onTap: (){
      showDialog(
        context: context,
        builder: ((context) => Column(
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
                          ownerImage,
                        ),
                        fit: BoxFit.cover,
                        height: 120,
                      ),
                    ),
                    const SizedBox(width: 12,),
                    Expanded(
                      child: Image(
                        image: NetworkImage(
                          petImage,
                        ),
                        fit: BoxFit.cover,
                        height: 120,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const SizedBox(width: 5,),
                    Text(
                      ownerName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[700],
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    const Icon(
                      Icons.verified,
                      color: Colors.lightGreen,
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Text(
                  '  the owner of : $petName',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[600],
                    ),
                    Text(
                      ' $rate',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Text(
                      '$reviews reviews',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      price,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color(0xffdc4753),
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(width: 5,),
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            ),
            const SizedBox(height: 15,),
          ],
        )),
      );
    }
);