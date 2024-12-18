import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionManager extends ChangeNotifier {
  bool isConnected = false;

  bool get getConnectivity => isConnected;

  void setConnectivity(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      isConnected = false;
    } else {
      isConnected = true;
    }
    notifyListeners();
  }
}
