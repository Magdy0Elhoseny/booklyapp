import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:bookly_app/core/models/models.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchTheSearchedBooks({required String query}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchTheSearchedBooks(query: query);
    result.fold(
        (failure) => {
              emit(
                SearchFailure(failure.errMessage),
              )
            },
        (books) => {
              emit(
                SearchSuccess(books),
              ),
            });
  }
}
