part of 'darktheme_cubit.dart';

class DarkThemeState extends Equatable {
  final bool darkTheme;
  DarkThemeState({required this.darkTheme});

  @override
  List<Object> get props => [darkTheme];

  DarkThemeState copyWith({
    bool? darkTheme,
  }) {
    return DarkThemeState(
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'darkTheme': darkTheme,
    };
  }

  factory DarkThemeState.fromMap(Map<String, dynamic> map) {
    return DarkThemeState(
      darkTheme: map['darkTheme'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DarkThemeState.fromJson(String source) =>
      DarkThemeState.fromMap(json.decode(source));
}
