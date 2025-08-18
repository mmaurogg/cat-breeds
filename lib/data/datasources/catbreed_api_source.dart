import 'package:catbreeds/data/datasources/api_source.dart';
import 'package:catbreeds/data/models/cat_breed_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final catBreedDataSourceProvider = Provider<CatbreedApiSource>((ref) {
  return CatbreedApiSourceImpl(http.Client());
});

abstract class CatbreedApiSource {
  Future<List<CatBreedResponse>?> getCatbreeds();
  Future<List<CatBreedResponse>?> getNextCatbreeds(int page);
  Future<CatBreedResponse?> getBreedById(String id);
  Future<List<CatBreedResponse>?> searchCatbreeds(String text);
}

class CatbreedApiSourceImpl extends ApiSource implements CatbreedApiSource {
  CatbreedApiSourceImpl(super.client);

  final String _baseUrl = 'api.thecatapi.com';

  @override
  Future<List<CatBreedResponse>?> getCatbreeds() async {
    const String endPoint = '/v1/breeds';
    final url = Uri.https(_baseUrl, endPoint, {"limit": "10", "page": "0"});

    return await getApi(url).then((jsonResponse) {
      final catbreedsResponse =
          (jsonResponse as List).map((e) {
            return CatBreedResponse.fromJson(e);
          }).toList();

      return catbreedsResponse;
    });
  }

  @override
  Future<List<CatBreedResponse>?> getNextCatbreeds(int page) async {
    const String endPoint = '/v1/breeds';
    final url = Uri.https(_baseUrl, endPoint, {
      "limit": "10",
      "page": page.toString(),
    });

    return await getApi(url).then((jsonResponse) {
      final catbreedsResponse =
          (jsonResponse as List).map((e) {
            return CatBreedResponse.fromJson(e);
          }).toList();

      return catbreedsResponse;
    });
  }

  @override
  Future<List<CatBreedResponse>?> searchCatbreeds(String text) async {
    const String endPoint = '/v1/breeds/search';
    final url = Uri.https(_baseUrl, endPoint, {"q": text});

    return await getApi(url).then((jsonResponse) {
      final catbreedsResponse =
          (jsonResponse as List).map((e) {
            return CatBreedResponse.fromJson(e);
          }).toList();

      return catbreedsResponse;
    });
  }

  @override
  Future<CatBreedResponse?> getBreedById(String id) async {
    final String endPoint = '/v1/breeds/$id';
    final url = Uri.https(_baseUrl, endPoint);

    return await getApi(url).then((jsonResponse) {
      if (jsonResponse == null) return null;
      return CatBreedResponse.fromJson(jsonResponse);
    });
  }
}
