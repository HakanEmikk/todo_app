import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/my_button.dart';
import '../widgets/my_text_form_field.dart';
import 'controller/category_controller.dart';

class CategoryAddPage extends StatefulWidget {
  const CategoryAddPage({super.key});

  @override
  State<CategoryAddPage> createState() => _CategoryAddPageState();
}

class _CategoryAddPageState extends State<CategoryAddPage> {
  CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'kategori ekle',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 500, right: 500, top: 200),
        child: Form(
          key: controller.categoryKey,
          child: Column(
            children: <Widget>[
              MyTextFormField(
                label: 'katagori',
                obscureText: false,
                controller: controller.categoryNameController,
                validator: controller.categoryNameValidator,
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                  width: 120,
                  height: 50,
                  child: MyButton(
                      onPressed: controller.categoryAddOnPressed,
                      message: 'Ekle')),
            ],
          ),
        ),
      ),
    );
  }
}
