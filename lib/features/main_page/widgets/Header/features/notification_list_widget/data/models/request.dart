import 'dart:convert';

class Request {
 final String request_id;
 final String post_id;
 final String poster_id;
 final String user_id;
 final String first_name;
 final String last_name;
 final String type;
 final String rate;
 final String status;

  Request({
    required this.request_id,
    required this.post_id,
    required this.poster_id,
    required this.user_id,
    required this.first_name,
    required this.last_name,
    required this.type,
    required this.rate,
    required this.status,
  });

  Request copyWith({
    String? request_id,
    String? post_id,
    String? poster_id,
    String? user_id,
    String? first_name,
    String? last_name,
    String? type,
    String? rate,
    String? status,
  }) {
    return Request(
      request_id: request_id ?? this.request_id,
      post_id: post_id ?? this.post_id,
      poster_id: poster_id ?? this.poster_id,
      user_id: user_id ?? this.user_id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      type: type ?? this.type,
      rate: rate ?? this.rate,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'request_id': request_id,
      'post_id': post_id,
      'poster_id': poster_id,
      'user_id': user_id,
      'first_name': first_name,
      'last_name': last_name,
      'type': type,
      'rate': rate,
      'status': status,
    };
  }

  factory Request.fromMap(Map<String, dynamic> map) {
    return Request(
      request_id: map['request_id'] ?? '',
      post_id: map['post_id'] ?? '',
      poster_id: map['poster_id'] ?? '',
      user_id: map['user_id'] ?? '',
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      type: map['type'] ?? '',
      rate: map['rate'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Request.fromJson(String source) => Request.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Request(request_id: $request_id, post_id: $post_id, poster_id: $poster_id, user_id: $user_id, first_name: $first_name, last_name: $last_name, type: $type, rate: $rate, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Request &&
      other.request_id == request_id &&
      other.post_id == post_id &&
      other.poster_id == poster_id &&
      other.user_id == user_id &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.type == type &&
      other.rate == rate &&
      other.status == status;
  }

  @override
  int get hashCode {
    return request_id.hashCode ^
      post_id.hashCode ^
      poster_id.hashCode ^
      user_id.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      type.hashCode ^
      rate.hashCode ^
      status.hashCode;
  }
}
