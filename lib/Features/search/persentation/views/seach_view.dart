import 'package:bookly_app/Features/search/persentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}
