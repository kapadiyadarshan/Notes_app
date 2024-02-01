import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/models/note_model.dart';

class FbHelper {
  FbHelper._();
  static final FbHelper fbHelper = FbHelper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String collectionPath = "NotesData";

  addNotes({required NoteModal noteModal}) async {
    await firestore
        .collection(collectionPath)
        .doc(noteModal.id.toString())
        .set(noteModal.toMap);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    return firestore.collection(collectionPath).snapshots();
  }

  deleteNotes({required String id}) async {
    await firestore.collection(collectionPath).doc(id).delete();
  }

  updateNotes({required NoteModal noteModal}) async {
    await firestore
        .collection(collectionPath)
        .doc(noteModal.id.toString())
        .update(noteModal.toMap);
  }
}
