part of 'darktheme_cubit.dart';

class DarkThemeState extends Equatable {
  final bool darkTheme;
  DarkThemeState({required this.darkTheme});

  DarkThemeState copyWith({
    required bool darkTheme,
  }) {
    return DarkThemeState(
      darkTheme: darkTheme,
    );
  }

  @override
  List<Object> get props => [darkTheme];
}
