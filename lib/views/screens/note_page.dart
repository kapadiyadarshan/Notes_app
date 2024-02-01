import 'package:final_exam/controller/likeNotes_controller.dart';
import 'package:final_exam/models/note_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    LikeNoteController likeNoteController = Get.find<LikeNoteController>();

    NoteModal noteModal =
        ModalRoute.of(context)?.settings.arguments as NoteModal;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              likeNoteController.insertData(noteModal: noteModal);
            },
            icon: const Icon(
              CupertinoIcons.heart,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noteModal.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(18),
            Text(noteModal.note),
          ],
        ),
      ),
    );
  }
}
