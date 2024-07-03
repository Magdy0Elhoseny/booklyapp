import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.ratingCount,
  });
  final MainAxisAlignment mainAxisAlignment;
  final dynamic rating;
  final int ratingCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          weight: 14,
          size: 14,
        ),
        const SizedBox(width: 7),
        Text(
          rating.toString(),
          style: Styles.title16med,
        ),
        const SizedBox(width: 9),
        Text(
          '(${ratingCount.toString()})',
          style: Styles.title14.copyWith(
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
