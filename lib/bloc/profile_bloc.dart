import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserState extends Equatable {
  final String userName;
  final String userEmail;
  const UserState(
    this.userName,
    this.userEmail,
  );

  @override
  List<Object> get props => [userName, userEmail];
}

enum UpdateProfileEvent { update }

class UpDateProfileBloc extends Bloc<UpdateProfileEvent, Map<String, String>> {
  UpDateProfileBloc() : super({"Name": "Abhi", "Email": 'abhi@gmailcom'});

  @override
  Stream<Map<String, String>> mapEventToState(UpdateProfileEvent event) async* {
    switch (event) {
      case UpdateProfileEvent.update:
        yield updateUser();
        break;
    }
  }

  Map<String, String> updateUser() {
    return {"Name": "varun", "Email": "varun@gmail.com"};
  }
}
