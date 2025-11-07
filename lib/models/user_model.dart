class UserModel {
  final String fullName;
  final String email;
  final String career;
  final String semester;
  final String university;
  final String location;
  final String? photoUrl;
  final String? bio;

  UserModel({
    required this.fullName,
    required this.email,
    required this.career,
    required this.semester,
    required this.university,
    required this.location,
    this.photoUrl,
    this.bio,
  });

  // Factory constructor para crear desde JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      career: json['career'] ?? '',
      semester: json['semester'] ?? '',
      university: json['university'] ?? '',
      location: json['location'] ?? '',
      photoUrl: json['photoUrl'],
      bio: json['bio'],
    );
  }

  // Convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'career': career,
      'semester': semester,
      'university': university,
      'location': location,
      'photoUrl': photoUrl,
      'bio': bio,
    };
  }

  // Copiar con modificaciones
  UserModel copyWith({
    String? fullName,
    String? email,
    String? career,
    String? semester,
    String? university,
    String? location,
    String? photoUrl,
    String? bio,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      career: career ?? this.career,
      semester: semester ?? this.semester,
      university: university ?? this.university,
      location: location ?? this.location,
      photoUrl: photoUrl ?? this.photoUrl,
      bio: bio ?? this.bio,
    );
  }
}
