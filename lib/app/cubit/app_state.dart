part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    required this.scheduledRoutines,
    required this.routines,
  });

  const AppState.initial()
      : routines = const [],
        scheduledRoutines = const {};

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      scheduledRoutines:
          Map<Day, Routine>.from(map['scheduledRoutines'] as Map),
      routines: List<Routine>.from(
          (map['routines'] as List<Map<String, dynamic>>)
              .map<Routine>((x) => Routine.fromMap(x))),
    );
  }
  factory AppState.fromJson(String source) =>
      AppState.fromMap(json.decode(source) as Map<String, dynamic>);

  final Map<Day, Routine> scheduledRoutines;
  final List<Routine> routines;

  @override
  List<Object> get props => [scheduledRoutines, routines];

  @override
  bool get stringify => true;

  AppState copyWith({
    Map<Day, Routine>? scheduledRoutines,
    List<Routine>? routines,
  }) {
    return AppState(
      scheduledRoutines: scheduledRoutines ?? this.scheduledRoutines,
      routines: routines ?? this.routines,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'scheduledRoutines': scheduledRoutines,
      'routines': routines.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
