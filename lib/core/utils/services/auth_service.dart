import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../features/presentation/controller/portfolio_controller.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? get currentUser => auth.currentUser;



  final teamsController = Get.put(PortfolioController(getPortfolio: Get.find()));

  /*Future<User?> signInWithEmail(String email, String password) async {
    final cred = await auth.signInWithEmailAndPassword(email: email, password: password);
    return cred.user;
  }

  Future<User?> signUp(String email, String password) async {
    final cred = await auth.createUserWithEmailAndPassword(email: email, password: password);
    return cred.user;
  }*/

  Future<void> signOut() async => await auth.signOut();



  Stream<User?> get authStateChanges => auth.authStateChanges();

  //SIGN UP METHOD
  Future signUp({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN IN METHOD
  Future signIn({required String email, required String password}) async {
    try {
      auth..setLanguageCode('en')..signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

}
