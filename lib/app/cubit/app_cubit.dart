import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:workout_app/common/models/models.dart';

part 'app_state.dart';

class AppCubit extends HydratedCubit<AppState> {
  AppCubit() : super(const AppState.initial());

  // duplicate routine

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    try {
      return AppState.fromMap(json);
    } catch (_) {
      return const AppState.initial();
    }
  }

  @override
  Map<String, dynamic>? toJson(AppState state) => state.toMap();
}
