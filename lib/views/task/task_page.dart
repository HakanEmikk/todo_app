import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/task_controller.dart';

class TaskPage extends StatefulWidget {
  TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TaskController controller = Get.put(TaskController());
  @override
  void initState() {
    super.initState();
    controller.fetchTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: ListView.builder(
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
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.taskAddOnPressed,
        child: Icon(Icons.add),
      ),
    );
  }
}
