import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'darktheme_state.dart';

class DarkThemeCubit extends Cubit<DarkThemeState> with HydratedMixin {
  DarkThemeCubit() : super(DarkThemeState(darkTheme: false));

  void changeTheme(bool darkTheme) =>
      emit(state.copyWith(darkTheme: darkTheme));

  @override
  DarkThemeState fromJson(Map<String, dynamic> json) {
    return DarkThemeState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(DarkThemeState state) {
    return state.toMap();
  }
}
