import 'package:flutter/material.dart';
import 'package:todo_app/views/login/login_page.dart';
import 'package:get/get.dart';
import 'package:todo_app/views/register/register_page.dart';

import 'views/home/home_page.dart';
import 'views/profil/profil_update_page.dart';
import 'views/task/task_add_page.dart';
import 'views/task/task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/login_page',
          page: () => const LoginPage(),
        ),
        GetPage(
          name: '/register_page',
          page: () => const RegisterPage(),
        ),
        GetPage(
          name: '/profil_update',
          page: () => const ProfilUpdatePage(),
        ),
        GetPage(
          name: '/task_page',
          page: () => TaskPage(),
        ),
        GetPage(
          name: '/task_add_page',
          page: () => TaskAddPage(),
        )
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
