import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Routine extends Equatable {
  const Routine({
    required this.name,
    required this.exercises,
    required this.day,
    required this.restTimeInMinutes,
    required this.createdAt,
  });

  factory Routine.fromMap(Map<String, dynamic> map) {
    return Routine(
      name: map['name'] as String,
      exercises: List<Exercise>.from(
          (map['exercises'] as List<Map<String, dynamic>>?)
                  ?.map<Exercise>((x) => Exercise.fromMap(x)) ??
              <Exercise>[]),
      day: map['day'] != null ? DayExt.fromJson(map['day']) : null,
      restTimeInMinutes: map['restTimeInMinutes'] as int,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }

  factory Routine.fromJson(String source) =>
      Routine.fromMap(json.decode(source) as Map<String, dynamic>);
  final String name;
  final List<Exercise> exercises;
  final Day? day;
  final int restTimeInMinutes;
  final DateTime createdAt;

  Routine copyWith({
    String? name,
    List<Exercise>? exercises,
    Day? day,
    int? restTimeInMinutes,
    DateTime? createdAt,
  }) {
    return Routine(
      name: name ?? this.name,
      exercises: exercises ?? this.exercises,
      day: day ?? this.day,
      restTimeInMinutes: restTimeInMinutes ?? this.restTimeInMinutes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'exercises': exercises.map((x) => x.toMap()).toList(),
      'day': day != null ? describeEnum(day!) : null,
      'restTimeInMinutes': restTimeInMinutes,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name,
      exercises,
      if (day != null) day!,
      restTimeInMinutes,
      createdAt,
    ];
  }
}

class Exercise extends Equatable {
  const Exercise({
    required this.name,
    required this.reps,
    required this.sets,
    this.weight,
    required this.illustrationIndex,
  });
  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      name: map['name'] as String,
      reps: map['reps'] as int,
      sets: map['sets'] as int,
      weight: map['weight'] as int?,
      illustrationIndex: map['illustrationIndex'] as int,
    );
  }
  factory Exercise.fromJson(String source) =>
      Exercise.fromMap(json.decode(source) as Map<String, dynamic>);

  final String name;
  final int reps; // Repeticiones
  final int sets; // Series
  final int? weight;
  final int illustrationIndex;

  Exercise copyWith({
    String? name,
    int? reps,
    int? sets,
    int? weight,
    int? illustrationIndex,
  }) {
    return Exercise(
      name: name ?? this.name,
      reps: reps ?? this.reps,
      sets: sets ?? this.sets,
      weight: weight ?? this.weight,
      illustrationIndex: illustrationIndex ?? this.illustrationIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'reps': reps,
      'sets': sets,
      'weight': weight,
      'illustrationIndex': illustrationIndex,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name,
      reps,
      sets,
      if (weight != null) weight!,
      illustrationIndex,
    ];
  }
}

enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

extension DayExt on Day {
  static Day fromJson(dynamic json) {
    final element = Day.values.firstWhere(
        (element) => describeEnum(element).toLowerCase() == json.toLowerCase());
    return element;
  }
}
