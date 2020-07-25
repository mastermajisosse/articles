import 'package:afaq/models/user_model.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileLoadInProgress extends ProfileState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ProfileLoadSuccesS extends ProfileState {
  User profile;

  ProfileLoadSuccesS({this.profile});

  @override
  List<Object> get props => [profile];

  @override
  String toString() => 'profileLoadSuccess { profile: $profile }';
}

class ProfileLoadFailure extends ProfileState {
  String message;

  ProfileLoadFailure({this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
