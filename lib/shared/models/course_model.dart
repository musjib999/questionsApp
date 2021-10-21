class Course {
  final String title;
  final String questionUrl;

  const Course({
    required this.title,
    required this.questionUrl,
  });

  static Course fromJson(Map<String, dynamic> json) =>
      Course(title: json['title'], questionUrl: json['question']);
}

// class UserApi {
  
//       final List users = json.decode(response.body);

//       return users.map((json) => User.fromJson(json)).where((user) {
//         final nameLower = user.name.toLowerCase();
//         final queryLower = query.toLowerCase();

//         return nameLower.contains(queryLower);
//       }).toList();
    
// }

