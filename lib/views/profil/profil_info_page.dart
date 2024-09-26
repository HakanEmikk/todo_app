import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../login/controllers/login_controller.dart';
import 'controller/profile_controller.dart';

class ProfilInfoPage extends StatefulWidget {
  const ProfilInfoPage({super.key});

  @override
  State<ProfilInfoPage> createState() => _ProfilInfoPageState();
}

class _ProfilInfoPageState extends State<ProfilInfoPage> {
  LoginController controller = Get.put(LoginController());
  ProfileController profileController = Get.put(ProfileController());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Profil',
          style: TextStyle(fontSize: 50),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'ad soyad: ${controller.user.name}  ${controller.user.surname}'),
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'mail: ${controller.user.mail}',
                ),
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('kullanıcı adı: ${controller.user.nickname}'),
              ),
            ),
            const SizedBox(
              height: 75,
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: profileController.profileInfoUpdateOnPressed,
                child: const Text('güncelleme',
                    style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
