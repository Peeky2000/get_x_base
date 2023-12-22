import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:ebook_name/core/helper/lib/data_connection_checker.dart';

class NetworkChecker {
  NetworkChecker();

  StreamSubscription? _subscription;
  StreamSubscription? _subscriptionDataChecker;
  RxBool isConnected = false.obs;
  final DataConnectionChecker _checker = DataConnectionChecker();
  bool _isCheckFirst = true;

  Future<void> init() async {
    _checker.addresses = [
      AddressCheckOptions(
        InternetAddress('1.1.1.1'),
        port: 53,
        timeout: const Duration(seconds: 10),
      ),
      AddressCheckOptions(
        InternetAddress('1.0.0.1'),
        port: 53,
        timeout: const Duration(seconds: 10),
      ),
      AddressCheckOptions(
        InternetAddress('8.8.8.8'),
        port: 53,
        timeout: const Duration(seconds: 10),
      ),
      AddressCheckOptions(
        InternetAddress('8.8.4.4'),
        port: 53,
        timeout: const Duration(seconds: 10),
      ),
      AddressCheckOptions(
        InternetAddress('208.67.222.222'),
        port: 53,
        timeout: const Duration(seconds: 10),
      ),
      AddressCheckOptions(
        InternetAddress('208.67.220.220'),
        port: 53,
        timeout: const Duration(seconds: 10),
      ),
    ];
    _checker.checkInterval = const Duration(seconds: 15);
    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      isConnected.value = false;
    } else {
      isConnected.value = await _checker.hasConnection;
    }
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        _subscriptionDataChecker = _checker.onStatusChange.listen((status) {
          isConnected.value = status == DataConnectionStatus.connected;
        });
      } else {
        isConnected.value = false;
        if (_isCheckFirst) {
          _isCheckFirst = !_isCheckFirst;
        }
        _subscriptionDataChecker?.cancel();
      }
    });
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
  }
}
