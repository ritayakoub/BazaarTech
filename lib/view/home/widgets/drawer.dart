import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final double width;
  final VoidCallback onClose;

  const CustomDrawer({super.key, required this.width, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: MediaQueryUtil.screenWidth / 41.2,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Container(
        width: width,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: const SafeArea(
            child: Column(
          children: [],
        )),
      ),
    );
  }
}
