import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
        centerTitle: true,
        backgroundColor: Colors.pink.shade900,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New Password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter new password",
              ),
            ),
            SizedBox(height: 20),
            Text("Confirm Password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Confirm new password",
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add password change logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink.shade900,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("CHANGE PASSWORD", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("BACK TO LOGIN", style: TextStyle(fontSize: 16, color: Colors.pink.shade900)),
            ),
          ],
        ),
      ),
    );
  }
}