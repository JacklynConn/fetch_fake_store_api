class NoteModel{
  int ? id;
  final String title;
  final String content;
  final String createDate;

  NoteModel({this.id, required this.title, required this.content, required this.createDate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createDate': createDate,
    };
  }
}