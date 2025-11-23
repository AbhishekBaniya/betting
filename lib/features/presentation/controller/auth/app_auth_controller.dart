import 'package:alert_info/alert_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salesbetting/features/data/model/team_model.dart';
import 'package:salesbetting/features/presentation/app_routes/app_navigators.dart';

import '../../../../core/utils/services/auth_service.dart';
import '../../../../core/utils/services/firebase_service.dart';
import '../../../data/model/user_model.dart';
import '../../app_routes/app_routes.dart';

/*class AppAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseService _firebaseService = FirebaseService();

  Rxn<UserModel> user = Rxn<UserModel>();

  UserModel? get currentUser => user.value;

  // Email & Password Login
  Future<void> loginWithEmail(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
    await _loadUser(cred.user);
  }

  Future<void> signupWithEmail(String name, String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    if (cred.user != null) {
      final newUser = UserModel(uid: cred.user!.uid, name: name, email: email);
      await _firebaseService.createUser(newUser);
      user.value = newUser;
    }
  }

  // Google Sign-In
  *//*Future<void> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return; // canceled
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final cred = await _auth.signInWithCredential(credential);
    await _loadUser(cred.user);
  }*//*


// Google Sign-In
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<User?> signInWithGoogle() async {
    try {
      // Initialize (required for the latest versions)
      await _googleSignIn.initialize();

      // Authenticate the user
      final GoogleSignInAccount? googleUser = await _googleSignIn.authenticate();
      if (googleUser == null) return null; // User canceled

      // Get Google auth details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create Firebase credential
      final credential = GoogleAuthProvider.credential(
        //accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print('Google Sign-In Error: $e');
      return null;
    }
  }

// Example user loader function
  *//*Future<void> _loadUser(User? user) async {
    if (user != null) {
      print('User signed in: ${user.displayName}');
    }
  }*//*

  // Mobile OTP Login
  Future<void> loginWithPhone(String phone, Function(String verificationId) codeSent) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (cred) async {
        await _auth.signInWithCredential(cred);
        await _loadUser(_auth.currentUser);
      },
      verificationFailed: (e) => Get.snackbar('Error', e.message ?? 'Phone login failed'),
      codeSent: (verificationId, _) => codeSent(verificationId),
      codeAutoRetrievalTimeout: (_) {},
    );
  }

  Future<void> verifyOTP(String verificationId, String smsCode) async {
    final cred = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
    await _auth.signInWithCredential(cred);
    await _loadUser(_auth.currentUser);
  }

  Future<void> _loadUser(User? firebaseUser) async {
    if (firebaseUser != null) {
      final u = await _firebaseService.getUser(firebaseUser.uid);
      if (u != null) {
        user.value = u;
      } else {
        final newUser = UserModel(uid: firebaseUser.uid, name: firebaseUser.displayName ?? '', email: firebaseUser.email ?? '');
        await _firebaseService.createUser(newUser);
        user.value = newUser;
      }
      Get.offAllNamed('/home');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.disconnect();
    user.value = null;
    Get.offAllNamed('/onboarding');
  }
}*/

class AppAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseService _firebaseService = FirebaseService();
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Rxn<UserModel> user = Rxn<UserModel>();
  Rxn<TeamModel> teams = Rxn<TeamModel>();
  UserModel? get currentUser => user.value;

  // ------------------ EMAIL & PASSWORD ------------------

  Future<void> loginWithEmail(String email, String password) async {

    /*AuthService()
        .signIn(email: email, password: password)
        .then((result) {
      if (result == null) {
        AppNavigator().navigateToAndReplace(AppRoutes.login);
      } else {
        print('Login failed: $result');
      }
    });*/

    try {

      final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
      print('[Email Login] Success: ${cred.user?.uid}');
      final team = TeamModel(id: 'Team3', name: 'Rabby', logoUrl: '', losses: 0, wins: 5);
      await _firebaseService.createTeam(team);
      teams.value = team;
      await _loadUser(cred.user);
      AppNavigator().navigateToAndReplace(AppRoutes.dashboard,);
    } on FirebaseAuthException catch (e) {
      print('[Email Login] FirebaseAuthException: ${e.code} - ${e.message}');
      //Get.snackbar('Login Failed', e.message ?? 'Unknown error');
    } catch (e) {
      print('[Email Login] Error: $e');
      //Get.snackbar('Login Failed', 'Unexpected error occurred');
    }
  }

  Future<void> signupWithEmail(String name, String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (cred.user != null) {
        final newUser = UserModel(uid: cred.user!.uid, name: name, email: email);
        await _firebaseService.createUser(newUser);
        user.value = newUser;

        print('[Email Signup] User created: ${newUser.uid}');
        //Get.offAllNamed('/home');
        AppNavigator().navigateToAndReplace(AppRoutes.dashboard,);
      }
    } on FirebaseAuthException catch (e) {
      print('[Email Signup] FirebaseAuthException: ${e.code} - ${e.message}');
      //Get.snackbar('Signup Failed', e.message ?? 'Unknown error');
    } catch (e) {
      print('[Email Signup] Error: $e');
      //Get.snackbar('Signup Failed', 'Unexpected error occurred');
    }
  }

  // ------------------ GOOGLE SIGN-IN ------------------

  Future<User?> signInWithGoogle() async {
    try {

      await _googleSignIn.initialize();

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    /*  final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: "YOUR-WEB-CLIENT-ID.apps.googleusercontent.com",
        scopes: ['email'],
      );*/

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      print('[Google Sign-In] Success: ${userCredential.user?.uid}');
      await _loadUser(userCredential.user);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('[Google Sign-In] FirebaseAuthException: ${e.code} - ${e.message}');
      //Get.snackbar('Google Sign-In Failed', e.message ?? 'Unknown error');
      return null;
    } catch (e) {
      print('[Google Sign-In] Error: $e');
      //Get.snackbar('Google Sign-In Failed', 'Unexpected error occurred');
      return null;
    }
  }

  /*Future<User?> signInWithGoogle() async {
    try {
      await _googleSignIn.initialize(
        clientId: "YOUR_WEB_CLIENT_ID.apps.googleusercontent.com",
        serverClientId: "YOUR_WEB_CLIENT_ID.apps.googleusercontent.com",
      );

      GoogleSignInAccount? googleUser;

      if (_googleSignIn.supportsAuthenticate()) {
        googleUser = await _googleSignIn.authenticate();
      } else {
        googleUser = await _googleSignIn.attemptLightweightAuthentication();
      }

      if (googleUser == null) return null; // user cancelled

      final GoogleSignInAuthentication googleAuth =
      googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      print('[Google Sign-In] Firebase UID: ${userCredential.user?.uid}');
      return userCredential.user;

    } catch (e) {
      print('[Google Sign-In] ERROR: $e');
      return null;
    }
  }*/



  // ------------------ PHONE OTP ------------------

  Future<void> loginWithPhone(String phone, Function(String verificationId) codeSent) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (cred) async {
          await _auth.signInWithCredential(cred);
          print('[Phone Login] Verification completed automatically');
          await _loadUser(_auth.currentUser);
        },
        verificationFailed: (e) {
          print('[Phone Login] Verification failed: ${e.message}');
          //Get.snackbar('Phone Login Failed', e.message ?? 'Unknown error');
        },
        codeSent: (verificationId, _) {
          print('[Phone Login] OTP sent: $verificationId');
          codeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {
          print('[Phone Login] Auto-retrieval timeout: $verificationId');
        },
      );
    } catch (e) {
      print('[Phone Login] Error: $e');
      //Get.snackbar('Phone Login Failed', 'Unexpected error occurred');
    }
  }

  Future<void> verifyOTP(String verificationId, String smsCode) async {
    try {
      final cred = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      final userCred = await _auth.signInWithCredential(cred);
      print('[OTP Verification] Success: ${userCred.user?.uid}');
      await _loadUser(userCred.user);
      AppNavigator().navigateToAndReplace(AppRoutes.dashboard,);
    } on FirebaseAuthException catch (e) {
      print('[OTP Verification] FirebaseAuthException: ${e.code} - ${e.message}');
      //Get.snackbar('OTP Verification Failed', e.message ?? 'Unknown error');
      AlertInfo.show(
        context: Get.context!,
        text: '[OTP Verification] FirebaseAuthException: ${e.code} - ${e.message}',
        icon: Icons.person,
        typeInfo: TypeInfo.success,
      );
    } catch (e) {
      print('[OTP Verification] Error: $e');
      AlertInfo.show(
        context: Get.context!,
        text: 'OTP Verification Failed, Unexpected error occurred',
        icon: Icons.person,
        typeInfo: TypeInfo.error,
      );
      //Get.snackbar('OTP Verification Failed', 'Unexpected error occurred');
    }
  }

  // ------------------ LOAD USER ------------------

  Future<void> _loadUser(User? firebaseUser) async {
    try {
      if (firebaseUser != null) {
        final u = await _firebaseService.getUser(firebaseUser.uid);
        if (u != null) {
          user.value = u;
          print('[Load User] Loaded existing user: ${u.uid}');
        } else {
          final newUser = UserModel(
            uid: firebaseUser.uid,
            name: firebaseUser.displayName ?? '',
            email: firebaseUser.email ?? '',
          );
          await _firebaseService.createUser(newUser);
          user.value = newUser;
          print('[Load User] Created new user: ${newUser.uid}');
        }
        //Get.offAllNamed('/home');
      } else {
        print('[Load User] Firebase user is null');
      }
    } catch (e) {
      print('[Load User] Error: $e');
      //Get.snackbar('User Load Failed', 'Unable to load user');
    }
  }

  // ------------------ SIGN OUT ------------------

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.disconnect();
      user.value = null;
      print('[Sign Out] User signed out');
      //Get.offAllNamed('/onboarding');
    } catch (e) {
      print('[Sign Out] Error: $e');
      //Get.snackbar('Sign Out Failed', 'Unexpected error occurred');
    }
  }
}

