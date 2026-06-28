import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/role_selection_controller.dart';

class RoleSelectionView extends GetView<RoleSelectionController> {
  const RoleSelectionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RoleSelectionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RoleSelectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
