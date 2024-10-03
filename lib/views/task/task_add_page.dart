import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/category_model.dart';
import '../../widgets/my_text_form_field.dart';
import 'controller/task_controller.dart';

class TaskAddPage extends StatefulWidget {
  const TaskAddPage({super.key});

  @override
  State<TaskAddPage> createState() => _TaskAddPageState();
}

class _TaskAddPageState extends State<TaskAddPage> {
  TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 500, right: 500),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              MyTextFormField(
                label: 'açıklama',
                obscureText: false,
                controller: controller.explanationController,
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: <Widget>[
                  Obx(() => DropdownButton<String>(
                        hint: Text('Kategori seçin'),
                        value: controller.selectedCategory, // Seçilen kategori
                        items: controller.categoryList
                            .map((CategoryModel category) {
                          return DropdownMenuItem<String>(
                            value: category.id.toString(),
                            child: Text(category
                                .catergoryName!), // Düzeltme: categoryName
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controller.selectedCategory =
                              newValue; // Seçilen kategori güncelleniyor
                        },
                      )),
                  TextButton(
                    onPressed: controller.categoryAddOnPressed,
                    child: Text('Katagori ekle'),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              // ElevatedButton(
              //     onPressed: controller.pickMultipleFiles,
              //     child: Text('Dosya seç')),
              SizedBox(
                height: 100,
              ),
              TextButton(
                  onPressed: controller.addOnPressed,
                  child: const Text('ekle')),
            ],
          ),
        ),
      ),
    );
  }
}
