import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_application_stacked/ui/common/app_colors.dart';
import 'package:flutter_application_stacked/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewFuture>.reactive(
      viewModelBuilder: () => HomeViewFuture(),
      builder: (context, viewModel, _) {
        return Scaffold(
          // appBar: AppBar(
          //   title: const Text("User List"),
          // ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  verticalSpaceSmall,
                  const Text(
                    'Hello, STACKED!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  verticalSpaceMedium,
                  Expanded(
                    child: viewModel.isBusy
                        ? const Center(child: CircularProgressIndicator())
                        : viewModel.data != null
                            ? ListView.separated(
                                itemCount: viewModel.data!.length,
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var item = viewModel.data![index];
                                  return InkWell(
                                    onTap: index == viewModel.setIndex
                                        ? null
                                        : () {
                                            viewModel.getUserInfo(
                                                item.id, index);
                                          },
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 30,
                                              width: 30,
                                              child:
                                                  Image.network(item.picture),
                                            ),
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Name: ${item.firstName + ' ' + item.lastName}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    "ID: ${item.id}",
                                                    style: const TextStyle(
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            index == viewModel.setIndex
                                                ? const SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.black,
                                                    ),
                                                  ) 
                                                : const SizedBox(),
                                            const SizedBox(width: 5),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : const Center(child: Text("No Data")),
                  ),
                  verticalSpaceSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        color: kcDarkGreyColor,
                        onPressed: viewModel.showDialog,
                        child: const Text(
                          'Show Dialog',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      MaterialButton(
                        color: kcDarkGreyColor,
                        onPressed: viewModel.showBottomSheet,
                        child: const Text(
                          'Show Bottom Sheet',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class HomeViewB extends StackedView<HomeViewModel> {
  const HomeViewB({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                verticalSpaceSmall,
                const Text(
                  'Hello, STACKED!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                verticalSpaceMedium,
                const Text(
                  'Hello, STACKED!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      color: kcDarkGreyColor,
                      onPressed: viewModel.showDialog,
                      child: const Text(
                        'Show Dialog',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    MaterialButton(
                      color: kcDarkGreyColor,
                      onPressed: viewModel.showBottomSheet,
                      child: const Text(
                        'Show Bottom Sheet',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
