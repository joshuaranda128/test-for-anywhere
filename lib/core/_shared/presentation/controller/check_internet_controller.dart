import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:demo_real_estate_project/core/utils/library/data_connection_checked/data_connection_checker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CheckInternetController extends GetxController {
  RxBool isConnected = false.obs;
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectionStream;
  StreamSubscription? dataConnectionStream;
  DataConnectionChecker dataConnectionChecker = DataConnectionChecker();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() {
    connectivity.checkConnectivity().then((result) async {
      if (result == ConnectivityResult.none) {
        /// Connection is not available
        isConnected.value = false;
      } else {
        /// Connection is available
        await dataConnectionChecker.hasConnection
            ? isConnected.value = true
            : isConnected.value = false;
      }
      debugPrint("Connected 0: ${isConnected.value}");
    });
    connectionStream = Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        /// Connection is not available
        isConnected.value = false;
      } else {
        /// Connection is available
        if (result != ConnectivityResult.mobile) {
          dataConnectionStream =
              DataConnectionChecker().onStatusChange.listen((status) {
            switch (status) {
              case DataConnectionStatus.connected:
                isConnected.value = true;
                debugPrint("Connected 1.2: ${isConnected.value}");
                break;
              case DataConnectionStatus.disconnected:
                isConnected.value = false;
                debugPrint("Connected 1.3: ${isConnected.value}");
                break;
            }
          });
        } else {
          /// Connected and not on wifi
          isConnected.value = true;
        }
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    connectionStream!.cancel();
    dataConnectionStream!.cancel();
  }
}
