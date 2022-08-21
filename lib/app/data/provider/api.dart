import 'dart:html';

import 'package:dio/dio.dart';
import 'package:firebase_getx_boilerplate/app/data/provider/api_interface.dart';
import 'package:firebase_getx_boilerplate/app/pages/login/controller.dart';
import 'package:get/get.dart';

class FGBPInterceptor extends Interceptor {
  final Dio _dioInstance;
  FGBPInterceptor(this._dioInstance);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          true, // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    };
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }
}

class FGBPApiProvider implements FGBPApiInterface {
  final Dio dio = Dio();
  final baseUrl = "http://59.1.4.101:3000";

  FGBPApiProvider() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(FGBPInterceptor(dio));
  }

  @override
  Future<Map> loginWithWallet(String address,
      {String type = "hex, bech32, base58"}) async {
    String url = "/auth/wallet";
    Map data = {"address": address, "type": type};
    final response = await dio.post(url, data: data);

    return response.data;
  }

  @override
  Future<void> getNftList() async {
    String url = "/nfts";

    dio.get(url);
  }

  @override
  Future<Map> getNftRank() async {
    String url = "/nfts/rank";
    final response = await dio.get(url);

    return response.data;
  }

  @override
  Future<Map> getNftPopular() async {
    String url = "/nfts/popular";
    final response = await dio.get(url);
    return response.data;
  }

  @override
  Future<Map> getNftPick() async {
    String url = "/nfts/pick";
    final response = await dio.get(url);
    return response.data;
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
