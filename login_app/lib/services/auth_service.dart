import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Sign in with email and password
  Future<UserCredential?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      print("Login error: ${e.message}");
      return null;
    }
  }

  // Register with email and password
  Future<UserCredential?> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      print("Register error: ${e.message}");
      return null;
    }
  }

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  // Sign in as Guest
  Future<UserCredential?> signInAsGuest({
    required String name,
    required String surname,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      User? user = userCredential.user;

      if (user != null) {
        await user.updateDisplayName("$name $surname");
        await user.reload();
      }

      return userCredential;
    } catch (e) {
      print("Guest Login Error: $e");
      return null;
    }
  }

  // Check auth state
  Future<bool> isUserLoggedIn() async {
    return _auth.currentUser != null;
  }

  // Check provider
  Future<String?> getUserProvider() async {
    final user = _auth.currentUser;
    if (user != null && user.providerData.isNotEmpty) {
      return user.providerData[0].providerId;
    }
    return null;
  }

  // Sign out
  Future<void> signOut() async {
    final provider = await getUserProvider();
    if (provider == 'google.com') await _googleSignIn.signOut();
    if (provider == 'facebook.com') await FacebookAuth.instance.logOut();
    await _auth.signOut();
  }

  // Get current user
  User? get currentUser => _auth.currentUser;

  // Listen to auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Failed to send password reset email: $e');
    }
  }
}
