class CourseModel {
  final String title;
  final String code;
  final String questionUrl;

  const CourseModel({
    required this.title,
    required this.code,
    required this.questionUrl,
  });

  static CourseModel fromJson(Map<String, dynamic> json) => CourseModel(
      title: json['title'],
      code: json['courseCode'],
      questionUrl: json['question']);
}

// class UserApi {
  
//       final List users = json.decode(response.body);

//       return users.map((json) => User.fromJson(json)).where((user) {
//         final nameLower = user.name.toLowerCase();
//         final queryLower = query.toLowerCase();

//         return nameLower.contains(queryLower);
//       }).toList();
    
// }

