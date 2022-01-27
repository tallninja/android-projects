class User {
  String firstName;
  String lastName;
  String phoneNumber;
  String userName;
  String email;
  String password;
  String role;

  String token;

  User({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.role,
    this.email,
    this.password,
    this.userName,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      email: responseData['email'],
      firstName: responseData['firstName'],
      lastName: responseData['lastName'],
      password: responseData['password'],
      phoneNumber: responseData['phoneNumber'],
      role: responseData['role'],
      userName: responseData['userName'],
      token: responseData['token'],
    );
  }
}
