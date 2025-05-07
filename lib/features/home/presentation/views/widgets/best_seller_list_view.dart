import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import '../../manager/newest_books_cubit/newest_books_state.dart';
import 'book_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return SliverList.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return SliverToBoxAdapter(child: ErrorWidget(state.errMessage));
        } else {
          return SliverToBoxAdapter(child: const CustomLoadingIndicator());
        }
      },
    );
  }
}
