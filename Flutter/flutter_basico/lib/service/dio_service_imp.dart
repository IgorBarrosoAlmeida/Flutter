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
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwY2ZkNDI0NGUyODRhMWIyYzBhNjNiNDhlZGY3MGE3YyIsIm5iZiI6MS43NDcyNTMzMzY5MzI5OTk4ZSs5LCJzdWIiOiI2ODI0Zjg1ODM0ZjBiNmQzODUyZDI1OWIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.4jJKcxV8Gdvv_SsnEaPzhY_8yUTTdnpgEh5erXykFtI',
        },
      ),
    );
  }
}
