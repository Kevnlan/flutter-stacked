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
        document: gql(viewModel.nodeQL),
        variables: {"imageCategory": "coffee"},
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          print(
            result.exception.toString(),
          );
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
        final images = result.data!['images'] as List<dynamic>;

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
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      final ship = images[index];
                      return ListTile(
                        leading: Container(
                          width: 100,
                              height: 100,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              ship['url'],
                              
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        title: Text(ship['title']),
                        subtitle: Text("${ship['category']}"),
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
