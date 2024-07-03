import 'package:bookly_app/Features/search/persentation/manger/search_cubit/search_cubit.dart';
import 'package:bookly_app/Features/search/persentation/views/widgets/custom_search_form.dart';
import 'package:bookly_app/Features/search/persentation/views/widgets/search_result_listview.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            hintText: 'Search',
            onChanged: (value) {
              BlocProvider.of<SearchCubit>(context)
                  .fetchTheSearchedBooks(query: value);
            },
            onSaved: (value) {},
            maxLines: 1,
          ),
          const SizedBox(height: 5),
          const Text(
            'Search Results',
            style: Styles.title18w600,
          ),
          const SizedBox(height: 16),
          const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
