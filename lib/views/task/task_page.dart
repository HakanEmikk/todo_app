import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/category_model.dart';
import '../../repositories/task_repository.dart';
import 'controller/task_controller.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

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
    super.initState();
    controller.fetchTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Görevler'),
        centerTitle: true,
        leading: IconButton(
            onPressed: controller.profileUpdateOnPressed,
            icon: const Icon(Icons.person)),
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
                    final int id = controller.taskList[index].categoryId!;
                    final String name = controller.categoryList
                        .firstWhere(
                          (CategoryModel element) =>
                              element.id ==
                              id, // Kategori ID'sini kontrol ediyoruz
                          orElse: () =>
                              CategoryModel(id: 0, catergoryName: 'Bulunamadı'),
                        )
                        .catergoryName!; // Kategori adı yoksa varsayılan değer
                    return Center(
                      child: ListTile(
                        tileColor: result! ? Colors.green : Colors.red,
                        title: Text(
                          ' Açıklama: ${controller.taskList[index].explation!}',
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          'katagori: $name',
                          textAlign: TextAlign.center,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text(
                              'Tamamlandı mı :',
                              style: TextStyle(color: Colors.white),
                            ),
                            Checkbox(
                              value: controller.taskList[index].status!
                                      .toLowerCase() ==
                                  'true',
                              onChanged: (bool? value) async {
                                setState(() {
                                  controller.taskList[index].status =
                                      value.toString();
                                });

                                await TaskRepository()
                                    .update(controller.taskList[index]);
                                controller.fetchTaskList();
                              },
                            ),
                            TextButton(
                              onPressed: () =>
                                  controller.pickMultipleFiles(index),
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
