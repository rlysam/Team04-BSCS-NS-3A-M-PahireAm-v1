// model
class User {
    //! USER ID = OK
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String points;
  final String userType;
  final String status;
  final String tupid;
  final String imgloc;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.points,
    required this.userType,
    required this.status,
    required this.tupid,
    required this.imgloc,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      password: json['password'],
      points: json['points'],
      userType: json['user_type'],
      status: json['status'],
      tupid: json['tup_id'], //! Dito meron na
      imgloc: json['image_location'],
    );
  }
}