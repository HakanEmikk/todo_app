import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/category_model.dart';
import '../../widgets/my_text_form_field.dart';
import 'controller/task_controller.dart';

class TaskUpdatePage extends StatefulWidget {
  const TaskUpdatePage({super.key});

  @override
  State<TaskUpdatePage> createState() => _TaskUpdatePageState();
}

class _TaskUpdatePageState extends State<TaskUpdatePage> {
  TaskController controller = Get.put(TaskController());
  bool? result;
  @override
  Widget build(BuildContext context) {
    setState(() {
      result = (controller.taskList[controller.index!].status!.toLowerCase() ==
          'true');
    });

    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(left: 500, right: 500),
          child: Form(
            key: controller.formKeyUpdate,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 200,
                ),
                MyTextFormField(
                  label: 'açıklama',
                  obscureText: false,
                  hintText: controller.taskList[controller.index!].explation,
                  controller: controller.explanationController,
                ),
                const SizedBox(
                  height: 100,
                ),
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
                        child: Text(
                            category.catergoryName!), // Düzeltme: categoryName
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Seçilen kategori güncelleniyor
                      controller.selectedCategory!.value = newValue!;
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Text('Tamamlandı mı :'),
                    Checkbox(
                      value: result,
                      onChanged: (bool? value) {
                        setState(() {
                          controller.taskList[controller.index!].status =
                              value.toString();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                TextButton(
                    onPressed: () => controller.taskUpdateOnPressed(),
                    child: const Text('Güncelle')),
              ],
            ),
          )),
    );
  }
}
