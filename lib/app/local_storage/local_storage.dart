import 'package:farm_your_food/app/models/user_model.dart';
import 'package:farm_your_food/global/enums/user_role.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage {
  LocalStorage._();

  static final storage = GetStorage();

  static void setIntro(bool value) => storage.write('intro', value);
  static bool getIntro() => storage.read('intro') ?? false;

  static void setIsUserLoggedIn(bool value) =>
      storage.write('isUserLoggedIn', value);
  static bool isUserLoggedIn() => storage.read('isUserLoggedIn') ?? false;

  static void setUserName(String value) => storage.write('userName', value);
  static String getUserName() => storage.read('userName') ?? "";

  static void setAccountType(UserRole value) =>
      storage.write('accountType', value);
  static String getAccountType() => storage.read('accountType') ?? "";

  static void setUserId(String value) => storage.write('userId', value);
  static String getUserId() => storage.read('userId') ?? "";

  static void saveUserInfo(UserModel userModel) {
    setUserName(userModel.userName ?? "");
    setUserId(userModel.uid ?? "");
    setAccountType(userModel.role ?? UserRole.none);
  }

  static void removeUserDetails() {
    storage.remove('isUserLoggedIn');
    storage.remove('userName');
    storage.remove('userId');
    storage.remove('accountType');
  }
}
