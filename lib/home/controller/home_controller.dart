import 'package:get/get.dart';
import 'package:v_express/routes/app_routes.dart';

class HomeController extends GetxController {
  @override
  void onInit() {}

  void onPressAddMethod() {
    Get.toNamed(AppRoutes.addbusScreen);
  }

  void onPressSearch() {
    Get.toNamed(AppRoutes.searchBusScreen);
  }

  void onPressRewardPoints() {
    Get.toNamed(AppRoutes.rewardPointsScreen);
  }

  void onPressProfile() {
    Get.toNamed(AppRoutes.profileScreen);
  }
}
