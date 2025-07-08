import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo {
  const AuthRepo(this.supabase);
  final Supabase supabase;

  Future<void> signingWithGoogle() async {
    try {
      final acc = await GoogleSignIn.instance.authenticate();
      final idToken = acc.authentication.idToken;

      if (idToken == null) throw Exception('id token is null');

      await supabase.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signout() async {
    await supabase.client.auth.signOut();
  }
}
