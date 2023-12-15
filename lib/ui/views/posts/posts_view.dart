import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'posts_viewmodel.dart';

class PostsView extends StackedView<PostsViewModel> {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PostsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  PostsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PostsViewModel();
}
