import 'package:firebase_auth/firebase_auth.dart';
import 'package:services/exceptions/AuthenticationException.dart';

class FirebaseAuthGetaway {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<Map<String, dynamic>> get user {
    return _firebaseAuth.authStateChanges().asyncMap((user) async {
      if (user == null) return null;

      return {
        'uid': user.uid,
        'email': user.email,
      };
    });
  }

  Future<Map<String, dynamic>> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential;

    try {
      userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password':
          throw new AuthenticationException(
            code: AuthenticationException.WRONG_CREDENTIALS,
          );
          break;
        case 'too-many-request':
          throw new AuthenticationException(
            code: AuthenticationException.TOO_MANY_REQUEST,
          );
          break;
        default:
          throw new AuthenticationException(
            code: e.code,
          );
      }
    }

    return {
      'uid': userCredential.user.uid,
      'email': userCredential.user.email,
    };
  }
}
