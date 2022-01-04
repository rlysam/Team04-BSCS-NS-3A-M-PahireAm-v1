// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Pahiram {

	final int post_id;
	final int user_id;
	final String first_name;
	final String last_name;
	final String type;
	final int participant_id; 
	final String participant_first_name; 
	final String participant_last_name; 
	final String item; 
	final int item_id; 
	final int points;
	final int rate;
	final String rent_due;
	final String location;
	final String time_posted; 
	final String date; 
	final String status; 
	final String tags; 
	final String image_location; 

  Pahiram({
	required this.post_id,
	required this.user_id,
	required this.first_name,
	required this.last_name,
	required this.type,
	required this.participant_id,
	required this.participant_first_name,
	required this.participant_last_name,
	required this.item,
	required this.item_id,
	required this.points,
	required this.rate,
	required this.rent_due,
	required this.location,
	required this.time_posted,
	required this.date,
	required this.status,
	required this.tags,
	required this.image_location,
  });


  Pahiram copyWith({
	int? post_id,
	int? user_id,
	String? first_name,
	String? last_name,
	String? type,
	int? participant_id,
	String? participant_first_name,
	String? participant_last_name,
	String? item,
	int? item_id,
	int? points,
	int? rate,
	String? rent_due,
	String? location,
	String? time_posted,
	String? date,
	String? status,
	String? tags,
	String? image_location,
  }) {
	return Pahiram(
	  post_id: post_id ?? this.post_id,
	  user_id: user_id ?? this.user_id,
	  first_name: first_name ?? this.first_name,
	  last_name: last_name ?? this.last_name,
	  type: type ?? this.type,
	  participant_id: participant_id ?? this.participant_id,
	  participant_first_name: participant_first_name ?? this.participant_first_name,
	  participant_last_name: participant_last_name ?? this.participant_last_name,
	  item: item ?? this.item,
	  item_id: item_id ?? this.item_id,
	  points: points ?? this.points,
	  rate: rate ?? this.rate,
	  rent_due: rent_due ?? this.rent_due,
	  location: location ?? this.location,
	  time_posted: time_posted ?? this.time_posted,
	  date: date ?? this.date,
	  status: status ?? this.status,
	  tags: tags ?? this.tags,
	  image_location: image_location ?? this.image_location,
	);
  }

  Map<String, dynamic> toMap() {
	return {
	  'post_id': post_id,
	  'user_id': user_id,
	  'first_name': first_name,
	  'last_name': last_name,
	  'type': type,
	  'participant_id': participant_id,
	  'participant_first_name': participant_first_name,
	  'participant_last_name': participant_last_name,
	  'item': item,
	  'item_id': item_id,
	  'points': points,
	  'rate': rate,
	  'rent_due': rent_due,
	  'location': location,
	  'time_posted': time_posted,
	  'date': date,
	  'status': status,
	  'tags': tags,
	  'image_location': image_location,
	};
  }

  factory Pahiram.fromMap(Map<String, dynamic> map) {
	return Pahiram(
	  post_id: map['post_id']?.toInt() ?? 0,
	  user_id: map['user_id']?.toInt() ?? 0,
	  first_name: map['first_name'] ?? '',
	  last_name: map['last_name'] ?? '',
	  type: map['type'] ?? '',
	  participant_id: map['participant_id']?.toInt() ?? 0,
	  participant_first_name: map['participant_first_name'] ?? '',
	  participant_last_name: map['participant_last_name'] ?? '',
	  item: map['item'] ?? '',
	  item_id: map['item_id']?.toInt() ?? 0,
	  points: map['points']?.toInt() ?? 0,
	  rate: map['rate']?.toInt() ?? 0,
	  rent_due: map['rent_due'] ?? '',
	  location: map['location'] ?? '',
	  time_posted: map['time_posted'] ?? '',
	  date: map['date'] ?? '',
	  status: map['status'] ?? '',
	  tags: map['tags'] ?? '',
	  image_location: map['image_location'] ?? '',
	);
  }

  String toJson() => json.encode(toMap());

  factory Pahiram.fromJson(String source) => Pahiram.fromMap(json.decode(source));

  @override
  String toString() {
	return 'Pahiram(post_id: $post_id, user_id: $user_id, first_name: $first_name, last_name: $last_name, type: $type, participant_id: $participant_id, participant_first_name: $participant_first_name, participant_last_name: $participant_last_name, item: $item, item_id: $item_id, points: $points, rate: $rate, rent_due: $rent_due, location: $location, time_posted: $time_posted, date: $date, status: $status, tags: $tags, image_location: $image_location)';
  }

  @override
  bool operator ==(Object other) {
	if (identical(this, other)) return true;
  
	return other is Pahiram &&
	  other.post_id == post_id &&
	  other.user_id == user_id &&
	  other.first_name == first_name &&
	  other.last_name == last_name &&
	  other.type == type &&
	  other.participant_id == participant_id &&
	  other.participant_first_name == participant_first_name &&
	  other.participant_last_name == participant_last_name &&
	  other.item == item &&
	  other.item_id == item_id &&
	  other.points == points &&
	  other.rate == rate &&
	  other.rent_due == rent_due &&
	  other.location == location &&
	  other.time_posted == time_posted &&
	  other.date == date &&
	  other.status == status &&
	  other.tags == tags &&
	  other.image_location == image_location;
  }

  @override
  int get hashCode {
	return post_id.hashCode ^
	  user_id.hashCode ^
	  first_name.hashCode ^
	  last_name.hashCode ^
	  type.hashCode ^
	  participant_id.hashCode ^
	  participant_first_name.hashCode ^
	  participant_last_name.hashCode ^
	  item.hashCode ^
	  item_id.hashCode ^
	  points.hashCode ^
	  rate.hashCode ^
	  rent_due.hashCode ^
	  location.hashCode ^
	  time_posted.hashCode ^
	  date.hashCode ^
	  status.hashCode ^
	  tags.hashCode ^
	  image_location.hashCode;
  }
}
