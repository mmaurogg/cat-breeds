import 'package:catbreeds/config/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiSource {
  final http.Client client;

  ApiSource(this.client);

  final token = Constants.catBreedApiKey;

  Future<T?> getApi<T>(Uri url) async {
    try {
      final response = await client.get(url, headers: {'x-api-key': token});

      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse);
        return jsonResponse;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}
