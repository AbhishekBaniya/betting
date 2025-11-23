import 'package:flutter/material.dart';

import '../../../data/model/event_model.dart';
import '../../widgets/bet_button.dart';

class EventCard extends StatelessWidget {
  final EventModel event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Container(
        width: 250,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(event.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 10),
            Text('${event.teamA} vs ${event.teamB}'),
            SizedBox(height: 10),
            Text('Date: ${event.date}'),
            SizedBox(height: 10),
            BetButton(event: event,),
          ],
        ),
      ),
    );
  }
}
