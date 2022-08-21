import 'package:firebase_getx_boilerplate/app/data/provider/api_interface.dart';

class NftRankRepository {
  final FGBPApiInterface api;
  NftRankRepository(this.api);

  ///returnes Login Result
  Future<Map> getNftRank() async => api.getNftRank();
}
