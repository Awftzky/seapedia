import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // Jika user belum login, tendang balik ke public-catalog (atau login)
    if (!AuthService.to.isLoggedIn.value) {
      return const RouteSettings(name: '/public-catalog');
    }
    // Jika sudah login, biarkan akses rute tersebut
    return null;
  }
}