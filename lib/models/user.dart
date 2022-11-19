class UserModel{
  late String name;
  late String nickname;
  late String email;
  late String phone;
  late String address;
  late String about;
  late String image;
  late bool isGuest;

  UserModel({
    required this.name,
    required this.nickname,
    required this.email,
    required this.phone,
    required this.address,
    required this.about,
    required this.image,
    required this.isGuest,
  });

  UserModel.fromJson(json){
    name = json['name'];
    nickname = json['nickname'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    about = json['about'];
    image = json['image'];
    isGuest = json['isGuest'];
    }

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'nickname' : nickname,
      'email' : email,
      'phone' : phone,
      'address' : address,
      'about' : about,
      'image' : image,
      'isGuest' : isGuest,
    };
  }

}