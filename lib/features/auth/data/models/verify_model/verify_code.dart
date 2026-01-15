class VerifyEmailResponse {
  final String nextStep;
  final bool isVerified;
  final String email;

  VerifyEmailResponse({
    required this.nextStep,
    required this.isVerified,
    required this.email,
  });

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) {
     final isVerifiedRaw = json['user']?['is_verified'];

    return VerifyEmailResponse(
      nextStep: json['next_step']?.toString() ?? "",
      isVerified:  isVerifiedRaw == true || isVerifiedRaw == 'true',
      email:  json['user']?['email']?.toString() ?? "",
    );
  }
}