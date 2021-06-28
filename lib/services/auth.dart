import 'package:brew_crew/models/myuser.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  MyUser? _userFromfireBaseUser(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }
  // auth  change user stream

  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromfireBaseUser(user!));
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromfireBaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // sign in with  email & password

  // register with email and Password

  // sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
