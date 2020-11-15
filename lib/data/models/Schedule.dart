import 'package:json_annotation/json_annotation.dart';

part 'Schedule.g.dart';

@JsonSerializable(nullable: false)
class Schedule {
  final String days;
  final String hours;

  Schedule(this.days, this.hours);

  factory Schedule.fromJson(Map<String, dynamic> json) => _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
