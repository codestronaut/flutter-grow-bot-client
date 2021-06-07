import 'package:dio/dio.dart';

class NetworkHelper {
  final String url;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? body;
  NetworkHelper({
    required this.url,
    this.headers,
    this.body,
  });

  final client = Dio();

  Future post() async {
    try {
      final response = await client.post(url, data: body);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(response.statusCode); // LOG
      }
    } on DioError catch (e) {
      throw e;
    } catch (e) {
      print(e);
    }
  }
}
