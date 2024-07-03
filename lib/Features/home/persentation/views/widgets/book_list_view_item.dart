import 'package:flutter/material.dart';
import 'package:bookly_app/core/models/models.dart';
import 'package:bookly_app/Features/home/persentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/persentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: Container(
        height: 130,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ??
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/832px-No-Image-Placeholder.svg.png',
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.title20.copyWith(
                        fontFamily: kGTSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    bookModel.volumeInfo.authors![0],
                    style: Styles.title14w500,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.title20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: bookModel.volumeInfo.averageRating ?? 0,
                        ratingCount: bookModel.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
