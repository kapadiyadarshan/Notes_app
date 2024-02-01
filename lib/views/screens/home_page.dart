import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/helpers/fb_helper.dart';
import 'package:final_exam/models/note_model.dart';
import 'package:final_exam/utils/color_utils.dart';
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
        title: const Text(
          "All Notes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyColor.theme4,
        foregroundColor: MyColor.theme1,
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

              return allNotes.isEmpty
                  ? Center(
                      child: Text(
                        "No Notes",
                        style: TextStyle(fontSize: 18, color: MyColor.theme1),
                      ),
                    )
                  : ListView.builder(
                      itemCount: allNotes.length,
                      itemBuilder: (context, index) {
                        NoteModal note = allNotes[index];

                        return Card(
                          color: MyColor.theme2,
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
                            tileColor: MyColor.theme2,
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
        backgroundColor: MyColor.theme3,
        foregroundColor: MyColor.theme4,
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.addNotePage);
        },
        label: const Text("Add Note"),
      ),
      backgroundColor: MyColor.theme4,
    );
  }
}
