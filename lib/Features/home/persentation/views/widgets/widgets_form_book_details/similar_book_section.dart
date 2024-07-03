import 'package:bookly_app/Features/home/persentation/views/widgets/widgets_form_book_details/similar_books_listview.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.title14w500.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 15),
        const SimilarBooksListView(),
      ],
    );
  }
}
