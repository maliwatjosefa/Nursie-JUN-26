import 'package:firebase_database/firebase_database.dart';

class Post {
  String category;
  String input;
  String dateTime;
  DatabaseReference _id;

  Post(this.category, this.input, this.dateTime);

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'category': this.category,
      'input': this.input,
      'dateTime': this.dateTime,
    };
  }
}

Post createPost(record) {
  Map<String, dynamic> attributes = {
    'category': '',
    'input': '',
    'dateTime': ''
  };

  record.forEach((key, value) => {attributes[key] = value});

  Post post = new Post(
    attributes['category'],
    attributes['input'],
    attributes['dateTime'],
  );

  return post;
}
