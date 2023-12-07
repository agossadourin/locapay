import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:locapay/app/modules/artisans_principal/controllers/artisans_principal_controller.dart';
import 'package:locapay/app/modules/principal/controllers/principal_controller.dart';
import 'package:locapay/app/modules/principal/controllers/user_controller.dart';
import 'package:locapay/app/modules/principal/controllers/wallet_controller.dart';
import 'package:locapay/app/modules/principal/dashboard/services_pages/controllers/services_item_controller.dart';
import 'package:locapay/app/modules/principal/dashboard/transactions_pages/controllers/transaction_controller.dart';
import 'package:locapay/app/modules/principal/my_locations/controllers/locations_controller.dart';
import 'package:locapay/app/modules/principal/payments/controllers/payment_type_controller.dart';
import 'package:locapay/app/modules/proprio_principal/controllers/proprio_principal_controller.dart';
import 'package:locapay/app/modules/register/controllers/account_type_controller.dart';
import 'package:locapay/app/modules/register/controllers/file_controller.dart';
import 'package:locapay/app/modules/register/controllers/locations_data_controller.dart';
import 'package:locapay/app/modules/register/controllers/transactions_controller.dart';
import 'package:locapay/app/modules/splash_screen/splash_screen.dart';

import 'app/data/services/storage/storage_services.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  Get.put(AccountTypeController());
  Get.put(PrincipalController());
  Get.put(FileController());
  Get.put(UserController());
  Get.put(WalletController());
  Get.put(PaymentTypeController());
  Get.put(ServicesItemController());
  Get.put(TransactionController());
  Get.put(LocationsController());
  Get.put(ProprioPrincipalController());
  Get.put(ArtisansPrincipalController());
  Get.put(LocationsDataController());
  Get.put(TransactionsController());

  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00DBB7),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
