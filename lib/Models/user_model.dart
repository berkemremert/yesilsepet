class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String? profilePictureUrl;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.profilePictureUrl,
  });
}