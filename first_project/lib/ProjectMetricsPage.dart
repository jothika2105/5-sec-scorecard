import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProjectMetricsPage extends StatelessWidget {
  final String projectName;

  // Define the weights for each metric
  final Map<String, double> metricWeights = {
    'TAT': 0.25,
    'Quality of Insights': 0.25,
    'Quality of Presentation': 0.25,
    'Actionability of Insights': 0.25,
  };

  ProjectMetricsPage({required this.projectName});

  double _calculateOverallScore(Map<String, double> metricsData) {
    double totalWeight = 0;
    double weightedSum = 0;

    metricsData.forEach((metric, value) {
      double weight = metricWeights[metric] ?? 0;
      weightedSum += value * weight;
      totalWeight += weight;
    });

    // Ensure totalWeight is not zero to avoid division by zero
    if (totalWeight == 0) {
      return 0;
    }

    return weightedSum / totalWeight;
  }

  @override
  Widget build(BuildContext context) {
    // Example data for metrics
    Map<String, double> metricsData = {
      'TAT': 75,
      'Quality of Insights': 85,
      'Quality of Presentation': 65,
      'Actionability of Insights': 80,
    };

    // Calculate the overall score
    double overallScore = _calculateOverallScore(metricsData);

    return Scaffold(
      appBar: AppBar(
        title: Text('$projectName Metrics'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Slightly Smaller Animated Card for Overall Score at the top
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16), // Reduced padding for a smaller card
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16), // Smaller corner radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Slightly lighter shadow
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4), // Reduced offset for a subtler elevation
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    style: TextStyle(
                      fontSize: 32, // Slightly smaller font size
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade800,
                    ),
                    child: Text(
                      '${overallScore.toStringAsFixed(1)}',
                    ),
                  ),
                  SizedBox(height: 8), // Slightly reduced spacing between score and label
                  Text(
                    'Overall Score',
                    style: TextStyle(
                      fontSize: 16, // Slightly smaller font size for the label
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16), // Reduced spacing below the card
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Metrics Overview',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Center(
                            child: Wrap(
                              spacing: 16.0,
                              runSpacing: 16.0,
                              children: metricsData.entries.map((entry) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.35, // Adjust width based on screen size
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircularPercentIndicator(
                                        radius: 80.0, // Smaller radius for the pie chart
                                        lineWidth: 10.0,
                                        animation: true,
                                        percent: entry.value / 100,
                                        center: Text(
                                          '${entry.value}%',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        circularStrokeCap: CircularStrokeCap.round,
                                        progressColor: Colors.primaries[metricsData.keys.toList().indexOf(entry.key) % Colors.primaries.length],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        entry.key,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
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
