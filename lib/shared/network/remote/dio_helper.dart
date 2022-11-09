import 'package:dio/dio.dart';

class DioHelper {

  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://63321ac9a54a0e83d24c346d.mockapi.io/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
  }) async{
    return await dio.get(url);
  }

}