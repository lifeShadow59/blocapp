import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'darktheme_state.dart';

class DarkThemeCubit extends Cubit<DarkThemeState> {
  DarkThemeCubit() : super(DarkThemeState(darkTheme: true));

  void changeTheme(bool darkTheme) =>
      emit(state.copyWith(darkTheme: darkTheme));
}
