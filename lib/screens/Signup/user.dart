// model
class User {
  final String id;
  final String title;
  final String desc;
  final String pts;
  final String type;
  final String status;
  final String tupid;
  final String imgloc;

  User({
    required this.id,
    required this.title,
    required this.desc,
    required this.pts,
    required this.type,
    required this.status,
    required this.tupid,
    required this.imgloc,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['first_name'],
      title: json['last_name'],
      desc: json['email'],
      pts: json['points'],
      type: json['user_type'],
      status: json['status'],
      tupid: json['tup_id'],
      imgloc: json['image_location'],
    );
  }
}