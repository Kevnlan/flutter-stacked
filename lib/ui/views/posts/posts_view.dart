import 'package:flutter/material.dart';
import 'package:flutter_application_stacked/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'posts_viewmodel.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostsViewModel>.reactive(
      viewModelBuilder: () => PostsViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.getData();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  verticalSpaceSmall,
                  const Text(
                    'All Posts',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  verticalSpaceMedium,
                  Expanded(
                    child: viewModel.isFetching == true
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                        : ListView.separated(
                            itemCount: viewModel.postsList.length,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final post = viewModel.postsList[index];
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          post.image,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      horizontalSpaceMedium,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(post.text),
                                            Row(
                                              children: [
                                                Text('Tags'),
                                                horizontalSpaceTiny,
                                                ...List.generate(
                                                    post.tags.length,
                                                    (index) => Text(
                                                        '${post.tags[index]}, '))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                  ),
                  verticalSpaceSmall,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
