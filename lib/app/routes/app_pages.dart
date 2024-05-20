import 'package:farm_your_food/app/modules/add_product/bindings/add_product_bindings.dart';
import 'package:farm_your_food/app/modules/add_product/bindings/my_product_bindings.dart';
import 'package:farm_your_food/app/modules/add_product/views/add_product_page.dart';
import 'package:farm_your_food/app/modules/add_product/views/my_product_page.dart';
import 'package:farm_your_food/app/modules/auth/bindings/login_screen_bindings.dart';
import 'package:farm_your_food/app/modules/auth/bindings/registeration_screen_bindings.dart.dart';
import 'package:farm_your_food/app/modules/browse_product/bindings/browse_products_bindings.dart';
import 'package:farm_your_food/app/modules/browse_product/views/browse_products_page.dart';
import 'package:farm_your_food/app/modules/browse_stores/bindings/browse_stores_bindings.dart';
import 'package:farm_your_food/app/modules/browse_stores/pages/browse_stores_page.dart';
import 'package:farm_your_food/app/modules/consumer_dashboard/bindings/consumer_dashboard_bindings.dart';
import 'package:farm_your_food/app/modules/create_store/bindings/create_store_bindings.dart';
import 'package:farm_your_food/app/modules/create_store/pages/create_store_page.dart';
import 'package:farm_your_food/app/modules/farmer_dashboard/bindings/farmer_dashboard_bindings.dart';
import 'package:farm_your_food/app/modules/farmer_dashboard/page/farmer_dashboard_page.dart';
import 'package:farm_your_food/app/modules/landing/account_type_screen.dart';
import 'package:farm_your_food/app/modules/consumer_dashboard/page/consumer_dashboard_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../global/constants/constants.dart';
import '../modules/landing/intro_screen.dart';
import '../modules/landing/splash_page.dart';
import '../modules/auth/page/login_page.dart';
import '../modules/auth/page/registration_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static List<GetPage> getPages() {
    return [
      GetPage(
        name: Routes.splash,
        page: () => const SplashScreen(),
        transition: routeTransition,
      ),
      GetPage(
        name: Routes.intro,
        page: () => const IntroScreen(),
        transition: routeTransition,
      ),
      GetPage(
        name: Routes.accountType,
        page: () => const AccountType(),
        transition: routeTransition,
      ),
      GetPage(
        name: Routes.login,
        page: () => const LoginPage(),
        binding: LoginScreenBindings(),
        transition: routeTransition,
      ),
      GetPage(
        name: Routes.signup,
        page: () => const RegistrationPage(),
        binding: RegistrationScreenBinding(),
        transition: routeTransition,
      ),
      GetPage(
        name: Routes.farmerDashboard,
        page: () => const FarmerDashboardPage(),
        binding: FarmerDashboardBindings(),
        transition: routeTransition,
      ),
      GetPage(
          name: Routes.createStore,
          page: () => const CreateStorePage(),
          binding: CreateStoreBindings(),
          transition: routeTransition),
      // GetPage(
      //     name: Routes.addProducts,
      //     page: () => const AddProducts(),
      //     binding: InitialBindings(),
      //     transition: routeTransition),
      GetPage(
        name: Routes.consumerDashboard,
        page: () => const ConsumerDashboardPage(),
        binding: ConsumerDashboardBindings(),
        transition: routeTransition,
      ),
      GetPage(
        name: Routes.myProducts,
        page: () => const MyProductPage(),
        binding: MyProductBindings(),
        transition: routeTransition,
      ),
      GetPage(
        name: Routes.addProducts,
        page: () => AddProductPage(),
        binding: AddProductBindings(),
        transition: routeTransition,
      ),
      GetPage(
        name: Routes.browseProducts,
        page: () => BrowseProductsPage(),
        binding: BrowseProductsBindings(),
        transition: routeTransition,
      ),
      GetPage(
        name: Routes.browseStores,
        page: () => BrowseStoresPage(),
        binding: BrowseStoresBindings(),
        transition: routeTransition,
      ),
      // GetPage(
      //     name: Routes.order,
      //     page: () => const OrderScreen(),
      //     binding: InitialBindings(),
      //     transition: routeTransition),
      // GetPage(
      //     name: Routes.checkOrders,
      //     page: () => const CheckOrdersScreen(),
      //     binding: InitialBindings(),
      //     transition: routeTransition),
    ];
  }
}
