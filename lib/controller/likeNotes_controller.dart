import 'package:final_exam/models/note_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../helpers/db_helper.dart';

class LikeNoteController extends GetxController {
  RxList likeNotes = [].obs;
  Logger logger = Logger();

  LikeNoteController() {
    initData();
  }

  void initData() async {
    likeNotes(await DbHelper.dbHelper.getAllData());
  }

  insertData({required NoteModal noteModal}) async {
    await DbHelper.dbHelper
        .insertData(noteModal: noteModal)
        .then((value) => initData());
  }

  deleteData({required int id}) async {
    await DbHelper.dbHelper.deleteData(id: id).then(
          (value) => initData(),
        );
  }
}
