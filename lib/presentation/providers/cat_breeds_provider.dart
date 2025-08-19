import 'package:catbreeds/domain/entities/cat_breed_entity.dart';
import 'package:catbreeds/domain/usecases/cat_breed_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final catBreedsProvider =
    StateNotifierProvider<CatBreedsNotifier, CatBreedState>((ref) {
      final catBreedUseCase = ref.watch(catBreedUseCaseProvider);
      return CatBreedsNotifier(catBreedUseCase);
    });

class CatBreedsNotifier extends StateNotifier<CatBreedState> {
  final CatBreedUseCase _catBreedUseCase;

  CatBreedsNotifier(this._catBreedUseCase) : super(CatBreedState());

  Future<void> loadCatBreeds() async {
    state = state.copyWith(isLoading: true);
    await _catBreedUseCase
        .getCatbreeds()!
        .then((catBreeds) {
          if (catBreeds != null) {
            state = state.copyWith(
              catBreeds: catBreeds,
              isSearching: false,
              isLoading: false,
            );
          } else {
            state = state.copyWith(
              error: 'Fallo al cargar las razas de gatos',
              isSearching: false,
              isLoading: false,
            );
          }
        })
        .catchError((error) {
          state = state.copyWith(error: error.toString(), isLoading: false);
        });
  }

  Future<void> loadNextPage(int page) async {
    state = state.copyWith(isLoading: true);
    await _catBreedUseCase
        .getNextCatbreeds(page)!
        .then((catBreeds) {
          if (catBreeds != null) {
            final updatedCatBreeds = List<CatBreedModel>.from(state.catBreeds)
              ..addAll(catBreeds);
            state = state.copyWith(
              catBreeds: updatedCatBreeds,
              isSearching: false,
              isLoading: false,
            );
          } else {
            state = state.copyWith(
              error: 'Fallo al cargar más razas de gatos',
              isSearching: false,
              isLoading: false,
            );
          }
        })
        .catchError((error) {
          state = state.copyWith(error: error.toString(), isLoading: false);
        });
  }

  Future<void> searchCatBreeds(String query) async {
    if (query.isEmpty) {
      await loadCatBreeds();
      return;
    }
    state = state.copyWith(isLoading: true);
    await _catBreedUseCase
        .searchCatbreeds(query)!
        .then((catBreeds) {
          if (catBreeds != null && catBreeds.isNotEmpty) {
            state = state.copyWith(
              catBreeds: catBreeds,
              isSearching: true,
              isLoading: false,
            );
          } else {
            state = state.copyWith(
              error: 'No se encontraron resultados',
              catBreeds: [],
              isSearching: true,
              isLoading: false,
            );
          }
        })
        .catchError((error) {
          state = state.copyWith(error: error.toString(), isLoading: false);
        });
  }
}

class CatBreedState {
  final List<CatBreedModel> catBreeds;
  final bool isLoading;
  final bool isSearching;
  final String? error;

  CatBreedState({
    this.catBreeds = const [],
    this.isLoading = false,
    this.isSearching = false,
    this.error,
  });

  CatBreedState copyWith({
    List<CatBreedModel>? catBreeds,
    bool? isLoading,
    bool? isSearching,
    String? error,
  }) {
    return CatBreedState(
      catBreeds: catBreeds ?? this.catBreeds,
      isLoading: isLoading ?? this.isLoading,
      isSearching: isSearching ?? this.isSearching,
      error: error ?? this.error,
    );
  }
}
