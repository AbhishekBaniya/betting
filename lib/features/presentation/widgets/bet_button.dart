import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../core/utils/services/firebase_service.dart';
import '../../data/model/bet_model.dart';
import '../../data/model/event_model.dart';
import '../controller/auth/app_auth_controller.dart';

class BetButton extends StatefulWidget {
  final EventModel event;
  BetButton({required this.event});

  @override
  _BetButtonState createState() => _BetButtonState();
}

class _BetButtonState extends State<BetButton> with SingleTickerProviderStateMixin {
  final authController = Get.put(AppAuthController());
  final FirebaseService firebaseService = FirebaseService();

  late AnimationController _controller;
  late Animation<double> _animation;

  bool _betPlaced = false;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticInOut),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: ElevatedButton(
        onPressed: _betPlaced ? null : () async {
          final user = authController.currentUser;
          /*if (user == null) {
            print("Error Login first");
            //Get.snackbar("Error", "Login first");
            return;
          }*/
          final bet = BetModel(
            id: const Uuid().v4(),
            userId: user?.uid ?? Random().nextInt(10).toString(),
            teamId: widget.event.teamA,
            amount: 50,
          );
          await firebaseService.placeBet(bet);

          // Animate button
          _controller.forward().then((_) => _controller.reverse());
          setState(() => _betPlaced = true);

          print("Win Guaranteed! You placed a no-loss bet. You can only gain!");
          //Get.snackbar("Win Guaranteed!", "You placed a no-loss bet. You can only gain!");
        },
        child: Text(_betPlaced ? 'Bet Placed' : 'Bet (No-loss)'),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
