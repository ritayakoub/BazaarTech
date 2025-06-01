import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dashboard_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Obx(() {
          final items = [
            DashboardItem(
              title: 'Total Sales',
              value: controller.totalSales.value.toStringAsFixed(1) + 'k',
              icon: Icons.shopping_cart_outlined,
              hasDollar: true,
            ),
            DashboardItem(
              title: 'Revenue',
              value: controller.revenue.value.toStringAsFixed(1) + 'k',
              icon: Icons.account_balance_wallet_outlined,
              hasDollar: true,
              showArrow: true,
            ),
            DashboardItem(
              title: 'Total Orders',
              value: controller.totalOrders.value.toString(),
              icon: Icons.local_shipping_outlined,
            ),
            DashboardItem(
              title: 'Products',
              value: controller.products.value.toString(),
              icon: Icons.widgets_outlined,
            ),
          ];

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.6,
            ),
            itemBuilder: (context, index) {
              return DashboardCard(item: items[index]);
            },
          );
        }),
      ),
    );
  }
}

class DashboardItem {
  final String title;
  final String value;
  final IconData icon;
  final bool hasDollar;
  final bool showArrow;

  DashboardItem({
    required this.title,
    required this.value,
    required this.icon,
    this.hasDollar = false,
    this.showArrow = false,
  });
}

class DashboardCard extends StatelessWidget {
  final DashboardItem item;

  const DashboardCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -10,
            right: -10,
            child: Icon(
              item.icon,
              size: 80,
              color: Colors.orange.withOpacity(0.1),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  if (item.showArrow)
                    const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(Icons.arrow_upward,
                          color: Colors.green, size: 16),
                    ),
                ],
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (item.hasDollar)
                    const Text(
                      '\$',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  Text(
                    item.value,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: item.hasDollar ? Colors.black : Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
