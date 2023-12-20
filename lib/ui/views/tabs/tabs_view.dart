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
                      Expanded(
                        child: ListView.separated(
                          itemCount: model.curatedImages.length,
                          separatorBuilder: (context, index) => const Divider(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var image = model.curatedImages[index];
                            return GestureDetector(
                              onTap: () {
                                model.actionDialog(context,image);
                                // model.displayDialog(image);
                              },
                              child: ImageView(
                                image: image,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      verticalSpaceMedium,
                      Expanded(
                        child: ListView.separated(
                          itemCount: model.approvedImages.length,
                          separatorBuilder: (context, index) => const Divider(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var image = model.approvedImages[index];
                            return ImageView(
                              image: image,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      verticalSpaceMedium,
                      Expanded(
                        child: ListView.separated(
                          itemCount: model.rejectedImages.length,
                          separatorBuilder: (context, index) => const Divider(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var image = model.rejectedImages[index];
                            return ImageView(
                              image: image,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      verticalSpaceMedium,
                      Expanded(
                        child: ListView.separated(
                          itemCount: model.shortlistedImages.length,
                          separatorBuilder: (context, index) => const Divider(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var image = model.shortlistedImages[index];
                            return ImageView(
                              image: image,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
