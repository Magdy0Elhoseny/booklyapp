import 'package:bookly_app/Features/search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/Features/search/persentation/manger/search_cubit/search_cubit.dart';
import 'package:bookly_app/core/models/models.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/persentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/home/persentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/persentation/views/home_view.dart';
import 'package:bookly_app/Features/search/persentation/views/seach_view.dart';
import 'package:bookly_app/Features/splash/presentaion/views/splashview.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const ksearchView = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getit.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: ksearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(getit.get<SearchRepoImpl>()),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
