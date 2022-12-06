import 'dart:convert';

class Comments {
  final String userId;
  final String comment;
  final String? id;
  Comments({
    required this.userId,
    required this.comment,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'comment': comment,
      'id': id,
    };
  }

  factory Comments.fromMap(Map<String, dynamic> map) {
    return Comments(
      userId: map['userId'] ?? '',
      comment: map['comment']?.toString() ?? "",
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Comments.fromJson(String source) =>
      Comments.fromMap(json.decode(source));
}
