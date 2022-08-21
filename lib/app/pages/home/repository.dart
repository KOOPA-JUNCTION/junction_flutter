import 'package:firebase_getx_boilerplate/app/data/provider/api_interface.dart';

class HomeRepository {
  final FGBPApiInterface api;

  HomeRepository(this.api);

  ///returnes Login Result
  Future<Map> getNftPopular() => api.getNftPopular();
  Future<Map> getNftPick() => api.getNftPick();
}
