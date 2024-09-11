import 'package:flutter/material.dart';

class AppDataService {
  static final _appDataService = AppDataService._internal();
  final navigatorKey = GlobalKey<NavigatorState>();
  BuildContext? context;
  factory AppDataService() {
    return _appDataService;
  }
  AppDataService._internal();
}

final appDataService = AppDataService();
