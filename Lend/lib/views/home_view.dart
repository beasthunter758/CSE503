import 'package:Lend_A_Hand/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Reports'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),  
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            }
            )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 5, bottom: 5),
        child: FloatingActionButton(
          onPressed: () {
            // Implement Forms
          },
          tooltip: 'Report',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}