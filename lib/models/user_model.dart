
class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phoneNumber;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  // Object ko Map mein convert karna
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  // Map se UserModel object banana
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }
}