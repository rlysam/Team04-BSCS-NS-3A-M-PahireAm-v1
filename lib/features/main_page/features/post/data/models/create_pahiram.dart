import 'dart:convert';

// ignore_for_file: non_constant_identifier_names

class CreatePahiram {
  // OP details
  final String user_id;
  final String first_name;
  final String last_name;
  final String points;

// ssytem details
  //   Unique to pahiram:
  final String participant_id;
  final String participant_first_name;
  final String participant_last_name;
  final String item;
  final String item_id;
  final String rent_due;

// ssytem details
  final String time_posted;
  final String date;

  final String image_location;
  final String status;

// user input
  final String title;
  final String type; //delivery|request
  final String location;
//   final String destination;
  final String quantity; // ! minsan NULL (PERO nakalagay sa database CREATE TABLE "NOT NULL")
  final String rate; //per day
  final String tags;

  CreatePahiram({
    required this.user_id,
    required this.first_name,
    required this.last_name,
    required this.points,
    required this.participant_id,
    required this.participant_first_name,
    required this.participant_last_name,
    required this.item,
    required this.item_id,
    required this.rent_due,
    required this.time_posted,
    required this.date,
    required this.image_location,
    required this.status,
    required this.title,
    required this.type,
    required this.location,
    required this.quantity,
    required this.rate,
    required this.tags,
  });


  CreatePahiram copyWith({
    String? user_id,
    String? first_name,
    String? last_name,
    String? points,
    String? participant_id,
    String? participant_first_name,
    String? participant_last_name,
    String? item,
    String? item_id,
    String? rent_due,
    String? time_posted,
    String? date,
    String? image_location,
    String? status,
    String? title,
    String? type,
    String? location,
    String? quantity,
    String? rate,
    String? tags,
  }) {
    return CreatePahiram(
      user_id: user_id ?? this.user_id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      points: points ?? this.points,
      participant_id: participant_id ?? this.participant_id,
      participant_first_name: participant_first_name ?? this.participant_first_name,
      participant_last_name: participant_last_name ?? this.participant_last_name,
      item: item ?? this.item,
      item_id: item_id ?? this.item_id,
      rent_due: rent_due ?? this.rent_due,
      time_posted: time_posted ?? this.time_posted,
      date: date ?? this.date,
      image_location: image_location ?? this.image_location,
      status: status ?? this.status,
      title: title ?? this.title,
      type: type ?? this.type,
      location: location ?? this.location,
      quantity: quantity ?? this.quantity,
      rate: rate ?? this.rate,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'first_name': first_name,
      'last_name': last_name,
      'points': points,
      'participant_id': participant_id,
      'participant_first_name': participant_first_name,
      'participant_last_name': participant_last_name,
      'item': item,
      'item_id': item_id,
      'rent_due': rent_due,
      'time_posted': time_posted,
      'date': date,
      'image_location': image_location,
      'status': status,
      'title': title,
      'type': type,
      'location': location,
      'quantity': quantity,
      'rate': rate,
      'tags': tags,
    };
  }

  factory CreatePahiram.fromMap(Map<String, dynamic> map) {
    return CreatePahiram(
      user_id: map['user_id'] ?? '',
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      points: map['points'] ?? '',
      participant_id: map['participant_id'] ?? '',
      participant_first_name: map['participant_first_name'] ?? '',
      participant_last_name: map['participant_last_name'] ?? '',
      item: map['item'] ?? '',
      item_id: map['item_id'] ?? '',
      rent_due: map['rent_due'] ?? '',
      time_posted: map['time_posted'] ?? '',
      date: map['date'] ?? '',
      image_location: map['image_location'] ?? '',
      status: map['status'] ?? '',
      title: map['title'] ?? '',
      type: map['type'] ?? '',
      location: map['location'] ?? '',
      quantity: map['quantity'] ?? '',
      rate: map['rate'] ?? '',
      tags: map['tags'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CreatePahiram.fromJson(String source) => CreatePahiram.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CreatePahiram(user_id: $user_id, first_name: $first_name, last_name: $last_name, points: $points, participant_id: $participant_id, participant_first_name: $participant_first_name, participant_last_name: $participant_last_name, item: $item, item_id: $item_id, rent_due: $rent_due, time_posted: $time_posted, date: $date, image_location: $image_location, status: $status, title: $title, type: $type, location: $location, quantity: $quantity, rate: $rate, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CreatePahiram &&
      other.user_id == user_id &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.points == points &&
      other.participant_id == participant_id &&
      other.participant_first_name == participant_first_name &&
      other.participant_last_name == participant_last_name &&
      other.item == item &&
      other.item_id == item_id &&
      other.rent_due == rent_due &&
      other.time_posted == time_posted &&
      other.date == date &&
      other.image_location == image_location &&
      other.status == status &&
      other.title == title &&
      other.type == type &&
      other.location == location &&
      other.quantity == quantity &&
      other.rate == rate &&
      other.tags == tags;
  }

  @override
  int get hashCode {
    return user_id.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      points.hashCode ^
      participant_id.hashCode ^
      participant_first_name.hashCode ^
      participant_last_name.hashCode ^
      item.hashCode ^
      item_id.hashCode ^
      rent_due.hashCode ^
      time_posted.hashCode ^
      date.hashCode ^
      image_location.hashCode ^
      status.hashCode ^
      title.hashCode ^
      type.hashCode ^
      location.hashCode ^
      quantity.hashCode ^
      rate.hashCode ^
      tags.hashCode;
  }
}
