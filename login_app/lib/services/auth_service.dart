import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
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
      print("Starting Google Sign-In...");
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("Google Sign-In cancelled by user.");
        return null;
      }

      print("Google user retrieved: ${googleUser.email}");
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print("Signing in to Firebase with Google credentials...");
      final userCredential = await _auth.signInWithCredential(credential);

      print("Google Sign-In successful: ${userCredential.user?.email}");
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("Google Sign-In Firebase Error: ${e.message}");
      return null;
    } catch (e, stacktrace) {
      print("Google Sign-In Unknown Error: $e");
      print("Stacktrace: $stacktrace");
      return null;
    }
  }

  // Check if Google user is logged in
  Future<bool> isGoogleUserLoggedIn() async {
    final currentUser = _auth.currentUser;
    return currentUser != null &&
        currentUser.providerData.any((info) => info.providerId == "google.com");
  }

  // Sign out from Google
  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    print("User signed out from Google");
  }

  // Listen to auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Get current user
  User? get currentUser => _auth.currentUser;
}
