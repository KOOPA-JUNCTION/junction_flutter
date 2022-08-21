abstract class FGBPApiInterface {
  Future<Map> loginWithWallet(String address, {String type});
  Future<void> getNftList();
  Future<Map> getNftPopular();
  Future<Map> getNftPick();
  Future<Map> getNftRank();
  Future<void> search(String query, String offset);
  Future<void> uploadImage(String image);
}
