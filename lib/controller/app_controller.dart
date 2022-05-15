import 'package:get/get.dart';

import '../const.dart';

class AppController extends GetxController {
  AppController();

  getUserDisplayNameShort() {
    return auth.currentUser?.displayName ?? auth.currentUser!.email!.split('@')[0].substring(0, 2).toUpperCase();
  }

  getUserDisplayName() {
    return auth.currentUser?.displayName ?? auth.currentUser!.email!.split('@')[0].toUpperCase();
  }

  getUserEmail() {
    return auth.currentUser?.email ?? "null";
  }
}
