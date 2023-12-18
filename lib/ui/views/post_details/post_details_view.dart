import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'post_details_viewmodel.dart';

class PostDetailsView extends StatelessWidget {
  const PostDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostDetailsViewModel>.reactive(
      viewModelBuilder: () => PostDetailsViewModel(),
      onViewModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return Container();
      },
    );
  }
}
