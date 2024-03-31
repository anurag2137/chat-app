import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'chat.dart'; // Import your ChatScreen widget from chat.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Android-specific initialization settings
  final InitializationSettings initializationSettingsAndroid =
  InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'));

  // Initialize the plugin with Android settings only
  await flutterLocalNotificationsPlugin.initialize(initializationSettingsAndroid);

  // Run the app
  runApp(MaterialApp(
    home: ChatScreen(),
  ));
}

