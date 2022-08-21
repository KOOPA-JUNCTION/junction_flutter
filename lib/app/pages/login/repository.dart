import 'package:firebase_getx_boilerplate/app/data/provider/api_interface.dart';

class LoginRepository {
  final FGBPApiInterface api;

  LoginRepository(this.api);

  ///returnes Login Result
  Future<Map> loginWithWallet(address, type) async =>
      api.loginWithWallet(address, type: type);
}
