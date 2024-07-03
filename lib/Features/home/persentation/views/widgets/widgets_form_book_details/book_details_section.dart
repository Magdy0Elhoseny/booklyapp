import 'package:bookly_app/core/models/models.dart';
import 'package:bookly_app/Features/home/persentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/persentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/Features/home/persentation/views/widgets/widgets_form_book_details/custom_book_buttons.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.21),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/832px-No-Image-Placeholder.svg.png',
          ),
        ),
        const SizedBox(height: 45),
        Text(
          bookModel.volumeInfo.title ?? 'Title',
          textAlign: TextAlign.center,
          style: Styles.title30.copyWith(
            fontFamily: 'GT Sectra Fine',
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          bookModel.volumeInfo.authors![0],
          style: Styles.title18w600.copyWith(
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 14),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo.averageRating ?? 0.0,
          ratingCount: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(height: 30),
        CustomBookButtons(bookModel: bookModel),
      ],
    );
  }
}
