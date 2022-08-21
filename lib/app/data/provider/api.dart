import 'dart:html';

import 'package:dio/dio.dart';
import 'package:firebase_getx_boilerplate/app/data/provider/api_interface.dart';

class FGBPInterceptor extends Interceptor {
  final Dio _dioInstance;
  FGBPInterceptor(this._dioInstance);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}

class FGBPApiProvider implements FGBPApiInterface {
  final Dio dio = Dio();
  final baseUrl = "https:...";

  FGBPApiProvider() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(FGBPInterceptor(dio));
  }

  @override
  Future<void> loginWithWallet(String address,
      {String type = "hex, bech32, base58"}) async {
    String url = "/auth/wallet";
    Map data = {"address": address, "type": type};
    final response = dio.post(url, data: data);

    return;
  }

  @override
  Future<void> getNftList() async {
    String url = "/nfts";
    dio.get(url);
  }

  @override
  Future<void> getNftRank() async {
    String url = "/nfts/rank";
    dio.get(url);
  }

  @override
  Future<void> search(String query, String offset) async {
    String url = "/search";
    dio.get(url, queryParameters: {
      "query": query,
      "offset": offset,
    });
    return;
  }

  @override
  Future<void> uploadImage(String image) async {
    Map data = {"image": image};
    String url = "/upload/image";
    dio.post(url, data: data);
    return;
  }
}
