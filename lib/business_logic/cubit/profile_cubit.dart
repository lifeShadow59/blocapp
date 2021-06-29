import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
      : super(
          ProfileState(
            userName: '',
            userEmailId: '',
          ),
        );

  void onSave(String userName, String userEmailId) {
    emit(state.copyWith(userName: userName, userEmailId: userEmailId));
  }

  void onClean() {
    emit(state.copyWith(userName: ' ', userEmailId: ' '));
  }
}
