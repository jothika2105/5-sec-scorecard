import 'package:flutter/material.dart';
import 'scorecard_screen.dart'; // Import the ScorecardScreen

class MarketingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> marketingTeam = [
      {'name': 'Lokeshwaran P K', 'position': 'Marketing Manager'},
      {'name': 'Athul Kishan', 'position': 'Marketing Executive'},
      {'name': 'Vikashini', 'position': 'Marketing Analyst'},
      {'name': 'Shreya Ramesh', 'position': 'Marketing Strategist'},
      {'name': 'Rishab S Jain', 'position': 'Marketing Specialist'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Marketing Team'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: marketingTeam.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.person, size: 40, color: Colors.blue),
              title: Text(
                marketingTeam[index]['name']!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                marketingTeam[index]['position']!,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScorecardScreen(),
                    settings: RouteSettings(
                      arguments: marketingTeam[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}