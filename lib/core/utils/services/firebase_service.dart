import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:salesbetting/core/utils/app_logger.dart';
import 'package:uuid/uuid.dart';

import '../../../features/data/model/bet_model.dart';
import '../../../features/data/model/event_model.dart';
import '../../../features/data/model/team_model.dart';
import '../../../features/data/model/user_model.dart';

/*
class FirebaseService {
  final FirebaseFirestore cloudFirestore = FirebaseFirestore.instance;

  // Users
  Future<void> createUser(UserModel user) async {
    await cloudFirestore.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<UserModel?> getUser(String uid) async {
    final doc = await cloudFirestore.collection('users').doc(uid).get();
    if (!doc.exists) return null;
    return UserModel.fromMap(doc.data()!);
  }

  // Teams
  Future<List<TeamModel>> getTeams() async {
    final snapshot = await cloudFirestore.collection('teams').get();
    return snapshot.docs.map((e) => TeamModel.fromMap(e.data())).toList();
  }

  // Events
  Future<List<EventModel>> getEvents() async {
    final snapshot = await cloudFirestore.collection('events').get();
    return snapshot.docs.map((e) => EventModel.fromMap(e.data())).toList();
  }

  // Bets
  Future<void> placeBet(BetModel bet) async {
    await cloudFirestore.collection('bets').doc(bet.id).set(bet.toMap());
    // No-loss: Credits never decrease
    await cloudFirestore.collection('users').doc(bet.userId).update({
      'credits': FieldValue.increment(0),
    });
  }

  Future<void> updateBetWin(BetModel bet) async {
    await cloudFirestore.collection('bets').doc(bet.id).update({'won': true});
    // Gain credits if won
    await cloudFirestore.collection('users').doc(bet.userId).update({
      'credits': FieldValue.increment(bet.amount),
    });
  }

  // Public getter to expose firestore
  FirebaseFirestore get cloudsFirestore => cloudFirestore;
}
*/
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseService {
  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance..setLanguageCode('en');

  // Public getter for Firestore
  FirebaseFirestore get cloudFirestore => _firestore;




  // ------------------ Firebase Initialization ------------------
  Future<bool> isFirebaseInitialized() async {
    try {
      cloudFirestore.app.name; // simple check
      return true;
    } catch (e) {
      Logger().error('Firebase not initialized: $e');
      return false;
    }
  }

  // ------------------ Auth Helpers ------------------
  User? get currentUser => _auth.currentUser;

  bool isUserLoggedIn() => _auth.currentUser != null;

  // Email signup
  Future<User?> signupWithEmail(String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      Logger().error('Signup Error [${e.code}]: ${e.message}');
      rethrow;
    } catch (e) {
      Logger().error('Signup Error: $e');
      rethrow;
    }
  }

  // Email login
  Future<User?> loginWithEmail(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return cred.user;
    } on FirebaseAuthException catch (e) {
      Logger().error('Login Error [${e.code}]: ${e.message}');
      rethrow;
    } catch (e) {
      Logger().error('Login Error: $e');
      rethrow;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Logger().error('User logged out successfully');
    } catch (e) {
      Logger().error('Logout Error: $e');
      rethrow;
    }
  }

  // ------------------ Users ------------------
  Future<void> createUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set(user.toMap());
      print('User created successfully: ${user.uid}');
    } catch (e) {
      print('Create user error: $e');
      rethrow;
    }
  }

  Future<void> createTeam(TeamModel team) async {
    try {
      await _firestore.collection('teams').doc(team.id).set(team.toMap());
      print('User created successfully: ${team.id}');
    } catch (e) {
      print('Create user error: $e');
      rethrow;
    }
  }

  Future<void> createEvent(EventModel event) async {
    try {
      await _firestore.collection('events').doc(const Uuid().v4()).set(event.toMap());
      print('Event created successfully: ${event.id}');
    } catch (e) {
      print('Create Event error: $e');
      rethrow;
    }
  }

  Future<UserModel?> getUser(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (!doc.exists) return null;
      return UserModel.fromMap(doc.data()!);
    } catch (e) {
      print('Get user error: $e');
      rethrow;
    }
  }

  // ------------------ Teams ------------------
  Future<List<TeamModel>> getTeams() async {
    try {
      final snapshot = await _firestore.collection('teams').get();
      return snapshot.docs.map((e) => TeamModel.fromMap(e.data())).toList();
    } catch (e) {
      print('Get teams error: $e');
      rethrow;
    }
  }

  // ------------------ Events ------------------
  Future<List<EventModel>> getEvents() async {
    try {
      final snapshot = await _firestore.collection('events').get();
      return snapshot.docs.map((e) => EventModel.fromMap(e.data())).toList();
    } catch (e) {
      print('Get events error: $e');
      rethrow;
    }
  }

  // ------------------ Bets ------------------
  Future<void> placeBet(BetModel bet) async {
    try {
      await _firestore.collection('bets').doc(bet.id).set(bet.toMap());
      // No-loss: Credits never decrease
      await _firestore.collection('users').doc(bet.userId).update({
        'credits': FieldValue.increment(0),
      });
      print('Bet placed successfully: ${bet.id}');
    } catch (e) {
      print('Place bet error: $e');
      rethrow;
    }
  }

  Future<void> updateBetWin(BetModel bet) async {
    try {
      await _firestore.collection('bets').doc(bet.id).update({'won': true});
      // Gain credits if won
      await _firestore.collection('users').doc(bet.userId).update({
        'credits': FieldValue.increment(bet.amount),
      });
      print('Bet marked as won: ${bet.id}');
    } catch (e) {
      print('Update bet win error: $e');
      rethrow;
    }
  }
}

