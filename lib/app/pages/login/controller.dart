import 'package:firebase_getx_boilerplate/app/routes/route.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController with StateMixin {
  @override
  void onInit() async {
    _storage = await SharedPreferences.getInstance();
    _accessToken.value = _storage.getString('accessToken');
    super.onInit();
  }

  late SharedPreferences _storage;
  RxBool checkLogin = false.obs;
  final Rx<String?> _accessToken = Rx(null);

  Future<void> _setAccessToken(String token) async {
    await _storage.setString('accessToken', token);
    _accessToken.value = token;
  }

  void login() {
    checkLogin.value = true;
    Get.toNamed(Routes.root);
  }

  String get accessToken => _accessToken.value!;

  bool get isLogined => _accessToken.value != null;
}
