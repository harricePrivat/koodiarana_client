import 'package:http/http.dart' as http;

class SendData {
  Future<http.Response> goPost(String url, Object object) async {
    final response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: object);

    return response;
  }

  Future<http.Response> goGet(String url) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
      },
    );

    return response;
  }
}
