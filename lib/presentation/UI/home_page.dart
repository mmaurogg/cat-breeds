import 'package:flutter/material.dart';

import 'package:catbreeds/presentation/UI/cat_breed_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Cat Breeds")),
        body: CatBreedListPage(),
      ),
    );
  }
}
