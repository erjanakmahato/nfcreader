import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'app/routes/app_pages.dart';

bool isNfcAvailable = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  isNfcAvailable = await NfcManager.instance.isAvailable();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
