import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:animate_do/animate_do.dart';
import 'ProjectDetailPage.dart';

void main() => runApp(ScorecardScreen());

class ScorecardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Performance Scorecard App'),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProjectProgressTable(),
                SizedBox(height: 16),
                LdCard(),
                SizedBox(height: 16),
                MatricesOfProjectCard(),
                SizedBox(height: 16),
                IqScoreCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectProgressTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Project Progress',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 16),
                Table(
                  border: TableBorder.all(
                    color: Colors.grey.shade300,
                    width: 1,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  children: [
                    _buildTableRow(
                      context,
                      ['Title', 'To be Initiated', 'In Progress', 'Completed', '% Achievement'],
                      isHeader: true,
                    ),
                    _buildTableRow(context, ['Marketing Projects', '5', '10', '8', '80%']),
                    _buildTableRow(context, ['Retail Project', '3', '5', '4', '80%']),
                    _buildTableRow(context, ['Digital Project', '2', '4', '3', '75%']),
                    _buildTableRow(context, ['R&D Project', '4', '6', '5', '83%']),
                    _buildTableRow(context, ['Other Project', '1', '2', '1', '50%']),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Daily',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildTableRow(BuildContext context, List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration: isHeader
          ? BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      )
          : null,
      children: cells
          .map(
            (cell) => GestureDetector(
          onTap: () {
            if (!isHeader) {
              // Navigate to detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectDetailPage(
                    title: cells[0],
                    numProjects: int.parse(cells[1]),
                  ),
                ),
              );
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            alignment: Alignment.center,
            decoration: !isHeader
                ? BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            )
                : null,
            child: Text(
              cell,
              style: TextStyle(
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                color: isHeader ? Colors.blue : Colors.black,
                fontSize: isHeader ? 16 : 14,
              ),
            ),
          ),
        ),
      )
          .toList(),
    );
  }
}


class LdCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'L&D (Learning & Development)',
                  style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                BounceInLeft(
                  child: AnimatedCounter(
                    label: 'Number of ideas generated:',
                    value: 4, // Example value
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 16),
                BounceInRight(
                  child: AnimatedCounter(
                    label: 'Number of business cases:',
                    value: 5, // Example value
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 16),
                BounceInUp(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of hours invested:',
                        style: TextStyle(fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      AnimatedCounter(
                        label: '',
                        value: 120, // Example value in hours
                        color: Colors.orange,
                      ),
                      Text(
                        'hours', // Display the unit as a separate text widget
                        style: TextStyle(fontSize: 14, color: Colors.orange),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Weekly',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// Animated Counter Widget
class AnimatedCounter extends StatefulWidget {
  final String label;
  final int value;
  final Color color;

  const AnimatedCounter({required this.label, required this.value, required this.color});

  @override
  _AnimatedCounterState createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = IntTween(begin: 0, end: widget.value).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        SizedBox(width: 8),
        Text(
          '${_animation.value}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: widget.color),
        ),
      ],
    );
  }
}

// Matrices of the Project Card Widget
class MatricesOfProjectCard extends StatefulWidget {
  @override
  _MatricesOfProjectCardState createState() => _MatricesOfProjectCardState();
}

class _MatricesOfProjectCardState extends State<MatricesOfProjectCard> {
  String selectedProject = 'Marketing Projects';

  final Map<String, Map<String, double>> projectData = {
    'Marketing Projects': {
      'TAT': 0.75,
      'Quality of Insights': 0.8,
      'Quality of Presentation': 0.85,
      'Actionability of Insights': 0.9,
    },
    'Retail Project': {
      'TAT': 0.65,
      'Quality of Insights': 0.7,
      'Quality of Presentation': 0.75,
      'Actionability of Insights': 0.8,
    },
    'Digital Project': {
      'TAT': 0.85,
      'Quality of Insights': 0.9,
      'Quality of Presentation': 0.95,
      'Actionability of Insights': 0.85,
    },
    'R&D Project': {
      'TAT': 0.7,
      'Quality of Insights': 0.75,
      'Quality of Presentation': 0.8,
      'Actionability of Insights': 0.9,
    },
    'Other Project': {
      'TAT': 0.6,
      'Quality of Insights': 0.65,
      'Quality of Presentation': 0.7,
      'Actionability of Insights': 0.75,
    },
    'Overall Rating': {
      'TAT': 0.75,
      'Quality of Insights': 0.8,
      'Quality of Presentation': 0.85,
      'Actionability of Insights': 0.9,
    },
  };

  final List<Color> pieChartColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.indigo,
    Colors.amber,
    Colors.cyan,
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Calculate the available width for the pie charts
            double availableWidth = constraints.maxWidth;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Metrices of Projects',
                  style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                DropdownButton<String>(
                  value: selectedProject,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedProject = newValue!;
                    });
                  },
                  items: projectData.keys.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                // Use Wrap to manage dynamic layout
                Wrap(
                  spacing: 16.0, // Space between pie charts
                  runSpacing: 16.0, // Space between rows
                  children: projectData[selectedProject]!.entries.toList().asMap().entries.map((entry) {
                    int index = entry.key;
                    MapEntry<String, double> data = entry.value;
                    return buildPieChart(data.key, data.value, pieChartColors[index % pieChartColors.length]);
                  }).toList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildPieChart(String label, double percent, Color color) {
    return FractionallySizedBox(
      widthFactor: 0.45, // Adjust the width factor as needed
      child: CircularPercentIndicator(
        radius: 80.0,
        lineWidth: 13.0,
        animation: true,
        percent: percent,
        center: Text(
          "${(percent * 100).toInt()}%",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        footer: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: color,
        backgroundColor: color.withOpacity(0.2),
      ),
    );
  }
}

class IqScoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double iqScorePercent = 0.8; // Example: 120 out of 150 gives 80% (0.8)

    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'IQ Score',
              style: TextStyle(fontSize: 18, color: Colors.purple, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 15.0,
              animation: true,
              percent: iqScorePercent, // Percentage of IQ score
              center: Text(
                "120",  // Example IQ score
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0, color: Colors.purple),
              ),
              footer: Text(
                "Out of 150",  // Example total IQ score
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.purple,
              backgroundColor: Colors.purple.shade100,
            ),
          ],
        ),
      ),
    );
  }
}