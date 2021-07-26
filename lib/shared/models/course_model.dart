class Course {
  final String title;

  const Course({
    required this.title,
  });

  static Course fromJson(Map<String, dynamic> json) => Course(
        title: json['title'],
      );
}

// class UserApi {
  
//       final List users = json.decode(response.body);

//       return users.map((json) => User.fromJson(json)).where((user) {
//         final nameLower = user.name.toLowerCase();
//         final queryLower = query.toLowerCase();

//         return nameLower.contains(queryLower);
//       }).toList();
    
// }

