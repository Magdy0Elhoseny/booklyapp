import 'package:bookly_app/Features/home/persentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/Features/search/persentation/manger/search_cubit/search_cubit.dart';
import 'package:bookly_app/Features/search/persentation/views/widgets/custom_search_shadow_widget.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(
            child: Text('Search for a book'),
          );
        } else if (state is SearchLoading) {
          return const CustomSearchShadowWidget();
        } else if (state is SearchSuccess) {
          return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(
                    bookModel: state.books[index],
                  ),
                );
              });
        } else if (state is SearchFailure) {
          return const Center(child: Text("DATA NOT FOUND"));
        } else {
          return const Center(
              child: Text(
            "DATA NOT FOUND",
            style: Styles.title30,
          ));
        }
      },
    );
  }
}
