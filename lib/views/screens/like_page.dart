import 'package:final_exam/helpers/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../controller/likeNotes_controller.dart';
import '../../helpers/fb_helper.dart';
import '../../models/note_model.dart';
import '../../utils/color_utils.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    LikeNoteController likeNoteController = Get.find<LikeNoteController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Like Notes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColor.theme4,
        foregroundColor: MyColor.theme1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(
          () => ListView.builder(
            itemCount: likeNoteController.likeNotes.length,
            itemBuilder: (context, index) {
              NoteModal note = likeNoteController.likeNotes[index];

              return Card(
                color: MyColor.theme2,
                child: ListTile(
                  title: Text(
                    note.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: MyColor.theme1,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.note,
                        style: TextStyle(
                          color: MyColor.theme1,
                        ),
                      ),
                      const Gap(24),
                      Text(
                        note.dateTime,
                        style: const TextStyle(
                          color: Colors.white38,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      likeNoteController.deleteData(id: note.id);
                    },
                    icon: Icon(
                      CupertinoIcons.heart_fill,
                      color: MyColor.theme1,
                    ),
                  ),
                  tileColor: MyColor.theme2,
                ),
              );
            },
          ),
        ),
      ),
      backgroundColor: MyColor.theme4,
    );
  }
}
