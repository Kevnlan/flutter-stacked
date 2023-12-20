import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'audio_viewmodel.dart';

class AudioView extends StackedView<AudioViewModel> {
  const AudioView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AudioViewModel viewModel,
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
  AudioViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AudioViewModel();
}
