import 'package:flutter/material.dart';
import 'package:pets_application/modules/register_screen.dart';
import 'package:pets_application/shared/network/local/cache_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: (){
            CacheHelper.removeData(key: 'token');
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => const RegisterScreen())), (route) => false);
          },
          child: const Text(
            'Log Out',
            textScaleFactor: 1.4,
          ),
        ),
      ],
    );
  }
}
