import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.deepPurple.shade200), // Set header color to deep purple
        ),
        backgroundColor: Colors.deepPurple.shade900, // Dark purple for the AppBar background
        elevation: 0, // Remove the shadow under the app bar
        iconTheme: IconThemeData(color: Colors.white), // Ensure back button is also white
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple.shade200, Colors.deepPurple.shade900], // Gradient colors
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display the logo with a white background
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white, // White background for the logo
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/cavinkar.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Card for input fields with adjusted size
                Card(
                  elevation: 8,
                  color: Colors.deepPurple.shade300, // Slightly lighter purple for the card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Adjust card height based on content
                      children: [
                        // Email field
                        TextField(
                          style: TextStyle(color: Colors.black), // White text
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.deepPurple.shade200), // Deep purple label
                            prefixIcon: Icon(Icons.email, color: Colors.deepPurple.shade200), // Deep purple icon
                            filled: true,
                            fillColor: Colors.deepPurple.shade50, // Light purple background for the input
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white), // Deep purple border
                            ),
                          ),
                        ),
                        SizedBox(height: 10), // Space between fields
                        // Password field
                        TextField(
                          obscureText: true,
                          style: TextStyle(color: Colors.black), // White text
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.deepPurple.shade200), // Deep purple label
                            prefixIcon: Icon(Icons.lock, color: Colors.deepPurple.shade200), // Deep purple icon
                            filled: true,
                            fillColor: Colors.deepPurple.shade50, // Light purple background for the input
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white), // Deep purple border
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Login button with enhanced styling
                ElevatedButton(
                  onPressed: () {
                    // Implement login logic here
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade700, // Deep purple button
                    foregroundColor: Colors.white, // White text color
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    shadowColor: Colors.black26,
                    elevation: 8,
                  ),
                ),
                SizedBox(height: 15), // Space between button and text
                // Sign Up navigation button with styled text
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    'Don\'t Have An Account? SIGN UP',
                    style: TextStyle(
                      color: Colors.deepPurple.shade200, // Deep purple text
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 10), // Space between button and text
                // Forgot password button
                TextButton(
                  onPressed: () {
                    // Implement "Forgot your password?" logic here
                  },
                  child: Text(
                    'Forgot Your Password?',
                    style: TextStyle(
                      color: Colors.deepPurple.shade200, // Deep purple text
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
