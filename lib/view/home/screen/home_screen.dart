import 'dart:ui';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/view/drawer/screen/deawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/widget/defaultappbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);
    final controller = Get.put(HomeController());
    final items = [
      const DashboardCard(
        title: 'Total Sales',
        value: '15.9',
        dolar: '\$',
        k: 'k',
      ),
      const DashboardCard(
        title: 'Revenue',
        value: '5.1',
        showArrow: true,
        dolar: '\$',
        k: 'k',
      ),
      const DashboardCard(
        title: 'Total Orders',
        value: '1,952',
        dolar: '',
        k: '',
      ),
      const DashboardCard(
        title: 'Products',
        value: '52',
        dolar: '',
        k: '',
      ),
    ];

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 10 && !controller.isDrawerOpen) {
          controller.openDrawer();
        } else if (details.delta.dx < -10 && controller.isDrawerOpen) {
          controller.closeDrawer();
        }
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: DefaultAppBar(onMenuTap: controller.toggleDrawer),
            backgroundColor: AppColors.backgroundColor,
            body: Padding(
              padding: EdgeInsets.only(
                top: MediaQueryUtil.screenHeight / 52.75,
                left: MediaQueryUtil.screenWidth / 20.6,
                right: MediaQueryUtil.screenWidth / 20.6,
              ),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 23,
                runSpacing: 30,
                children: items,
              ),
            ),
          ),
          GetBuilder<HomeController>(
            builder: (controller) => controller.isDrawerOpen
                ? GestureDetector(
                    onTap: controller.closeDrawer,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: const SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          GetBuilder<HomeController>(
            builder: (controller) => AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: 0,
              bottom: 0,
              left: controller.isDrawerOpen ? 0 : -controller.drawerWidth,
              child: Material(
                elevation: MediaQueryUtil.screenWidth / 41.2,
                child: CustomDrawer(
                  width: controller.drawerWidth,
                  onClose: controller.closeDrawer,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;
  final bool showArrow;
  final String dolar;
  final String k;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    this.color,
    this.showArrow = false,
    required this.dolar,
    required this.k,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryUtil.screenWidth / 3,
      height: MediaQueryUtil.screenWidth / 5,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontFamily: FontFamily.montserrat,
                    fontSize: MediaQueryUtil.screenWidth / 19.5,
                    color: AppColors.darkGrey),
              ),
              if (showArrow)
                const Padding(
                  padding: EdgeInsets.only(left: 30),
                  child:
                      Icon(Icons.arrow_upward, color: Colors.green, size: 16),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Row(
              children: [
                Text(
                  dolar,
                  style: TextStyle(
                      fontSize: MediaQueryUtil.screenWidth / 20.5,
                      color: AppColors.primaryOrangeColor,
                      fontFamily: FontFamily.russoOne),
                ),
                Text(
                  textAlign: TextAlign.start,
                  value,
                  style: TextStyle(
                    fontSize: MediaQueryUtil.screenWidth / 15.5,
                    fontFamily: FontFamily.russoOne,
                    color: color ?? Colors.black,
                  ),
                ),
                Text(
                  k,
                  style: TextStyle(fontSize: MediaQueryUtil.screenWidth / 20.5),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
