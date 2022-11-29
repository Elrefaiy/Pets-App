import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_application/cubit/app_cubit.dart';
import 'package:pets_application/cubit/app_status.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var nicknameController = TextEditingController();
    var aboutController = TextEditingController();
    var phoneController = TextEditingController();
    var addressController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        nameController.text = AppCubit.get(context).userModel.name;
        nicknameController.text = AppCubit.get(context).userModel.nickname;
        aboutController.text = AppCubit.get(context).userModel.about;
        phoneController.text = AppCubit.get(context).userModel.phone;
        addressController.text = AppCubit.get(context).userModel.address;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.blueGrey[700],
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppCubit.get(context).getProfilePic();
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          shape: BoxShape.circle,
                        ),
                        child: AppCubit.get(context).profileImage.path == ''
                            ? const ClipOval(
                              child: Image(
                                image: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                                ),
                          fit: BoxFit.cover,
                        ),
                            )
                            : ClipOval(
                              child: Image(
                                image: FileImage(
                                  AppCubit.get(context).profileImage,
                                ),
                          fit: BoxFit.cover,
                              ),
                            ),
                      ),
                    ),
                    if(state is GetProfilePicSuccessState || state is UploadProfilePicLoadingState)
                      CircleAvatar(
                        child: ConditionalBuilder(
                          condition: state is! UploadProfilePicLoadingState,
                          builder: (context)=> IconButton(
                            icon: const Icon(Icons.done),
                            onPressed: () {
                              AppCubit.get(context).uploadProfilePic(
                                name: nameController.text,
                                nickname: nicknameController.text,
                                about: aboutController.text,
                                phone: phoneController.text,
                                address: addressController.text,
                              );
                            },
                          ),
                          fallback: (context)=> const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blueGrey.withOpacity(.4),
                    ),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(
                          color: Color(0xff1e4558),
                          fontSize: 16,
                        ),
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText: 'User Name',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Color(0xff1e4558),
                          fontSize: 16,
                        ),
                        controller: nicknameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText: 'Nickname',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Color(0xff1e4558),
                          fontSize: 16,
                        ),
                        controller: aboutController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText: 'About Me',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Color(0xff1e4558),
                          fontSize: 16,
                        ),
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText: 'Phone',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Color(0xff1e4558),
                          fontSize: 16,
                        ),
                        controller: addressController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          hintText: 'Address',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.blueGrey.withOpacity(.4),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      AppCubit.get(context).updateUser(
                        name: nameController.text,
                        nickname: nicknameController.text,
                        about: aboutController.text,
                        phone: phoneController.text,
                        address: addressController.text,
                      );
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
