import 'package:farm_your_food/app/repository/user_repository.dart';
import 'package:farm_your_food/app/controllers/auth_controller.dart';
import 'package:farm_your_food/app/models/user_model.dart';
import 'package:farm_your_food/global/enums/user_role.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Rx<UserModel?> appUser = Rx<UserModel?>(UserModel.empty());
  final AuthController authController = Get.find<AuthController>();

  UserModel get userData => appUser.value!;
  bool get isConsumer => userData.role == UserRole.consumer;
  String? get uid => authController.user?.uid;

  @override
  void onInit() {
    super.onInit();
    initCurrentUser();
  }

  Future<void> initCurrentUser() async {
    if (uid != null) {
      await getUser(uid!);
    }
  }

  Future<bool> createUser(UserModel user) async {
    try {
      await UserRepository.createUser(user);
      appUser.value = user;
      update();
      return true;
    } catch (e) {
      Get.snackbar('Error', 'Failed to create user: $e');
      return false;
    }
  }

  Future<bool> getUser(String id) async {
    try {
      UserModel? user = await UserRepository.getUser(id);
      appUser.value = user;
      update();
      return user != null;
    } catch (e) {
      Get.snackbar('Error', 'Failed to get user: $e');
      return false;
    }
  }

  Future<bool> updateUser(UserModel updatedUser) async {
    try {
      await UserRepository.createUser(
        updatedUser,
      );
      appUser.value = updatedUser;
      update();
      return true;
    } catch (e) {
      Get.snackbar('Error', 'Failed to update user: $e');
      return false;
    }
  }

  Future<bool> deleteUser(String id) async {
    try {
      await UserRepository.deleteUser(id);
      appUser.value = null;
      update();
      return true;
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete user: $e');
      return false;
    }
  }
}
