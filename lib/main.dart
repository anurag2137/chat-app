import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:wallify_ui/screen_/home_screen.dart';
import 'package:wallify_ui/screen_/login_screen.dart';
import 'package:wallify_ui/services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<AuthService>(
          builder: (context, authService, _) {
            switch (authService.authState) {
              case AuthState.authenticated:
                return HomeScreen();
              case AuthState.unauthenticated:
              default:
                return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
