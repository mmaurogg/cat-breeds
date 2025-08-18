import 'package:flutter/material.dart';

import 'package:catbreeds/presentation/UI/cat_breed_list_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Cat Breeds",
            /* style: TextStyle(
            color: applicationColors.whiteColor,
          ), */
          ),
        ),
        body: CatBreedListPage(),
      ),
    );
  }
}
