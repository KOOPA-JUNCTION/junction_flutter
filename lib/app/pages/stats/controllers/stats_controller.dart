import 'package:get/get.dart';

class StatsController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;
}
