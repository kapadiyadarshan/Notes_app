import 'package:final_exam/helpers/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../controller/likeNotes_controller.dart';
import '../../models/note_model.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    LikeNoteController likeNoteController = Get.find<LikeNoteController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Like Notes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(
          () => ListView.builder(
            itemCount: likeNoteController.likeNotes.length,
            itemBuilder: (context, index) {
              NoteModal note = likeNoteController.likeNotes.value[index];

              return Card(
                child: ListTile(
                  title: Text(
                    note.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(note.note),
                      const Gap(24),
                      Text(note.dateTime),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      DbHelper.dbHelper.deleteData(id: note.id);
                    },
                    icon: const Icon(CupertinoIcons.heart_solid),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
