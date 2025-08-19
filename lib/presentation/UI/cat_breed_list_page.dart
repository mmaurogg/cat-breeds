import 'package:catbreeds/presentation/providers/cat_breeds_provider.dart';
import 'package:catbreeds/presentation/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CatBreedListPage extends ConsumerStatefulWidget {
  const CatBreedListPage({super.key});

  @override
  ConsumerState<CatBreedListPage> createState() => _CatBreedListPageState();
}

class _CatBreedListPageState extends ConsumerState<CatBreedListPage> {
  final ScrollController _controller = ScrollController();

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    FlutterNativeSplash.remove();

    Future.microtask(() {
      ref.read(catBreedsProvider.notifier).loadCatBreeds();
    });

    _controller.addListener(scrollController);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  scrollController() {
    final currentCats = ref.read(catBreedsProvider);

    if (currentCats.isLoading) return;
    if (currentCats.isSearching) return;

    if (_controller.position.pixels + 200 >=
        _controller.position.maxScrollExtent) {
      ref
          .read(catBreedsProvider.notifier)
          .loadNextPage(currentCats.catBreeds.length ~/ 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    final catBreedsState = ref.watch(catBreedsProvider);
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: SearchBar(
              controller: _searchController,
              leading: Icon(Icons.search),
              onChanged: (value) {},
              onSubmitted: (value) async {
                await ref
                    .read(catBreedsProvider.notifier)
                    .searchCatBreeds(value);

                _controller.jumpTo(0);
              },
              trailing: [
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () async {
                    await ref.read(catBreedsProvider.notifier).loadCatBreeds();
                    _controller.jumpTo(0);
                    _searchController.clear();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Scrollbar(
                  controller: _controller,
                  child: SingleChildScrollView(
                    controller: _controller,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (catBreedsState.catBreeds.isNotEmpty)
                          ...catBreedsState.catBreeds.map(
                            (breed) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomCardView(
                                catType: breed,
                                onTap: () {
                                  context.push(
                                    "/cats/${breed.id}",
                                    extra: breed,
                                  );
                                },
                              ),
                            ),
                          ),
                        if (catBreedsState.isLoading)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        if (catBreedsState.error != null)
                          Center(
                            child: Text(
                              'Error: ${catBreedsState.error}',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
