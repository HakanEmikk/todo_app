import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../login/controllers/login_controller.dart';

class ProfilInfoPage extends StatefulWidget {
  const ProfilInfoPage({super.key});

  @override
  State<ProfilInfoPage> createState() => _ProfilInfoPageState();
}

class _ProfilInfoPageState extends State<ProfilInfoPage> {
  @override
  LoginController controller = Get.put(LoginController());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Profil',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(400),
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3)),
              child: Text(
                'hakan',
                style: TextStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
