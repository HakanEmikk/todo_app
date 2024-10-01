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
  bool? result;
  bool? isChecked;
  bool? listTileIsChecked;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Görevler'),
        centerTitle: true,
        leading: IconButton(
            onPressed: controller.profileUpdateOnPressed,
            icon: Icon(Icons.person)),
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: ListView.builder(
                  itemCount: controller.taskList.length,
                  itemBuilder: (BuildContext context, int index) {
                    result =
                        (controller.taskList[index].status!.toLowerCase() ==
                            'true');

                    return Center(
                      child: ListTile(
                        tileColor: result! ? Colors.green : Colors.red,
                        title: Text(
                          ' Açıklama: ${controller.taskList[index].explation!}',
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          'katagori: ${controller.taskList[index].category!}',
                          textAlign: TextAlign.center,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: controller.pickMultipleFiles,
                              child: const Text(
                                'Dosya ekle',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              onPressed: () =>
                                  controller.updatePageNavigator(index),
                              child: const Text('Güncelle',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                        leading: IconButton(
                            onPressed: () =>
                                controller.taskDeleteOnPressed(index),
                            icon: const Icon(Icons.clear)),
                      ),
                    );
                  }),
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.taskAddOnPressed,
        child: Icon(Icons.add),
      ),
    );
  }
}
