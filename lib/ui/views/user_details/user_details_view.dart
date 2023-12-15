import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'user_details_viewmodel.dart';

class UserDetailsView extends StackedView<UserDetailsViewModel> {
  const UserDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UserDetailsViewModel viewModel,
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
  UserDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserDetailsViewModel();
}
