import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> match;

  MatchDetailsScreen({required this.match});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(match['name']),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Goals: ${match['goals']}'),
          Text('Running Time: ${match['runningTime']}'),
          // Add other details as needed
        ],
      ),
    );
  }
}
