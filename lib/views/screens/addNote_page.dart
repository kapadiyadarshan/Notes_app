import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../helpers/fb_helper.dart';
import '../../models/note_model.dart';

class AddNotePage extends StatelessWidget {
  AddNotePage({super.key});

  String title = "";
  String note = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter task...";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                isDense: true,
                hintText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 2,
                  ),
                ),
              ),
              onChanged: (value) {
                title = value;
              },
            ),
            const Gap(12),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter task...";
                } else {
                  return null;
                }
              },
              maxLines: 10,
              minLines: 1,
              decoration: InputDecoration(
                isDense: true,
                hintText: "Notes",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 2,
                  ),
                ),
              ),
              onChanged: (value) {
                note = value;
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                NoteModal noteModal = NoteModal(
                  id: DateTime.now().millisecondsSinceEpoch,
                  note: note,
                  title: title,
                  dateTime: DateTime.now().toString(),
                );

                FbHelper.fbHelper.addNotes(noteModal: noteModal);
              },
              child: const Text("Add Note"),
            ),
          ],
        ),
      ),
    );
  }
}
