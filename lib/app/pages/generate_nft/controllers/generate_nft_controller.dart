import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GenerateNftController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController startingPrice = TextEditingController();

  final List<String> blockchainList = [
    "Aurora",
    "Avalanche",
    "Binance",
    "Ethereum",
    "Fanton",
    "Moonbeam",
    "Polygon"
  ];
  RxString selectedBlockchain = "Aurora".obs;

  void dropDownChanged(value) => selectedBlockchain.value = value;

  final Rx<XFile?> file = Rx(null);

  @override
  void onInit() {
    file.value = Get.arguments?['file'] as XFile;
    super.onInit();
  }

  //final XFile file = ;

  void goToGenerateNFT() {
    Get.toNamed(Routes.generate_nft, arguments: {'file': file.value});
  }
}
