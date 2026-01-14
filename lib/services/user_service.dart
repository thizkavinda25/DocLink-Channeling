import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_channeling/models/user_model.dart';

class UserService {
  final userCollection = FirebaseFirestore.instance.collection('Users');

  Future<bool> saveUserData(UserModel user) async {
    try {
      await userCollection.doc(user.uid).set(user.toJson());
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<UserModel?> getUserById(String uid) async {
    final doc = await userCollection.doc(uid).get();
    if (doc.exists) {
      return UserModel.fromJson(doc.data()!);
    }
    return null;
  }
}
