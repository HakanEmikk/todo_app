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
            children: <Widget>[
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
                  Obx(
                    () => DropdownButton<String>(
                      hint: const Text('Kategori seçin'),
                      value: controller.selectedCategory!.value.isNotEmpty
                          ? controller.selectedCategory!.value
                          : null, // Seçilen kategori
                      items:
                          controller.categoryList.map((CategoryModel category) {
                        return DropdownMenuItem<String>(
                          value: category.id.toString(),
                          child: Text(category
                              .catergoryName!), // Düzeltme: categoryName
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Seçilen kategori güncelleniyor
                        controller.selectedCategory!.value = newValue!;
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: controller.categoryAddOnPressed,
                    child: const Text('Katagori ekle'),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              // ElevatedButton(
              //     onPressed: controller.pickMultipleFiles,
              //     child: Text('Dosya seç')),
              const SizedBox(
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
