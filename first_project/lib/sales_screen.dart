import 'package:flutter/material.dart';



class SalesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> salesTeam = [
      {'name': 'John Doe', 'position': 'Sales Manager'},
      {'name': 'Jane Smith', 'position': 'Sales Executive'},
      {'name': 'Michael Brown', 'position': 'Sales Representative'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Team'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: salesTeam.length,
        itemBuilder: (context, index) {
          final employee = salesTeam[index];
          final name = employee['name']!;
          final position = employee['position']!;

          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.person, size: 40, color: Colors.green),
              title: Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                position,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.green),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/Scorecard',
                  arguments: {
                    'name': name,
                    'position': position,
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
