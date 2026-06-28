import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/driver_dashboard_controller.dart';

class DriverDashboardView extends GetView<DriverDashboardController> {
  const DriverDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DriverDashboardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DriverDashboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
