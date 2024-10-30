import 'package:firebase_auth/firebase_auth.dart';

class FirebaseApi {
  Future<bool> registerUser(String email, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print("el error es: ${e.message}");
      return false;
    } catch (e) {
      print("error : ${e.toString()}");
      return false;
    }
  }
}
