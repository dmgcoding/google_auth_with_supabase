import 'package:flutter/material.dart';
import 'package:notes_with_supabase/pages/auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

//get these from envs in production
const supabaseUrl = 'https://wifcjyjplkfnjotxbfjn.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndpZmNqeWpwbGtmbmpvdHhiZmpuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTExMDI0ODAsImV4cCI6MjA2NjY3ODQ4MH0.7MnrLO02jZJes5kdR73eOfbuGU1UgXkpqjaYGVlu7qc';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  final supabase = await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AuthPage());
  }
}
