import 'package:bookly_app/core/models/models.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchTheSearchedBooks(
      {required String query});
}
