import 'package:flutter/material.dart';
import 'package:flutter_flavor/views/settings/settings_ui.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Get.to(SettingsUI());
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Home page"),
      ),
    );
  }
}
