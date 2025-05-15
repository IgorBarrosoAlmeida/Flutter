import 'package:dio/dio.dart';
import 'package:flutter_basico/service/dio_service.dart';

class DioServiceImp implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: "https://api.themoviedb.org/4/",
        headers: {
          'content-type': 'aplication/json;charset=utf-8',
          'authorization': 'Bearer TOKEN', // put the token here
        },
      ),
    );
  }
}
