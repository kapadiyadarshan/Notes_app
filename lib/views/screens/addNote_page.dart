import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../helpers/fb_helper.dart';
import '../../models/note_model.dart';
import '../../utils/color_utils.dart';

class AddNotePage extends StatelessWidget {
  AddNotePage({super.key});

  String title = "";
  String note = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Note",
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
          children: [
            TextFormField(
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                isDense: true,
                hintText: "Title",
                hintStyle: TextStyle(color: Colors.white38),
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
              onChanged: (value) {
                title = value;
              },
            ),
            const Gap(12),
            TextFormField(
              maxLines: 10,
              minLines: 1,
              style: const TextStyle(
                color: Colors.white54,
              ),
              decoration: const InputDecoration(
                isDense: true,
                hintText: "Notes",
                hintStyle: TextStyle(color: Colors.white38),
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
              onChanged: (value) {
                note = value;
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: MyColor.theme3,
        foregroundColor: MyColor.theme4,
        onPressed: () {
          NoteModal noteModal = NoteModal(
            id: DateTime.now().millisecondsSinceEpoch,
            note: note,
            title: title,
            dateTime: DateTime.now().toString(),
          );

          FbHelper.fbHelper.addNotes(noteModal: noteModal);

          Navigator.pop(context);
        },
        label: const Text("Save"),
      ),
      backgroundColor: MyColor.theme4,
    );
  }
}
