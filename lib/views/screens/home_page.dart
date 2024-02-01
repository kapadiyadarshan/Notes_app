import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/helpers/fb_helper.dart';
import 'package:final_exam/models/note_model.dart';
import 'package:final_exam/utils/route_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.likePage);
            },
            icon: const Icon(
              CupertinoIcons.heart,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: StreamBuilder(
          stream: FbHelper.fbHelper.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              QuerySnapshot<Map<String, dynamic>>? snaps = snapshot.data;

              List<QueryDocumentSnapshot> data = snaps?.docs ?? [];

              List<NoteModal> allNotes = data
                  .map(
                    (e) => NoteModal.fromMap(
                      data: e.data() as Map,
                    ),
                  )
                  .toList();

              return ListView.builder(
                itemCount: allNotes.length,
                itemBuilder: (context, index) {
                  NoteModal note = allNotes[index];

                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          MyRoutes.notePage,
                          arguments: note,
                        );
                      },
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
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                NoteModal noteModal = NoteModal(
                                  id: note.id,
                                  note: "New Note",
                                  title: note.title,
                                  dateTime: DateTime.now().toString(),
                                );

                                FbHelper.fbHelper.updateNotes(noteModal: note);
                              },
                              icon: const Icon(
                                Icons.edit,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                FbHelper.fbHelper
                                    .deleteNotes(id: note.id.toString());
                              },
                              icon: const Icon(
                                Icons.delete,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.addNotePage);
        },
        label: const Text("Add Note"),
      ),
    );
  }
}
