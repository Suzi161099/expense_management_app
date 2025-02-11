import 'package:flutter/material.dart';
import 'package:expense_management_app/screen/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == "admin@example.com" && password == "123456") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ExpenseApp()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sai tài khoản hoặc mật khẩu!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pink.shade700, Colors.black],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Log in",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: 5),
                Text("Please sign in to continue",
                    style: TextStyle(fontSize: 16, color: Colors.white60)),
                SizedBox(height: 40),
                TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.white70),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.pink.shade900,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white70),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: const Color(0xFF880E4F),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    suffixText: "FORGOT",
                    suffixStyle: TextStyle(
                        color: Colors.redAccent, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade700,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("LOGIN",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text("Don’t have an account? Sign up",
                      style: TextStyle(color: Colors.white70)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
