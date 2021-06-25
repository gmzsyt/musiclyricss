import 'package:firebase_auth/firebase_auth.dart';

class LoginOrRegister {
  Future<bool>login(String email,String password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return true;
    }catch (e){
      return false;
    }
  }

  Future<bool> register(String email,String password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return true;
    } catch (e){
      return false;
    }
  }
}
