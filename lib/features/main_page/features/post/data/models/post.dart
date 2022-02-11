// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:meta/meta.dart';

class Post {
  final String post_id;

// OP details
  final String user_id;
  final String first_name;
  final String last_name;
  final String points;

// ssytem details
  final String time_posted;
  final String date;

  final String image_location;
  final String status;

  //   User INPUT
  final String title;
  final String type; //delivery|request
//   !! TODO yung Pasabay or Pahiram, base sa SWITCH --- indicate on screen
  final String location;
  final String destination;
  final String quantity; // ! minsan NULL (PERO nakalagay sa database CREATE TABLE "NOT NULL")
  final String rate;
  final String tags;
  final String delivery_time;

  //   Unique to pahiram:
  final String participant_id;
  final String participant_first_name;
  final String participant_last_name;

//   final String item;
//   final String item_id;

  final String rent_due;

  Post({
    required this.post_id,
    required this.user_id,
    required this.first_name,
    required this.last_name,
    required this.points,
    required this.time_posted,
    required this.date,
    required this.image_location,
    required this.status,
    required this.title,
    required this.type,
    required this.location,
    required this.destination,
    required this.quantity,
    required this.rate,
    required this.tags,
    required this.delivery_time,
    required this.participant_id,
    required this.participant_first_name,
    required this.participant_last_name,
    required this.rent_due,
  });





  Post copyWith({
    String? post_id,
    String? user_id,
    String? first_name,
    String? last_name,
    String? points,
    String? time_posted,
    String? date,
    String? image_location,
    String? status,
    String? title,
    String? type,
    String? location,
    String? destination,
    String? quantity,
    String? rate,
    String? tags,
    String? delivery_time,
    String? participant_id,
    String? participant_first_name,
    String? participant_last_name,
    String? rent_due,
  }) {
    return Post(
      post_id: post_id ?? this.post_id,
      user_id: user_id ?? this.user_id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      points: points ?? this.points,
      time_posted: time_posted ?? this.time_posted,
      date: date ?? this.date,
      image_location: image_location ?? this.image_location,
      status: status ?? this.status,
      title: title ?? this.title,
      type: type ?? this.type,
      location: location ?? this.location,
      destination: destination ?? this.destination,
      quantity: quantity ?? this.quantity,
      rate: rate ?? this.rate,
      tags: tags ?? this.tags,
      delivery_time: delivery_time ?? this.delivery_time,
      participant_id: participant_id ?? this.participant_id,
      participant_first_name: participant_first_name ?? this.participant_first_name,
      participant_last_name: participant_last_name ?? this.participant_last_name,
      rent_due: rent_due ?? this.rent_due,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'post_id': post_id,
      'user_id': user_id,
      'first_name': first_name,
      'last_name': last_name,
      'points': points,
      'time_posted': time_posted,
      'date': date,
      'image_location': image_location,
      'status': status,
      'title': title,
      'type': type,
      'location': location,
      'destination': destination,
      'quantity': quantity,
      'rate': rate,
      'tags': tags,
      'delivery_time': delivery_time,
      'participant_id': participant_id,
      'participant_first_name': participant_first_name,
      'participant_last_name': participant_last_name,
      'rent_due': rent_due,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      post_id: map['post_id'] ?? '',
      user_id: map['user_id'] ?? '',
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      points: map['points'] ?? '',
      time_posted: map['time_posted'] ?? '',
      date: map['date'] ?? '',
      image_location: map['image_location'] ?? '',
      status: map['status'] ?? '',
      title: map['title'] ?? '',
      type: map['type'] ?? '',
      location: map['location'] ?? '',
      destination: map['destination'] ?? '',
      quantity: map['quantity'] ?? '',
      rate: map['rate'] ?? '',
      tags: map['tags'] ?? '',
      delivery_time: map['delivery_time'] ?? '',
      participant_id: map['participant_id'] ?? '',
      participant_first_name: map['participant_first_name'] ?? '',
      participant_last_name: map['participant_last_name'] ?? '',
      rent_due: map['rent_due'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(post_id: $post_id, user_id: $user_id, first_name: $first_name, last_name: $last_name, points: $points, time_posted: $time_posted, date: $date, image_location: $image_location, status: $status, title: $title, type: $type, location: $location, destination: $destination, quantity: $quantity, rate: $rate, tags: $tags, delivery_time: $delivery_time, participant_id: $participant_id, participant_first_name: $participant_first_name, participant_last_name: $participant_last_name, rent_due: $rent_due)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Post &&
      other.post_id == post_id &&
      other.user_id == user_id &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.points == points &&
      other.time_posted == time_posted &&
      other.date == date &&
      other.image_location == image_location &&
      other.status == status &&
      other.title == title &&
      other.type == type &&
      other.location == location &&
      other.destination == destination &&
      other.quantity == quantity &&
      other.rate == rate &&
      other.tags == tags &&
      other.delivery_time == delivery_time &&
      other.participant_id == participant_id &&
      other.participant_first_name == participant_first_name &&
      other.participant_last_name == participant_last_name &&
      other.rent_due == rent_due;
  }

  @override
  int get hashCode {
    return post_id.hashCode ^
      user_id.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      points.hashCode ^
      time_posted.hashCode ^
      date.hashCode ^
      image_location.hashCode ^
      status.hashCode ^
      title.hashCode ^
      type.hashCode ^
      location.hashCode ^
      destination.hashCode ^
      quantity.hashCode ^
      rate.hashCode ^
      tags.hashCode ^
      delivery_time.hashCode ^
      participant_id.hashCode ^
      participant_first_name.hashCode ^
      participant_last_name.hashCode ^
      rent_due.hashCode;
  }
}
