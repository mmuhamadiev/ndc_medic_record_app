import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static signInWithEmail({required String email, required password}) async {
    final res = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    final User? user = res.user;
    return user;
  }

  static creteUserWithEmail({required String email, required password}) async {
    final res = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final User? user = res.user;
    return user;
  }

  static logOut() {
    return _auth.signOut();
  }

}

class UserHelper {
  static FirebaseFirestore _db = FirebaseFirestore.instance;
  static saveUser(User? user, String gender, int age, int height, int weight) async{
    Map<String, dynamic> userData = {
      'email': user?.email,
      'role': 'user',
      'gender': gender,
      'age': age,
      'height': height,
      'weight': weight,
    };

    _db.collection('users').doc(user?.uid).set(userData);
  }

  static updateUserBMI(User? user, String gender, String age, String height, String weight) async{
    final userRef = _db.collection('users').doc(user?.uid);
    if((await userRef.get()).exists) {
    await userRef.update({
      'gender': gender,
      'age': age,
      'height': height,
      'weight': weight,
    });
    }
    else{
      print('User not exists');
    }
  }

}
