part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final String userName;
  final String userEmailId;

  ProfileState({required this.userName, required this.userEmailId}) : super();

  ProfileState copyWith({
    required String userName,
    required String userEmailId,
  }) {
    return ProfileState(
      userName: userName,
      userEmailId: userEmailId,
    );
  }

  @override
  List<Object> get props => [
        userName,
        userEmailId,
      ];
}
