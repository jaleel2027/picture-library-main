import 'package:get/get.dart';
import 'package:picture_library/dashboard/controller/dashboard_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController(), tag: DashboardController().toString());
  }
}
