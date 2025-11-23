import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboard')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').orderBy('credits', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          final users = snapshot.data!.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(child: Text(user['name'][index])),
                title: Text(user['name']),
                trailing: Text('Credits: ${user['credits']}'),
              );
            },
          );
        },
      ),
    );
  }
}
