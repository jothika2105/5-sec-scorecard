import 'package:flutter/material.dart';

class ProjectDetailPage extends StatelessWidget {
  final String title;
  final int numProjects;

  ProjectDetailPage({required this.title, required this.numProjects});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> projects = List.generate(
      numProjects,
          (index) {
        String status;
        if (index % 3 == 0) {
          status = 'Completed';
        } else if (index % 3 == 1) {
          status = 'In Progress';
        } else {
          status = 'To Be Initiated';
        }

        return {
          'name': 'Project ${index + 1}',
          'status': status,
          'tat': 5 + index * 2, // TAT in days
          'insightsQuality': (index % 5) + 1 + 0.25 * (index % 4), // Quality score with decimal
          'presentationQuality': (index % 4) + 1 + 0.25 * (index % 3), // Quality score with decimal
          'actionability': (index % 3) + 2 + 0.5 * (index % 2), // Actionability score with decimal
        };
      },
    );

    Color getStatusColor(String status) {
      switch (status) {
        case 'Completed':
          return Colors.green;
        case 'In Progress':
          return Colors.orange;
        case 'To Be Initiated':
          return Colors.red;
        default:
          return Colors.grey;
      }
    }

    Widget buildStarRating(double rating) {
      int fullStars = rating.floor();
      double fractionalPart = rating - fullStars;
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(fullStars, (index) => Icon(
            Icons.star,
            color: Colors.amber,
            size: 20.0,
          )),
          if (fractionalPart >= 0.5)
            Icon(
              Icons.star_half,
              color: Colors.amber,
              size: 20.0,
            ),
          if (fullStars < 5)
            Icon(
              Icons.star_border,
              color: Colors.amber,
              size: 20.0,
            ),
          SizedBox(width: 8.0),
          Text(
            rating.toStringAsFixed(2),
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$title Projects'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Project Details',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columnSpacing: 24.0,
                    dataRowHeight: 80.0, // Adjusted for star ratings
                    headingRowHeight: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Status',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'TAT (Days)',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Quality of Insights',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Quality of Presentation',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Actionability of Insights',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                        ),
                      ),
                    ],
                    rows: projects.map((project) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Text(
                              project['name'],
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          DataCell(
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: getStatusColor(project['status']).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                child: Text(
                                  project['status'],
                                  style: TextStyle(
                                    color: getStatusColor(project['status']),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text(
                                '${project['tat']}',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: buildStarRating(project['insightsQuality']),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: buildStarRating(project['presentationQuality']),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: buildStarRating(project['actionability']),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}