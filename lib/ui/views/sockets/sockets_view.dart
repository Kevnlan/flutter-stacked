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
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: viewModel.users['data'] == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: viewModel.users['data'].length,
                  itemBuilder: (context, index) {
                    var user = viewModel.users['data'][index];
                    return ListTile(
                      title:
                          Text('${user['first_name']}  ${user['last_name']}'),
                      subtitle: Text('${user['email']}'),
                    );
                  },
                ),
        ),
      ),
    );
  }

  @override
  SocketsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SocketsViewModel();

  @override
  void onViewModelReady(SocketsViewModel viewModel) {
    // This method will be called when the ViewModel is ready
    viewModel.initSocket();
    super.onViewModelReady(viewModel);
  }
}
