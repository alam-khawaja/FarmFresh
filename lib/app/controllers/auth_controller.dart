import 'package:farm_your_food/global/utils/app_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final _user = Rx<User?>(null);

  @override
  void onInit() async {
    super.onInit();
    _user.bindStream(auth.userChanges());
  }

  User? get user => _user.value;
  bool get userLoggedIn => _user.value != null;

  Future<User> createUserWithEmail(String emailAddress, String password) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        e.code,
        e.message.toString(),
      );
      throw AppException(
        'Something Went Wrong',
        e.message ?? '',
      );
    }
  }

  Future<User> signInUserWithEmail(String emailAddress, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw AppException(
        'Something Went Wrong',
        e.message ?? '',
      );
    }
  }

  Future<void> signOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw AppException(
        'Something Went Wrong',
        e.message ?? '',
      );
    }
  }

  Future<void> deleteUserAuthentication({
    required String emailAddress,
    required String password,
  }) async {
    try {
      if (user != null) {
        await auth.signInWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
        await user?.delete();
      }
    } on FirebaseAuthException catch (e) {
      throw AppException(
        'Something Went Wrong',
        e.message ?? '',
      );
    }
  }
}
