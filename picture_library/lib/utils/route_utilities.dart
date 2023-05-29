import 'package:get/get.dart';
import 'package:picture_library/bindings/controller_bindings.dart';
import 'package:picture_library/dashboard/view/dashboard_screen.dart';
import 'package:picture_library/home/view/home_screen.dart';
import 'package:picture_library/splash/view/splash_screen.dart';

import '../details/view/picture_details_screen.dart';

class RouteUtilities {
  static const String root = "/";
  static const String splashScreen = "/splashScreen";
  static const String pictureDetails = "/pictureDetails";

  static const String homeScreen = "/homeScreen";
  static const String dashboard = "/dashboard";
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: root,
        page: () => const SplashScreen(),
        binding: ControllerBindings(),
      ),
      GetPage(
        name: splashScreen,
        page: () => const SplashScreen(),
        binding: ControllerBindings(),
      ),
      GetPage(
        name: dashboard,
        page: () => DashboardScreen(),
        binding: ControllerBindings(),
      ),
      GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
        binding: ControllerBindings(),
      ),
      GetPage(
        name: pictureDetails,
        page: () => const PictureDetails(),
        binding: ControllerBindings(),
      ),
    ];
  }
}
