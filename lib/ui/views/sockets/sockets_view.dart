import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sockets_viewmodel.dart';

class SocketsView extends StackedView<SocketsViewModel> {
  const SocketsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SocketsViewModel viewModel,
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
  SocketsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SocketsViewModel();
}
