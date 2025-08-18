import 'package:catbreeds/data/datasources/catbreed_api_source.dart';
import 'package:catbreeds/data/models/cat_breed_response.dart';
import 'package:catbreeds/domain/entities/cat_breed_entity.dart';
import 'package:catbreeds/domain/repositories/cat_breed_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catBreedRepositoryProvider = Provider<CatbreedRepository>((ref) {
  final catbreedApiSource = ref.watch(catBreedDataSourceProvider);
  return CatbreedRepositoryImpl(catbreedApiSource);
});

class CatbreedRepositoryImpl implements CatbreedRepository {
  final CatbreedApiSource _catbreedApiSource;

  CatbreedRepositoryImpl(this._catbreedApiSource);

  @override
  Future<List<CatBreedResponse>?>? getCatbreeds() {
    return _catbreedApiSource.getCatbreeds();
  }

  @override
  Future<List<CatBreedResponse>?>? searchCatbreeds(String text) {
    return _catbreedApiSource.searchCatbreeds(text);
  }

  @override
  Future<List<CatBreedResponse>?>? getNextCatbreeds(int page) {
    return _catbreedApiSource.getNextCatbreeds(page);
  }

  @override
  Future<CatBreedModel?> getBreedById(String id) {
    return _catbreedApiSource.getBreedById(id);
  }
}
