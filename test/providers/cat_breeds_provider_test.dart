import 'package:catbreeds/domain/entities/cat_breed_entity.dart';
import 'package:catbreeds/domain/usecases/cat_breed_use_case.dart';
import 'package:catbreeds/presentation/providers/cat_breeds_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCatBreedUseCase extends Mock implements CatBreedUseCase {}

void main() {
  late MockCatBreedUseCase mockCatBreedUseCase;
  late ProviderContainer container;

  setUp(() {
    mockCatBreedUseCase = MockCatBreedUseCase();
    container = ProviderContainer(
      overrides: [
        catBreedUseCaseProvider.overrideWithValue(mockCatBreedUseCase),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('CatBreedsNotifier', () {
    test('loadCatBreeds actualiza el estado con las razas de gatos', () async {
      // Mock de datos
      final mockCatBreeds = [
        CatBreedModel(id: '1', name: 'Breed 1'),
        CatBreedModel(id: '2', name: 'Breed 2'),
      ];

      // Configuracion del mock para devolver datos
      when(
        mockCatBreedUseCase.getCatbreeds(),
      ).thenAnswer((_) async => mockCatBreeds);

      // Obtener el notifier
      final notifier = container.read(catBreedsProvider.notifier);

      // Ejecucion del método
      await notifier.loadCatBreeds();

      // Verificacion del estado
      final state = container.read(catBreedsProvider);
      expect(state.catBreeds, mockCatBreeds);
      expect(state.isLoading, false);
      expect(state.error, isNull);
    });

    test('loadCatBreeds maneja errores correctamente', () async {
      // Configuracion del mock para lanzar una excepción
      when(mockCatBreedUseCase.getCatbreeds()).thenAnswer((_) async => null);

      // Obtener el notifier
      final notifier = container.read(catBreedsProvider.notifier);

      // Ejecucion del método
      await notifier.loadCatBreeds();

      // Verificacion del estado
      final state = container.read(catBreedsProvider);
      expect(state.catBreeds, isEmpty);
      expect(state.isLoading, false);
      expect(state.error, 'Fallo al cargar las razas de gatos');
    });

    test(
      'searchCatBreeds actualiza el estado con resultados de búsqueda',
      () async {
        // Mock de datos
        final mockSearchResults = [
          CatBreedModel(id: '3', name: 'Search Result 1'),
        ];

        // Configuracion del mock para devolver datos
        when(
          mockCatBreedUseCase.searchCatbreeds('query'),
        ).thenAnswer((_) => Future.value(mockSearchResults));

        // Obtener el notifier
        final notifier = container.read(catBreedsProvider.notifier);

        // Ejecucion del método
        await notifier.searchCatBreeds('query');

        // Verificacion del estado
        await Future.delayed(Duration.zero);
        final state = container.read(catBreedsProvider);
        expect(state.catBreeds, mockSearchResults);
        expect(state.isSearching, true);
        expect(state.isLoading, false);
        expect(state.error, null);
      },
    );

    test('searchCatBreeds maneja errores correctamente', () async {
      // Configuracion del mock para lanzar una excepción
      when(
        mockCatBreedUseCase.searchCatbreeds('query'),
      ).thenAnswer((_) async => null);

      // Obtener el notifier
      final notifier = container.read(catBreedsProvider.notifier);

      // Ejecucion del método
      await notifier.searchCatBreeds('query');

      // Verificacion del estado
      final state = container.read(catBreedsProvider);
      expect(state.catBreeds, isEmpty);
      expect(state.isSearching, true);
      expect(state.isLoading, false);
      expect(state.error, 'No se encontraron resultados');
    });

    test('loadNextPage agrega más razas al estado', () async {
      // Mock de datos
      final initialCatBreeds = [CatBreedModel(id: '1', name: 'Breed 1')];
      final nextPageCatBreeds = [CatBreedModel(id: '2', name: 'Breed 2')];

      // Configuracion del mock para devolver datos
      when(
        mockCatBreedUseCase.getCatbreeds(),
      ).thenAnswer((_) async => initialCatBreeds);
      when(
        mockCatBreedUseCase.getNextCatbreeds(1),
      ).thenAnswer((_) async => nextPageCatBreeds);

      // Obtener el notifier
      final notifier = container.read(catBreedsProvider.notifier);

      // Carga la primera página
      await notifier.loadCatBreeds();

      // Carga la siguiente página
      await notifier.loadNextPage(1);

      // Verificacion del estado
      final state = container.read(catBreedsProvider);
      expect(state.catBreeds.length, 2);
      expect(state.catBreeds[1].id, '2');
      expect(state.isLoading, false);
      expect(state.error, isNull);
    });
  });
}
