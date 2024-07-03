import 'dart:io';
import 'dart:math';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/models/models.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchTheSearchedBooks(
      {required String query}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=$query');
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {
          log(item);
        }
      }
      return right(books);
    } on DioException catch (e) {
      final failure = ServerFailure.fromDioException(e);
      return left(failure);
    } on SocketException catch (e) {
      final failure = ServerFailure.fromSocketException(e);
      return left(failure);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
