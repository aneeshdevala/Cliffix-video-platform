class SignupResponseModel {
  SignupResponseModel({
    required this.success,
    required this.message,
  });

  final bool success;
  final String message;

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
