import 'package:flutter/material.dart';
import 'package:flutter_application_stacked/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/image_view.dart';
import 'tabs_viewmodel.dart';

class TabsView extends StatelessWidget {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TabsViewModel>.reactive(
      viewModelBuilder: () => TabsViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.getImages();
      },
      builder: (context, model, child) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              flexibleSpace: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'Approved'),
                      Tab(text: 'Rejected'),
                      Tab(text: 'Shortlisted'),
                    ],
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      verticalSpaceMedium,
                      // Container(
                      //   width: 180,
                      //   height: 139,
                      //   margin: EdgeInsets.all(5),
                      //   child: Image.network(
                      //       'https://pixabay.com/get/g4aa67a69721c275a9c7a5aba56d321311871e55abcc655bf94cb02c3d67284d546ab838e07e2e8f12aa75fb8f164878bc42ac960af82f6dae9f51fcc9720f46f_1280.jpg'),
                      // ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: model.curatedImages.length,
                          separatorBuilder: (context, index) => const Divider(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var image = model.curatedImages[index];
                            return ImageView(
                              image: image,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.directions_transit, size: 350),
                const Icon(Icons.directions_car, size: 350),
                const Icon(Icons.directions_boat, size: 350),
              ],
            ),
          ),
        );
      },
    );
  }
}
