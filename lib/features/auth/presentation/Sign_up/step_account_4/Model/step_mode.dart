// features/auth/presentation/Sign_up/step_account_4/Model/step_mode.dart
class StepMode {
  final int user_id;
  final String username;
  final String display_name;
  final String phone;
  final String? email;
  final String password; // ده بيكون ال hashed password
  final String profile_image;
  final String about_me;
  final bool done_create;

  StepMode({
    required this.user_id,
    required this.username,
    required this.display_name,
    required this.phone,
    required this.email,
    required this.password,
    required this.profile_image,
    required this.about_me,
    required this.done_create,
  });

  factory StepMode.fromJson(Map<String, dynamic> json) {
    return StepMode(
      user_id: json['user_id'],
      username: json['username'] ?? "",
      display_name: json['display_name'] ?? "",
      phone: json['phone'] ?? "",
      email: json['email'],
      password: json['password'] ?? "",
      profile_image: json['profile_image'] ?? "",
      about_me: json['about_me'] ?? "",
      done_create: json['done_create'] ?? false,
    );
  }
}