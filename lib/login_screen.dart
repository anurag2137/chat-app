import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  void _handleGoogleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (error) {
      print('Error signing in with Google: $error');
      // Handle sign-in errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle email/password login
            // Replace with your authentication logic
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: Text('Login with Email/Password'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _handleGoogleSignIn(context);
        },
        label: Text('Sign in with Google'),
        icon: Icon(Icons.login),
      ),
    );
  }
}
