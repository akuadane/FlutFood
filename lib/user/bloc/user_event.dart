import 'package:flut_food/user/model/models.dart';

abstract class UserEvent {
  const UserEvent();
}

class UserSignInWithUsername extends UserEvent {
  String username, password;

  UserSignInWithUsername(this.username, this.password);
}

class UserSignInWithId extends UserEvent {
  String id;

  UserSignInWithId(this.id);
}

class UserSignInFromCache extends UserEvent {}

class UserSignUp extends UserEvent {
  User user;

  UserSignUp(this.user);
}

class UserSignOut extends UserEvent {}

class UserUpdate extends UserEvent {
  User user;

  UserUpdate(this.user);
}

class UserDelete extends UserEvent {
  User user;

  UserDelete(this.user);
}
