import 'package:afaq/models/user_model.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class ProfilesLoadSuccessE extends ProfileEvent {}

class ProfileAdded extends ProfileEvent {
  final User user;

  ProfileAdded(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() =>
      'userAdded { user: ${user.firstname} ${user.city}  ${user.email}}';
}

class ProfileUpdated extends ProfileEvent {
  final user;

  ProfileUpdated(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() =>
      'ProfileUpdated { user: ${user.firstname} ${user.city}  ${user.email}}';
}
