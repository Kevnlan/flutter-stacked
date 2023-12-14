import 'package:flutter/material.dart';
import 'package:flutter_application_stacked/ui/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewFuture>.reactive(
      viewModelBuilder: () => HomeViewFuture(),
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("User List"),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const Text("the list of users goes here"),
                  model.isBusy
                      ? const Center(child: CircularProgressIndicator())
                      : model.data != null
                          ? Expanded(
                              child: ListView.separated(
                                itemCount: model.data!.length,
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var item = model.data![index];
                                  return Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: Image.network(item.picture),
                                          ),
                                           const SizedBox(width: 20),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Name: ${item.firstName + ' ' + item.lastName}",
                                                  style: const TextStyle(
                                                    color: Colors.amberAccent,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  "ID: ${item.id}",
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                          : const Center(child: Text("No Data")),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
