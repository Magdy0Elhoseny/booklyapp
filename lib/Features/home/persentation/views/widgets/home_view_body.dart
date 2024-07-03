import 'package:bookly_app/Features/home/persentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly_app/Features/home/persentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/persentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomAppBar(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: FeaturedBooksListView(),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newest Books',
                  style: Styles.title18w600,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        ),
        // SliverFillRemaining(
        //    بتخلي اللسيت متحملش كل الاجزاء اللي جواها عشان متقلش ف الابليكشن

        // ),
      ],
    );
  }
}
