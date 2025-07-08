import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_auth_with_supabase/pages/auth.dart';
import 'package:google_auth_with_supabase/pages/notes.dart';
import 'package:google_auth_with_supabase/repos/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

  const iosClientId = String.fromEnvironment('GCP_IOS_CLIENT_ID');
  const webClientId = String.fromEnvironment('GCP_WEB_CLIENT_ID');

  await GoogleSignIn.instance.initialize(
    clientId: iosClientId,
    serverClientId: webClientId,
  );

  final supabase = await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  final authRepo = AuthRepo(supabase);

  runApp(MyApp(supabase: supabase, authRepo: authRepo));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.supabase, required this.authRepo, super.key});
  final Supabase supabase;
  final AuthRepo authRepo;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider<AuthRepo>.value(value: authRepo)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: supabase.client.auth.onAuthStateChange,
          builder: (context, snap) {
            final session = snap.data?.session;
            if (session == null) {
              return AuthPage();
            } else {
              return NotesPage();
            }
          },
        ),
      ),
    );
  }
}
