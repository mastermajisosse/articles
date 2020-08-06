import 'dart:async';

import 'package:afaq/bloc/profile/bloc.dart';
import 'package:afaq/models/user_model.dart';
import 'package:afaq/repository/user_auth_repo.dart';
import 'package:afaq/repository/user_database_repo.dart';
import 'package:bloc/bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserDataBaseRepo profilesRepository = UserDataBaseRepo();
  StreamSubscription profilesSubscription;
  UserRepository _userRepository = UserRepository();
  ProfileBloc() : super(ProfileLoadInProgress());
  // ProfileBloc() : super(ProfileLoadInProgress());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    final uid = await _userRepository.getUser();
    if (event is ProfilesLoadSuccessE) {
      print(uid);
      yield* _mapLoadProfilessToState(uid);
    } else if (event is ProfileUpdated) {
      yield* _mapProfilessUpdateToState(event, event.user);
    }
  }

  Stream<ProfileState> _mapLoadProfilessToState(uid) async* {
    // User profile;
    print("2");
    try {
      // profilesSubscription?.cancel();
      print(3);
      User usser = await profilesRepository.profile(uid);
      print(usser.firstname);

      add(ProfileUpdated(usser));
    } catch (_) {
      yield ProfileLoadFailure();
    }
  }

  Stream<ProfileState> _mapProfilessUpdateToState(
      ProfileUpdated event, user) async* {
    yield ProfileLoadSuccesS(profile: user);
  }

  @override
  Future<void> close() {
    profilesSubscription?.cancel();
    return super.close();
  }
}
