import 'package:catbreeds/domain/entities/cat_breed_entity.dart';

abstract class CatbreedRepository {
  Future<List<CatBreedModel>?>? getCatbreeds();
  Future<List<CatBreedModel>?>? getNextCatbreeds(int page);
  Future<CatBreedModel?> getBreedById(String id);
  Future<List<CatBreedModel>?>? searchCatbreeds(String text);
}
