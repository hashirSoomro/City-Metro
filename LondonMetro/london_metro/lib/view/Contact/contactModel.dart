class ContactModel {
  final String email;
  final String message;

  ContactModel({
    required this.email,
    required this.message,
  });

  //Serialize the user model instance to JSON map.
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'categoryId': message,
    };
  }

  //create a user model instance from a JSON map
  factory ContactModel.fromMap(Map<String, dynamic> json) {
    return ContactModel(
      email: json['email'],
      message: json['message'],
    );
  }
}
