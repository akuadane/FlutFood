import 'package:flut_food/user/bloc/bloc.dart';
import 'package:flut_food/user/model/models.dart';
import 'package:flut_food/user/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;

  UserBloc(this.userRepository)
      : assert(userRepository != null),
        super(UserLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserSignInWithUsername) {
      try {
        User user = await this
            .userRepository
            .signInUser(event.username, event.password);
        yield UserSuccessfullySignedIn(user);
      } catch (_) {
        yield UserFailedToSignIn();
      }
    } else if (event is UserSignInFromCache) {
      try {
        User user = await this.userRepository.getUserById();
        yield UserSuccessfullySignedIn(user);
      } catch (_) {
        yield UserFailedToSignIn();
      }
    } else if (event is UserSignUp) {
      print("in bloc");
      try {
        User user = await this.userRepository.createUser(event.user);
        yield UserSuccessfullySignedIn(user);
      } catch (_) {
        yield UserGeneralFailure("Error Signing up");
      }
    } else if (event is UserUpdate) {
      try {
        await this.userRepository.updateUser(event.user);
        User user =
            await this.userRepository.getUserByUserName(event.user.userName);
        yield UserSuccessfullySignedIn(user);
      } catch (_) {
        yield UserGeneralFailure("Error updating user");
      }
    } else if (event is UserDelete) {
      try {
        await this.userRepository.deleteUser(event.user.id);
        yield UserSuccessfullySignedOut();
      } catch (_) {
        yield UserGeneralFailure("Error deleting user");
      }
    } else if (event is UserSignOut) {
      yield UserSuccessfullySignedOut();
    }
  }
}
