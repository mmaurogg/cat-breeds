import 'package:catbreeds/data/repositories/cat_breed_repository_impl.dart';
import 'package:catbreeds/domain/entities/cat_breed_entity.dart';
import 'package:catbreeds/domain/repositories/cat_breed_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catBreedUseCaseProvider = Provider<CatBreedUseCase>((ref) {
  final catbreedRepository = ref.watch(catBreedRepositoryProvider);
  return CatBreedUseCase(catbreedRepository);
});

class CatBreedUseCase {
  final CatbreedRepository _catbreedRepository;

  CatBreedUseCase(this._catbreedRepository);

  Future<List<CatBreedModel>?>? getCatbreeds() {
    return _catbreedRepository.getCatbreeds();
  }

  Future<List<CatBreedModel>?>? searchCatbreeds(String text) {
    return _catbreedRepository.searchCatbreeds(text);
  }

  Future<List<CatBreedModel>?>? getNextCatbreeds(int page) {
    return _catbreedRepository.getNextCatbreeds(page);
  }

  Future<CatBreedModel?> getBreedById(String id) {
    return _catbreedRepository.getBreedById(id);
  }
}
