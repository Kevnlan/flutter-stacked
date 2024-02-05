import 'package:flutter/material.dart';
import 'package:flutter_application_stacked/ui/common/ui_helpers.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sizer/sizer.dart';
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
    return Query(
      options: QueryOptions(
        document: gql(viewModel.spaceXShips),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Scaffold(
            body: Center(
              child: Text(
                result.exception.toString(),
              ),
            ),
          );
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        // final dragons = result.data!['dragons'] as List<dynamic>;
        final ships = result.data!['ships'] as List<dynamic>;

        return Scaffold(
          appBar: AppBar(
            title: const Text('QraphQL Example'),
            elevation: 0,
          ),
          body: SafeArea(
            child: Column(
              children: [
                verticalSpaceSmall,
                verticalSpaceSmall,
                Expanded(
                  child: ListView.builder(
                    itemCount: ships.length,
                    itemBuilder: (context, index) {
                      final ship = ships[index];
                      return ListTile(
                        title: Text(ship['name']),
                        subtitle: Text("${ship['type']}"),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  QraphQlViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      QraphQlViewModel();
}
