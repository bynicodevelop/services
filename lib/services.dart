library services;

import 'package:services/UserService.dart';
import 'package:services/getaway/FirebaseAuthGtaway.dart';

/// A Calculator.
class Services {
  UserService _userService;

  Services() {
    this._userService = UserService(
      firebaseAuthGetaway: FirebaseAuthGetaway(),
    );
  }

  UserService get userService => _userService;
}
