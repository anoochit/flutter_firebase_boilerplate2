import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const.dart';
import '../controller/app_controller.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final AppController appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          // avatar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 60,
              child: Text(appController.getUserDisplayNameShort()),
            ),
          ),
          // name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(appController.getUserDisplayName())),
          ),
          // email
          Center(child: Text(appController.getUserEmail())),

          // action
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Sign Out"),
            onTap: () {
              auth.signOut();
              Get.offAllNamed("/signin");
            },
          )
        ],
      ),
    );
  }
}
