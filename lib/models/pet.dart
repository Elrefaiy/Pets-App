class PetModel {
  late String type;
  late String name;
  late String height;
  late String weight;
  late String about;
  late String price;
  late String gender;
  late String address;
  late String category;
  late String color;
  late List<String> behavior;
  late String petFor;
  late String age;
  late String ownerName;
  late int ownerId;
  late String ownerImage;
  late String image;
  late int reviews;
  late double rate;
  late String id;

  PetModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    name = json['name'];
    height = json['height'];
    weight = json['weight'];
    about = json['about'];
    price = json['price'];
    gender = json['gender'];
    address = json['address'];
    category = json['category'];
    color = json['color'];
    behavior = json['behavior'];
    petFor = json['petFor'];
    age = json['age'];
    ownerName = json['ownerName'];
    ownerId = json['ownerId'];
    ownerImage = json['ownerImage'];
    image = json['image'];
    reviews = json['reviews'];
    rate = json['rate'];
    id = json['id'];
  }

}