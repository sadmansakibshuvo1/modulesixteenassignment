import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';

import 'match_details_screen.dart';

class MatchListScreen extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match List'),
      ),
      body: FutureBuilder(
        future: databaseReference.child('matches').once(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {

            List matches = (snapshot.data as DataSnapshot).value as List<dynamic> ?? [];

         // Check if 'matches' is not null before using it
            return ListView.builder(
              itemCount: matches.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(matches[index]['name']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MatchDetailsScreen(
                          match: matches[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );


          }
        },
      ),
    );
  }
}

class DataSnapshot {
  get value => null;
  
}







class FirebaseDatabase {
  static var instance;

}




