import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/models.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
        (failure) => {
              emit(
                FeaturedBooksFailure(failure.errMessage),
              )
            },
        (books) => {
              emit(
                FeaturedBooksSuccess(books),
              ),
            });
  }
}
