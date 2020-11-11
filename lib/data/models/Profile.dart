import 'package:json_annotation/json_annotation.dart';
import 'package:winkels_customer/data/models/Address.dart';

part 'Profile.g.dart';

@JsonSerializable(nullable: false)
class Profile {
  final int id;
  final String name;
  final String email;
  final String phone;
  final Address address;

  Profile(this.id, this.name, this.email, this.phone, this.address);

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
