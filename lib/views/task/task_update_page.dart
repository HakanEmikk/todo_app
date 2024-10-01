import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                controller: controller.explanationController,
              ),
              const SizedBox(
                height: 100,
              ),
              MyTextFormField(
                label: 'katagori',
                obscureText: false,
                controller: controller.categoryController,
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  const Text('Tamamlandı mı :'),
                  Checkbox(
                    value: result,
                    onChanged: (bool? Value) {
                      setState(() {
                        controller.taskList[controller.index!].status =
                            Value.toString();
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
        ),
      ),
    );
  }
}
