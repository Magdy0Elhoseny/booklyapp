import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/persentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/persentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getit.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getit.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
