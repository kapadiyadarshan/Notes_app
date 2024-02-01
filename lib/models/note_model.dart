class NoteModal {
  int id;
  String note;
  String title;
  String dateTime;

  NoteModal({
    required this.id,
    required this.note,
    required this.title,
    required this.dateTime,
  });

  factory NoteModal.fromMap({required Map data}) {
    return NoteModal(
      id: data["id"],
      note: data["note"],
      title: data["title"],
      dateTime: data["dateTime"],
    );
  }

  Map<String, dynamic> get toMap => {
        "id": id,
        "note": note,
        "title": title,
        "dateTime": dateTime,
      };
}
