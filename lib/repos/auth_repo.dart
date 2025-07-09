import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo {
  const AuthRepo(this.supabase);
  final Supabase supabase;

  Future<void> googleSignin() async {
    try {
      final googleSignin = GoogleSignIn.instance;
      final googleAccount = await googleSignin.authenticate();
      final idToken = googleAccount.authentication.idToken;
      if (idToken == null) return;

      await supabase.client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signout() async {
    try {
      await supabase.client.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
