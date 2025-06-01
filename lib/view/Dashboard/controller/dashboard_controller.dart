import 'package:get/get.dart';

class DashboardController extends GetxController {
  var totalSales = 15.9.obs;
  var revenue = 5.1.obs;
  var totalOrders = 1952.obs;
  var products = 52.obs;
  void updateRevenue(double value) {
    revenue.value = value;
  }

  void updateSales(double value) {
    totalSales.value = value;
  }

  void updateOrders(int value) {
    totalOrders.value = value;
  }

  void updateProducts(int value) {
    products.value = value;
  }
}
