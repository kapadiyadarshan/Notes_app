import 'package:final_exam/controller/likeNotes_controller.dart';
import 'package:final_exam/models/note_model.dart';
import 'package:final_exam/utils/color_utils.dart';
import 'package:final_exam/utils/route_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../helpers/fb_helper.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    LikeNoteController likeNoteController = Get.find<LikeNoteController>();

    NoteModal note = ModalRoute.of(context)?.settings.arguments as NoteModal;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Note",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${note.dateTime}  |  ${note.note.length}",
              style: const TextStyle(
                color: Colors.white38,
              ),
            ),
            const Divider(
              color: Colors.white12,
            ),
            Text(
              note.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: MyColor.theme1,
              ),
            ),
            const Gap(18),
            Text(
              note.note,
              style: TextStyle(
                color: MyColor.theme1,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: MyColor.theme4,
        unselectedItemColor: MyColor.theme1,
        fixedColor: MyColor.theme1,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  MyRoutes.addNotePage,
                  arguments: note,
                );

                // NoteModal noteModal = NoteModal(
                //   id: note.id,
                //   note: "New Note 123",
                //   title: note.title,
                //   dateTime: DateTime.now().toString(),
                // );
                //
                // FbHelper.fbHelper.updateNotes(noteModal: noteModal);
              },
              icon: const Icon(Icons.edit),
            ),
            label: "Edit",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                FbHelper.fbHelper.deleteNotes(id: note.id.toString());
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete),
            ),
            label: "Delete",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                likeNoteController.insertData(noteModal: note);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Likes"),
                  ),
                );
              },
              icon: const Icon(CupertinoIcons.heart),
            ),
            label: "Like",
          ),
        ],
      ),
      backgroundColor: MyColor.theme4,
    );
  }
}
