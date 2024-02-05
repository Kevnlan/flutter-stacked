import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'qraph_ql_viewmodel.dart';

class QraphQlView extends StackedView<QraphQlViewModel> {
  const QraphQlView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    QraphQlViewModel viewModel,
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
  QraphQlViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QraphQlViewModel();
}
