import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/task_controller.dart';

class TaskPage extends StatelessWidget {
  TaskPage({super.key});
  final TaskController controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.isLoading.value
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: controller.taskList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  splashColor: controller.taskList[index].status!
                      ? Colors.green
                      : Colors.red,
                  title: Text(controller.taskList[index].explanation!),
                  subtitle: Text(controller.taskList[index].category!),
                );
              }),
    );
  }
}
