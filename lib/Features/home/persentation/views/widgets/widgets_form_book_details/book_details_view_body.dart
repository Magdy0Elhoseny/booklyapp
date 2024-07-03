import 'package:bookly_app/core/models/models.dart';
import 'package:bookly_app/Features/home/persentation/views/widgets/widgets_form_book_details/book_details_section.dart';
import 'package:bookly_app/Features/home/persentation/views/widgets/widgets_form_book_details/custom_book_details_appbar.dart';
import 'package:bookly_app/Features/home/persentation/views/widgets/widgets_form_book_details/similar_book_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                const SizedBox(height: 20),
                BookDetailsSection(bookModel: bookModel),
                const Expanded(child: SizedBox(height: 47)),
                const SimilarBooksSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        )
      ],
    );
  }
}
