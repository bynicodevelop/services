import 'package:services/ServiceException.dart';

class AuthenticationException extends ServiceException {
  static final String WRONG_CREDENTIALS = 'wrong-credentials';
  static final String USER_NOT_FOUND = 'user-not-found';
  static final String TOO_MANY_REQUEST = 'too-many-request';

  const AuthenticationException({code, message})
      : super(code: code, message: message);
}
